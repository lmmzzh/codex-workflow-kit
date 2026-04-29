# iOS App Sample

This is a sanitized project-layout example, not a real iOS app implementation.

Its purpose is to show where to place:

- `AGENTS.md` for Codex
- `CLAUDE.md` for Claude Code
- project memory files
- local workflow skills
- sample workflow task outputs

## Suggested Layout

```text
ios-app-sample/
├── AGENTS.md
├── CLAUDE.md
├── App/
│   ├── Features/
│   │   ├── Auth/
│   │   ├── Checkout/
│   │   └── Profile/
│   ├── Shared/
│   │   ├── Components/
│   │   └── Services/
│   └── Resources/
├── docs/
│   └── memory/
│       ├── START-HERE.md
│       ├── developer-collaboration-memory.md
│       ├── project-specific-collaboration-memory.md
│       └── skill-maintenance-memory.md
├── .agents/
│   └── skills/
│       ├── current-task-capsule/
│       ├── high-risk-preflight/
│       └── handoff-retrospective/
├── .claude/
│   └── skills/
│       ├── current-task-capsule/
│       ├── high-risk-preflight/
│       └── handoff-retrospective/
└── tasks/
    └── 01-high-risk-subscription-change/
        ├── user-request.md
        ├── expected-capsule.md
        ├── expected-preflight.md
        └── expected-handoff.md
```

## Notes

- `App/Features/Auth` and `App/Features/Checkout` are examples of high-risk flows that should run `high-risk-preflight` before behavior changes.
- `App/Shared/Components` is a safer place for UI-only iteration.
- This sample intentionally does not contain real product code, package identifiers, or business logic.
- The `tasks/` example shows how a small-sounding subscription page change should move through capsule, preflight, and handoff before it becomes an implementation task.
