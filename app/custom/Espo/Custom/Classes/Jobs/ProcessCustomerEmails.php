<?php

namespace Espo\Custom\Classes\Jobs;

use DateTimeImmutable;
use DateTimeZone;
use Espo\Core\Job\JobDataLess;
use Espo\Core\Name\Field;
use Espo\Core\Utils\Log;
use Espo\Entities\Email;
use Espo\Modules\Crm\Entities\CaseObj;
use Espo\Modules\Crm\Entities\KnowledgeBaseArticle;
use Espo\ORM\EntityManager;
use Throwable;

class ProcessCustomerEmails implements JobDataLess
{
    private const LIMIT = 20;

    public function __construct(
        private EntityManager $entityManager,
        private Log $log,
    ) {}

    public function run(): void
    {
        $emails = $this->entityManager
            ->getRDBRepositoryByClass(Email::class)
            ->where(['status' => Email::STATUS_ARCHIVED])
            ->order(Field::CREATED_AT, 'DESC')
            ->limit(0, self::LIMIT)
            ->sth()
            ->find();

        $createdCount = 0;

        foreach ($emails as $email) {
            try {
                if ($this->processEmail($email)) {
                    $createdCount++;
                }
            } catch (Throwable $e) {
                $this->log->error(
                    "ProcessCustomerEmails failed for email {$email->getId()}: {$e->getMessage()}",
                    ['exception' => $e]
                );
            }
        }

        $this->log->info("ProcessCustomerEmails completed. Created cases: {$createdCount}.");
    }

    private function processEmail(Email $email): bool
    {
        if ($this->isAlreadyProcessed($email)) {
            return false;
        }

        $subject = trim((string) ($email->get('subject') ?? ''));
        $from = trim((string) ($email->get('fromAddress') ?? $email->get('fromString') ?? ''));
        $body = trim((string) ($email->get('bodyPlain') ?? strip_tags((string) ($email->get('body') ?? ''))));
        $text = trim($subject . "\n" . $from . "\n" . $body);

        if ($text === '') {
            return false;
        }

        $classification = $this->classify($text);
        $knowledgeEvidence = $this->findKnowledgeEvidence($text);
        $now = new DateTimeImmutable('now', new DateTimeZone('UTC'));

        $case = $this->entityManager
            ->getRDBRepositoryByClass(CaseObj::class)
            ->getNew();

        $case->set([
            Field::NAME => $this->buildCaseName($subject),
            'status' => CaseObj::STATUS_NEW,
            'priority' => $classification['priority'],
            'type' => $classification['type'],
            'description' => $this->buildDescription($subject, $from, $body),
            'inquiryDate' => $now->format('Y-m-d'),
            'sourceCountry' => $classification['sourceCountry'],
            'sourceChannel' => 'Email',
            'sourceEmailId' => $email->getId(),
            'sourceEmailFrom' => $from,
            'customerType' => $classification['customerType'],
            'inquiryValue' => $classification['inquiryValue'],
            'salesStage' => $classification['salesStage'],
            'demandStage' => $classification['demandStage'],
            'nextAction' => $classification['nextAction'],
            'replyApprovalStatus' => 'Needs Review',
            'aiReplySuggestion' => $this->buildReplySuggestion($classification, $knowledgeEvidence),
            'knowledgeBaseEvidence' => $knowledgeEvidence,
            'aiProcessedAt' => $now->format('Y-m-d H:i:s'),
        ]);

        $this->entityManager->saveEntity($case);

        return true;
    }

    private function isAlreadyProcessed(Email $email): bool
    {
        return $this->entityManager
            ->getRDBRepositoryByClass(CaseObj::class)
            ->where(['sourceEmailId' => $email->getId()])
            ->findOne() !== null;
    }

