# Adoption Guide

## Minimal Path

1. Choose your runtime:
   - Codex
   - Claude Code
   - or both
2. Copy the matching project entrypoint into your project root:
   - Codex: `AGENTS.md`
   - Claude Code: `CLAUDE.md`
3. Copy `memory/*.template.md` into your own project `memory/` location, rename them to `.md`, and replace placeholders.
4. Start with only these skills:
   - `current-task-capsule`
   - `high-risk-preflight`
   - `handoff-retrospective`
5. Copy those skills into the runtime-specific directory:
   - Codex: `.agents/skills/`
   - Claude Code: `.claude/skills/`
6. Add specialized skills only after the default ones are stable.
7. Validate behavior with `docs/skill-auto-trigger-validation-checklist.md`.

## Recommended Project Layout

### Codex

```text
your-project/
├── AGENTS.md
├── memory/
└── .agents/
    └── skills/
```

### Claude Code

```text
your-project/
├── CLAUDE.md
├── memory/
└── .claude/
    └── skills/
```

## Suggested Defaults

- Use `current-task-capsule` before medium or large tasks.
- Use `high-risk-preflight` before risky flow changes.
- Use `handoff-retrospective` after real implementation work.

## Rollout Advice

- Do not install every skill on day one.
- Keep project memory explicit about which skills should be automatic and which should be manually invoked.
- If a skill's auto-trigger is noisy, narrow its description instead of adding another overlapping skill.
- Read `docs/why-this-kit-exists.md` if you want the practical background behind the default split.

## Runtime Notes

- Codex path convention:
  - project rules in `AGENTS.md`
  - project Skills copied into `.agents/skills/<skill-name>/`
- Claude Code path convention:
  - project memory in `./CLAUDE.md`
  - project Skills copied into `.claude/skills/<skill-name>/`
  - memory files can be imported from `CLAUDE.md` with `@path/to/file`
- Shared principle:
  - the skill body and workflow can stay the same
  - only the entrypoint file and skill directory differ by runtime
