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
            ->where([
                'status' => Email::STATUS_ARCHIVED,
            ])
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

        $case = $this->entityManager
            ->getRDBRepositoryByClass(CaseObj::class)
            ->getNew();

        $case->set([
            Field::NAME => $this->buildCaseName($subject),
            'status' => CaseObj::STATUS_NEW,
            'priority' => $classification['priority'],
            'type' => $classification['type'],
            'description' => $this->buildDescription($subject, $from, $body),
            'sourceChannel' => 'Email',
            'sourceEmailId' => $email->getId(),
            'sourceEmailFrom' => $from,
            'customerType' => $classification['customerType'],
            'demandStage' => $classification['demandStage'],
            'nextAction' => $classification['nextAction'],
            'replyApprovalStatus' => 'Needs Review',
            'aiReplySuggestion' => $this->buildReplySuggestion($classification, $knowledgeEvidence),
            'knowledgeBaseEvidence' => $knowledgeEvidence,
            'aiProcessedAt' => (new DateTimeImmutable('now', new DateTimeZone('UTC')))->format('Y-m-d H:i:s'),
        ]);

        $this->entityManager->saveEntity($case);

        return true;
    }

    private function isAlreadyProcessed(Email $email): bool
    {
        return $this->entityManager
            ->getRDBRepositoryByClass(CaseObj::class)
            ->where([
                'sourceEmailId' => $email->getId(),
            ])
            ->findOne() !== null;
    }

    /**
     * @return array{customerType: string, demandStage: string, nextAction: string, priority: string, type: string}
     */
    private function classify(string $text): array
    {
        $lower = strtolower($text);

        if ($this->containsAny($lower, ['售后', '退货', '维修', '投诉', '质量', 'broken', 'return', 'complaint'])) {
            return [
                'customerType' => 'After-Sales',
                'demandStage' => 'Requirement Clarification',
                'nextAction' => 'Escalate Service',
                'priority' => $this->containsAny($lower, ['投诉', 'urgent', 'asap']) ? 'Urgent' : 'High',
                'type' => 'Problem',
            ];
        }

        if ($this->containsAny($lower, ['供应商', '代理', '合作', 'supplier', 'vendor', 'partner'])) {
            return [
                'customerType' => 'Supplier',
                'demandStage' => 'Initial Contact',
                'nextAction' => 'Assign Specialist',
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        if ($this->containsAny($lower, ['老客户', '复购', '订单号', 'order number', 'repeat order'])) {
            return [
                'customerType' => 'Existing Customer',
                'demandStage' => 'Requirement Clarification',
                'nextAction' => 'Follow Up',
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        if ($this->containsAny($lower, ['报价', '价格', 'quote', 'price', 'quotation'])) {
            return [
                'customerType' => 'Potential Buyer',
                'demandStage' => 'Quotation',
                'nextAction' => 'Prepare Quotation',
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        if ($this->containsAny($lower, ['样品', '规格', '参数', 'sample', 'spec', 'requirement'])) {
            return [
                'customerType' => 'New Inquiry',
                'demandStage' => 'Requirement Clarification',
                'nextAction' => 'Confirm Requirement',
                'priority' => 'Normal',
                'type' => 'Question',
            ];
        }

        return [
            'customerType' => 'New Inquiry',
            'demandStage' => 'Initial Contact',
            'nextAction' => 'Send Product Info',
            'priority' => 'Normal',
            'type' => 'Question',
        ];
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
            ->where([
                'status' => KnowledgeBaseArticle::STATUS_PUBLISHED,
            ])
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
            return '未匹配到知识库条目，请先补充产品、报价、售后、交付等知识库内容。';
        }

        $lines = ['匹配到的知识库依据：'];

        foreach ($top as $item) {
            $lines[] = "- {$item['name']}";
        }

        return implode("\n", $lines);
    }

    private function scoreArticle(string $emailText, string $articleText): int
    {
        $keywords = [
            '报价', '价格', '样品', '规格', '交期', '售后', '退货', '投诉',
            'quote', 'price', 'sample', 'spec', 'delivery', 'return', 'complaint',
        ];

        $score = 0;
        $emailLower = strtolower($emailText);
        $articleLower = strtolower($articleText);

        foreach ($keywords as $keyword) {
            $keyword = strtolower($keyword);

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
            return '电子邮件客户消息';
        }

        if (function_exists('mb_substr')) {
            return '邮件：' . mb_substr($subject, 0, 80);
        }

        return '邮件：' . substr($subject, 0, 80);
    }

    private function buildDescription(string $subject, string $from, string $body): string
    {
        return trim("来源邮箱：{$from}\n邮件主题：{$subject}\n\n邮件内容：\n{$body}");
    }

    private function buildReplySuggestion(array $classification, string $knowledgeEvidence): string
    {
        $type = $this->translateCustomerType($classification['customerType']);
        $stage = $this->translateStage($classification['demandStage']);
        $action = $this->translateAction($classification['nextAction']);

        return <<<TEXT
您好，

已收到您的邮件。根据您提供的信息，我们初步判断该客户类型为：{$type}，当前需求阶段为：{$stage}。

建议下一步：{$action}。

请您确认以下信息是否完整：产品/服务需求、数量或规模、交付时间、预算范围、联系人与联系方式。确认后我们将进一步给出更准确的方案或报价。

{$knowledgeEvidence}

请业务人员确认内容后再发送。
TEXT;
    }

    private function translateCustomerType(string $value): string
    {
        return [
            'New Inquiry' => '新询盘',
            'Potential Buyer' => '潜在采购客户',
            'Existing Customer' => '现有客户',
            'Partner' => '渠道伙伴',
            'After-Sales' => '售后客户',
            'Supplier' => '供应商',
            'Other' => '其他',
        ][$value] ?? $value;
    }

    private function translateStage(string $value): string
    {
        return [
            'Initial Contact' => '初次接触',
            'Requirement Clarification' => '需求澄清',
            'Solution Matching' => '方案匹配',
            'Quotation' => '报价阶段',
            'Negotiation' => '谈判阶段',
            'Won' => '已成交',
            'Lost' => '已丢失',
            'On Hold' => '暂缓',
        ][$value] ?? $value;
    }

    private function translateAction(string $value): string
    {
        return [
            'Confirm Requirement' => '确认需求',
            'Send Product Info' => '发送产品资料',
            'Prepare Quotation' => '准备报价',
            'Schedule Meeting' => '预约会议',
            'Assign Specialist' => '分配专员',
            'Follow Up' => '继续跟进',
            'Escalate Service' => '升级客服处理',
            'No Action' => '暂无动作',
        ][$value] ?? $value;
    }
}
