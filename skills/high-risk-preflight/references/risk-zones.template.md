# Risk Zones Template

Replace these placeholders with your real project modules.
Keep this file project-specific in your private repository, and keep this public template neutral.

Treat these areas as high risk by default:

- `[AUTH_OR_ONBOARDING_FLOW]`
- `[PAYMENT_OR_SUBSCRIPTION_FLOW]`
- `[STATE_MACHINE_MODULE]`
- `[DATA_PERSISTENCE_LAYER]`
- `[REMOTE_FLAG_OR_AB_TEST_LAYER]`
- `[OTHER_HIGH_BLAST_RADIUS_MODULES]`

Examples of common high-risk categories:

- auth/session lifecycle
- checkout/payment/subscription state
- onboarding or first-run entry routing
- persistent user data and migration logic
- remote configuration or staged rollout switches

Default rules:

- Check baseline behavior first.
- Prefer minimal wrapper or boundary fixes.
- Write explicit non-goals before implementation.
- Do not start risky edits if there is no small safe plan.
- If only one module was requested, do not include adjacent high-risk modules by default.
