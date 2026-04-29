# Expected High-Risk Preflight

## 1. What Is Being Changed

- [ ] UI/presentation only
- [x] Entry handoff/adapter only
- [ ] Low-risk boundary fix
- [ ] Behavior semantics or state flow

Notes:

- The intended change is a page replacement inside the existing subscription entry branch.

## 2. Baseline Checked

- [ ] Current branch checked
- [ ] Main/baseline branch checked
- [ ] Relevant historical behavior checked
- [x] Real control point identified
- [x] Project memory / risk-zone reference checked

Conclusion:

- Implementation can start only after the existing control point and remote flag meaning are confirmed.

## 3. Remote Flags / Hidden Gates

- [x] Remote config / A-B / feature flags involved
- [x] Auth / subscription / completion-state gate involved
- [x] Current semantics must remain unchanged
- [x] This round only performs a minimal change within existing semantics

Notes:

- Remote config should decide the same branch as before.
- Subscriber-state and restore-purchase behavior must remain read-only in this task.

## 4. Smallest Safe Plan

- Replace the returned subscription page inside the existing branch.
- Keep all branch conditions unchanged.
- Keep old fallback pages available unless a later task explicitly removes them.

## 5. Explicit Non-Goals

- Do not rewrite subscription-state rules.
- Do not change restore-purchase behavior.
- Do not simplify remote flag logic.

## 5.1 Allowed Files / Modules

- Subscription entry factory or coordinator.
- New subscription page import or page construction code.

## 5.2 Read-Only Files / Modules

- Entitlement service.
- Purchase/restore service.
- Remote config definitions.
- Old fallback page implementation.

## 6. Regression Paths

1. New user opens subscription flow.
2. Existing subscriber opens the app.
3. Remote flag enabled.
4. Remote flag disabled.
5. Restore purchase path.

## 7. Largest Risk

- What is most likely to be broken: routing users to the wrong subscription page.
- Which business semantics are easiest to accidentally rewrite: remote flag meaning and subscriber-state gating.
- What must be clarified before coding starts: the real branch that owns page selection.

## 8. Conclusion

- [ ] Can start implementation
- [x] Cannot start yet

Reason:

- This sample expects the agent to stop until the actual project control point is confirmed.
