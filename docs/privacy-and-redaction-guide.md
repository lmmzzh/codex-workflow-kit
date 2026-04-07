# Privacy and Redaction Guide

Before publishing a customized memory file, skill, handoff, or example project, check that it does not contain:

- real project names or private product names
- internal package names, class names, API names, or remote flag names
- customer data, credentials, device identifiers, tokens, or secrets
- personal machine paths, usernames, or local workspace paths
- incident details, launch schedules, product strategy, or private roadmaps
- enough combined clues to reveal a private codebase or unreleased product

## Safer Replacement Pattern

Use placeholders such as:

- `[YOUR_PROJECT_NAME]`
- `[YOUR_MODULE_PATH]`
- `[YOUR_HIGH_RISK_FLOW]`
- `[YOUR_BUILD_COMMAND]`
- `[YOUR_REMOTE_FLAG_NAME]`
- `[YOUR_LOCALIZATION_FILES]`
- `[YOUR_FIGMA_SOURCE]`

## Example Rewriting

Replace project-specific examples like a real subscription or onboarding implementation with neutral examples such as:

- checkout flow
- auth onboarding
- billing status sync
- localization rollout
- profile settings

When in doubt, keep only the workflow shape and remove the business-specific details.
