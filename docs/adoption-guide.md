# Adoption Guide

The fastest path is not to understand every template first.
The fastest path is to generate the minimum workflow skeleton, ask the agent to adapt the project-specific memory, and then run one real task.

## Path A: Bootstrap Setup

1. Clone this repository locally.
2. Run:

```sh
./scripts/init.sh --target /path/to/your-project
```

3. Choose:
   - `Codex`
   - `Claude Code`
   - or `both`
4. Review the generated files in your project:
   - `AGENTS.md` and/or `CLAUDE.md`
   - `memory/*.md`
   - runtime skill directories
   - `INIT-SUMMARY.md`
   - `NEXT-PROMPT.md`
5. Manually confirm:
   - guessed build/test/static-check commands
   - risky flows and do-not-touch modules
   - runtime choice and default skill set
6. Paste `NEXT-PROMPT.md` into your coding agent.
7. Let the agent improve the first project-specific memory draft without editing code.
8. Run one real task before adding any specialized skill.

## What To Do Right After Init

Open `INIT-SUMMARY.md` first. It shows what was generated, what was detected, and what still needs human confirmation.

Then open `NEXT-PROMPT.md` and paste it into Codex or Claude Code.
That first prompt should produce a project-adaptation pass, not a code change.

The expected first output should tell you:

- which memory and entry files the agent read
- which repository facts were detected
- which risky areas are only guesses and need confirmation
- whether the first real task can start

If the agent starts editing code during this first adaptation pass, stop it and rerun with the "do not edit code" instruction from `NEXT-PROMPT.md`.

## Path B: Manual Setup

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

- Prefer `scripts/init.sh` for first-time setup if you want the minimum skeleton quickly.
- Do not install every skill on day one.
- Keep project memory explicit about which skills should be automatic and which should be manually invoked.
- If a skill's auto-trigger is noisy, narrow its description instead of adding another overlapping skill.
- Read `docs/why-this-kit-exists.md` if you want the practical background behind the default split.

## First Task Advice

Choose a first task that is real enough to need project context, but not dangerous enough to rewrite core business logic.

Good first tasks:

- a small UI fix with a clear file or screen boundary
- a documentation update tied to the real project structure
- a low-risk refactor with fixed behavior

Avoid as first tasks:

- payment or subscription rewrites
- auth flow changes
- database migrations
- large state-machine refactors

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
