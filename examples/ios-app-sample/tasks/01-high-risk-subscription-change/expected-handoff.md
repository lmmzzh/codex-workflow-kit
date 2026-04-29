# Expected Handoff

## 1. Task

- What this round was for:
  - Replace the old subscription page handoff with the new subscription page after preflight confirms the real control point.
- Current runtime:
  - Codex / Claude Code

## 2. What Changed

- The existing subscription entry branch now constructs or returns the new subscription page.
- Existing branch conditions remain unchanged.

## 2.1 Touched Files / Modules

- Subscription entry factory or coordinator.
- New subscription page import or construction site.

## 3. What Is Now Working

- The subscription entry can route to the new page through the existing control point.

## 4. What Was Explicitly Not Changed

- Remote config semantics.
- Subscriber-state checks.
- Restore-purchase flow.
- Old fallback page implementation.

## 5. Risk and Impact Scope

- Main touched layers/files:
  - subscription entry handoff
- Possible affected areas:
  - subscription page presentation
  - review-mode page selection
- Still needs verification:
  - new user path
  - existing subscriber path
  - remote flag on/off
  - restore purchase
- Rollback notes:
  - restore the previous page return inside the same entry branch

## 6. Open Items

- Confirm manual device/UI behavior in the real app.
- Decide in a later task whether old fallback pages should remain.

## 7. Recommended Next Step

- Run the regression paths listed in the preflight.

## 8. Resume Context

- Read these files/docs first:
  - `expected-preflight.md`
  - subscription entry file in the real project
- Avoid repeating these already rejected directions:
  - do not simplify remote flag logic
  - do not delete fallback pages in this task
- Suggested first skill in the next session:
  - `handoff-retrospective` if more implementation work happened
