# Expected Current Task Capsule

## 1. One Goal

- Replace the old subscription page handoff with the new subscription page.

## 2. Explicit Non-Goals

- Do not change remote config semantics.
- Do not change subscriber-state checks.
- Do not change restore-purchase behavior.
- Do not delete old fallback pages.

## 3. Code and Doc Entry Points

- Main files:
  - subscription entry factory or coordinator
  - old subscription page
  - new subscription page
- Reference docs:
  - project-specific memory
  - subscription or checkout flow notes, if present
- Read-only baseline files:
  - remote flag configuration
  - restore-purchase service
  - subscription entitlement service

## 4. Acceptance Criteria

- The existing control point still decides when the subscription page appears.
- Only the page handoff changes inside the existing branch.
- Existing fallback paths remain available.

## 5. Blockers / Unknowns

- Real subscription entry point must be identified.
- Remote flag behavior must be confirmed before implementation.

## 6. Recommended Next Steps

1. Run `high-risk-preflight`.
2. Confirm allowed files and read-only files.
3. Implement only after the control point is clear.

## 7. Should Run High-Risk Preflight?

- Yes.
- Reason: this task touches subscription entry behavior and may involve remote flags or subscriber state.
