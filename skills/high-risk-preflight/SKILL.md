---
name: high-risk-preflight
description: "Use before code edits when a task touches high-risk flows such as auth, onboarding, subscription/payment, billing, permissions, remote flags, A/B gates, state machines, persistence, or any module the user explicitly marks as risky. Also use when the user asks for a smallest safe plan, regression paths, boundaries, or what must not be changed before implementation."
---

# High Risk Preflight

## Purpose

Prevent a local fix from turning into an unintended behavior rewrite.

## Workflow

1. Read project memory, `references/risk-zones.template.md`, and the relevant current docs/code.
2. Identify what this task is actually changing.
3. Check whether baseline behavior, remote flags, or state-machine semantics must remain unchanged.
4. Fill `assets/preflight-template.md`.
5. State allowed changes, explicit non-goals, smallest safe plan, regression paths, and whether implementation can start.
6. If the task boundary is still unclear, stop and ask for confirmation instead of proceeding with a broad edit.

## Do Not

- Do not turn preflight into a full implementation proposal.
- Do not edit risky logic before the boundary is explicit.
- Do not suggest scope expansion by default.

## Output

Return a preflight summary with a clear "can start / cannot start yet" conclusion.
Prefer a structured checklist and a small regression list over long prose.
