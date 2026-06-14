# PHIDIE CRM Development Baseline

## Product Direction

PHIDIE CRM is being developed as an intelligent customer-management system:

- Customer emails, website inquiries and customer-service messages enter one CRM workspace.
- The system identifies customer type, demand stage and next action.
- Enterprise knowledge-base content is used to generate reply suggestions.
- Suggested replies must remain reviewable and confirmable before they are sent.

## Current Implementation Layer

This repository keeps the EspoCRM core intact and puts PHIDIE-specific work in the custom layer:

- `app/client/custom/` for login and visual brand.
- `app/custom/Espo/Custom/Resources/metadata/` for custom fields and enabled scopes.
- `app/custom/Espo/Custom/Resources/layouts/` for product-specific record layouts.
- `app/custom/Espo/Custom/Resources/i18n/` for PHIDIE naming and Chinese labels.

This makes it safer to upgrade or re-pull EspoCRM later, because the product customizations are not mixed directly into the upstream application code.

## First Custom Fields

The first product data model adds these fields to customer leads and customer messages:

- `customerType`
- `demandStage`
- `nextAction`
- `sourceChannel`
- `aiReplySuggestion`
- `knowledgeBaseEvidence`
- `replyApprovalStatus`

These fields are the placeholder contract for the next backend automation step.

## Next Backend Steps

1. Add ingestion endpoints or scheduled jobs for website inquiries, mailbox intake and customer-service messages.
2. Normalize incoming messages into Lead or Case records.
3. Add classification service for customer type, demand stage and next action.
4. Add knowledge-base retrieval and reply suggestion generation.
5. Require human confirmation before sending generated replies.