    /**
     * @return array{
     *   customerType: string,
     *   inquiryValue: string,
     *   salesStage: string,
     *   demandStage: string,
     *   nextAction: string,
     *   sourceCountry: string,
     *   priority: string,
     *   type: string
     * }
     */
    private function classify(string $text): array
    {
        $lower = strtolower($text);
        $country = $this->detectCountry($lower);

        if ($this->containsAny($lower, ['complaint', 'return', 'refund', 'broken', 'quality issue', 'after-sales'])) {
            return [
                'customerType' => 'After-Sales',
                'inquiryValue' => 'None',
                'salesStage' => 'L6 No Reply',
                'demandStage' => 'Requirement Clarification',
                'nextAction' => 'Escalate Service',
                'sourceCountry' => $country,
                'priority' => $this->containsAny($lower, ['urgent', 'asap']) ? 'Urgent' : 'High',
                'type' => 'Problem',
            ];
        }

        if ($this->containsAny($lower, ['supplier', 'vendor', 'agent', 'distributor', 'partner'])) {
            return [
                'customerType' => 'Supplier',
                'inquiryValue' => 'Low',
                'salesStage' => 'L1 New Inquiry',
                'demandStage' => 'Initial Contact',
                'nextAction' => 'Assign Specialist',
                'sourceCountry' => $country,
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        if ($this->containsAny($lower, ['quote', 'price', 'quotation', 'rfq', 'bulk order', 'order quantity'])) {
            return [
                'customerType' => 'Potential Customer',
                'inquiryValue' => $this->containsAny($lower, ['bulk order', 'container', '10000', 'large quantity']) ? 'High' : 'Medium',
                'salesStage' => 'L4 Proposal Quotation',
                'demandStage' => 'Quotation',
                'nextAction' => 'Prepare Quotation',
                'sourceCountry' => $country,
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        if ($this->containsAny($lower, ['sample', 'spec', 'requirement', 'catalog', 'product details'])) {
            return [
                'customerType' => 'New Inquiry',
                'inquiryValue' => 'Medium',
                'salesStage' => 'L3 Requirement Confirmed',
                'demandStage' => 'Requirement Clarification',
                'nextAction' => 'Confirm Requirement',
                'sourceCountry' => $country,
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        return [
            'customerType' => 'New Inquiry',
            'inquiryValue' => 'Low',
            'salesStage' => 'L1 New Inquiry',
            'demandStage' => 'Initial Contact',
            'nextAction' => 'Send Product Info',
            'sourceCountry' => $country,
            'priority' => 'Normal',
            'type' => 'Question',
        ];
    }

    private function detectCountry(string $text): string
    {
        $map = [
            'usa' => 'United States',
            'united states' => 'United States',
            'america' => 'United States',
            'uk' => 'United Kingdom',
            'united kingdom' => 'United Kingdom',
            'germany' => 'Germany',
            'france' => 'France',
            'italy' => 'Italy',
            'spain' => 'Spain',
            'india' => 'India',
            'pakistan' => 'Pakistan',
            'bangladesh' => 'Bangladesh',
            'vietnam' => 'Vietnam',
            'thailand' => 'Thailand',
            'indonesia' => 'Indonesia',
            'brazil' => 'Brazil',
            'mexico' => 'Mexico',
            'canada' => 'Canada',
            'australia' => 'Australia',
            'china' => 'China',
        ];

        foreach ($map as $needle => $country) {
            if (str_contains($text, $needle)) {
                return $country;
            }
        }

        return '';
    }

    private function containsAny(string $text, array $keywords): bool
    {
        foreach ($keywords as $keyword) {
            if (str_contains($text, strtolower($keyword))) {
                return true;
            }
        }

        return false;
    }

    private function findKnowledgeEvidence(string $text): string
    {
        $articles = $this->entityManager
            ->getRDBRepositoryByClass(KnowledgeBaseArticle::class)
            ->where(['status' => KnowledgeBaseArticle::STATUS_PUBLISHED])
            ->order(Field::CREATED_AT, 'DESC')
            ->limit(0, 30)
            ->find();

        $matched = [];

        foreach ($articles as $article) {
            $articleText = trim((string) $article->getName() . "\n" . (string) $article->get('bodyPlain'));

            if ($articleText === '') {
                continue;
            }

            $score = $this->scoreArticle($text, $articleText);

            if ($score > 0) {
                $matched[] = [
                    'name' => (string) $article->getName(),
                    'score' => $score,
                ];
            }
        }

        usort($matched, static fn(array $a, array $b): int => $b['score'] <=> $a['score']);

        $top = array_slice($matched, 0, 3);

        if ($top === []) {
            return 'No matching knowledge-base article found yet. Add product, quotation, delivery, and after-sales articles.';
        }

        $lines = ['Matched knowledge-base evidence:'];

        foreach ($top as $item) {
            $lines[] = "- {$item['name']}";
        }

        return implode("\n", $lines);
    }

    private function scoreArticle(string $emailText, string $articleText): int
    {
        $keywords = [
            'quote', 'price', 'sample', 'spec', 'delivery', 'return', 'complaint', 'catalog', 'warranty',
        ];

        $score = 0;
        $emailLower = strtolower($emailText);
        $articleLower = strtolower($articleText);

        foreach ($keywords as $keyword) {
            if (str_contains($emailLower, $keyword) && str_contains($articleLower, $keyword)) {
                $score++;
            }
        }

        return $score;
    }

    private function buildCaseName(string $subject): string
    {
        $subject = trim($subject);

        if ($subject === '') {
            return 'Email Customer Message';
        }

        if (function_exists('mb_substr')) {
            return 'Email: ' . mb_substr($subject, 0, 80);
        }

        return 'Email: ' . substr($subject, 0, 80);
    }

    private function buildDescription(string $subject, string $from, string $body): string
    {
        return trim("Source email: {$from}\nSubject: {$subject}\n\nMessage:\n{$body}");
    }

    private function buildReplySuggestion(array $classification, string $knowledgeEvidence): string
    {
        return <<<TEXT
Hello,

Thank you for your message. We have received your inquiry and made an initial classification:

Customer type: {$classification['customerType']}
Inquiry value: {$classification['inquiryValue']}
Sales stage: {$classification['salesStage']}

Suggested next step: {$classification['nextAction']}.

Please confirm the product requirements, quantity, target delivery time, destination country, and contact information. After confirmation, we will provide a more accurate proposal or quotation.

{$knowledgeEvidence}

Please review and confirm before sending.
TEXT;
    }
}
