# Developer Collaboration Memory

## Default Workflow

- Analyze before coding for medium/large tasks.
- Keep edits scoped to the requested feature or file.
- Prefer reusable widgets, isolated feature state, and low-coupling services.
- Run `current-task-capsule` before medium/large implementation work.
- Run `high-risk-preflight` before auth, checkout, routing, persistence, or feature-flag edits.
- Run `handoff-retrospective` after real implementation work.

## Human vs Agent

- Human owner:
  - final product decisions
  - simulator/device/UI verification
- Agent:
  - scoped implementation
  - lightweight self-checks
  - risk summary and handoff

## Communication

- Be direct and concrete.
- State non-goals, assumptions, risks, and unverified items explicitly.
