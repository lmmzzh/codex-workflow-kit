# Flutter App Sample

This is a sanitized project-layout example, not a real Flutter app implementation.

Its purpose is to show where to place:

- `AGENTS.md` for Codex
- `CLAUDE.md` for Claude Code
- project memory files
- local workflow skills

## Suggested Layout

```text
flutter-app-sample/
├── AGENTS.md
├── CLAUDE.md
├── lib/
│   ├── features/
│   │   ├── auth/
│   │   ├── checkout/
│   │   └── profile/
│   ├── shared/
│   │   ├── widgets/
│   │   └── services/
│   └── l10n/
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
└── .claude/
    └── skills/
        ├── current-task-capsule/
        ├── high-risk-preflight/
        └── handoff-retrospective/
```

## Notes

- `lib/features/auth` and `lib/features/checkout` are high-risk behavior areas.
- `lib/shared/widgets` is a safer UI-only iteration area.
- `lib/l10n` is where `i18n-baseline-rollout` becomes useful for controlled localization changes.
- This sample intentionally does not contain real product logic or package identifiers.
