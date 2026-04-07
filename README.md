# codex-workflow-kit

English | [简体中文](./README.zh-CN.md)

A conservative local workflow kit for Codex-style and Claude Code-style coding agents, extracted from real project collaboration practice.

This repository is not an agent runtime, not a model wrapper, and not a fully autonomous coding platform.
It is a template kit for developers who want coding agents to reuse stable workflows, respect project boundaries, and produce maintainable handoffs inside real product work.

The first-class target is a dual setup:

- Codex: `AGENTS.md` + `memory/*` + `.agents/skills/*`
- Claude Code: `CLAUDE.md` + `memory/*` imports + `.claude/skills/*`

The workflow philosophy and skill content are shared; only the runtime entrypoints and skill directories differ.

## Why this exists

Many AI coding setups optimize for "more autonomy" by default.
This project takes a more conservative stance:

- automate repeatable workflows
- keep high-risk business decisions under human review
- write project rules into `AGENTS.md` and memory docs
- turn only stable, bounded tasks into local skills
- verify skill auto-trigger behavior on real tasks before adding more

This repository was shaped by real project usage, not by a benchmark-first or prompt-collection-first workflow.

If your goal is to let an agent rewrite a codebase by itself, this repository is probably not for you.
If your goal is to make a coding agent more predictable and reusable inside a real project, this repository may help.

## Who this is for

This kit is for developers who:

- work in real product codebases where scope control and maintainability matter
- want agents to reuse stable routines instead of re-explaining the same workflow every day
- prefer "bounded automation with human review" over "let the agent do anything"
- care about handoffs, validation, and long-running project context

This kit is probably not for you if you mainly want a one-click autonomous agent platform or a coding benchmark playground.

## Design principles

- Boundaries first
- Repeatable workflows become skills
- Long-term rules stay in memory/context files
- High-risk product decisions stay human-reviewed
- Skill count should stay small until real usage proves otherwise

## What is included

- `AGENTS.md`
  - a repository-level rule template for Codex-style usage
- `CLAUDE.md`
  - a Claude Code project-memory entrypoint that imports the memory templates
- `memory/`
  - long-term collaboration and project-memory templates
- `skills/`
  - shared skill source templates that can be copied to either `.agents/skills/` or `.claude/skills/`:
    - `current-task-capsule`
    - `high-risk-preflight`
    - `handoff-retrospective`
    - `i18n-baseline-rollout`
    - `figma-page-family-planner`
- `docs/`
  - adoption, philosophy, validation, maintenance, redaction, and practice notes

## Core idea

Use a three-layer setup:

1. `AGENTS.md` or `CLAUDE.md` for repository-level hard rules and memory entrypoints
2. `memory/` for long-term working preferences and default routines
3. `skills/` for repeatable task procedures with clear boundaries and outputs, copied into your agent's local skill directory

## Quick start

1. Pick your runtime:
   - Codex
   - Claude Code
   - or both
2. Copy the right root entry files into your project:
   - Codex: `AGENTS.md`
   - Claude Code: `CLAUDE.md`
3. Copy `memory/*.template.md` into your own project `memory/` location, rename them to `.md`, and replace placeholders.
4. Copy selected skill directories:
   - Codex: `skills/<name>/` -> `.agents/skills/<name>/`
   - Claude Code: `skills/<name>/` -> `.claude/skills/<name>/`
5. Start with only 2 or 3 default skills.
6. Run real tasks and use `docs/skill-auto-trigger-validation-checklist.md` to evaluate whether the skills actually help.
7. Use `docs/skill-maintenance-rules.md` before adding more skills.

## Recommended first setup

Start with these defaults in your own project:

- `current-task-capsule` before medium/large tasks
- `high-risk-preflight` before risky flow changes
- `handoff-retrospective` after real implementation work

Keep specialized skills such as `i18n-baseline-rollout` and `figma-page-family-planner` as explicit opt-in workflows first.

## Suggested layout in your project

### Codex

```text
your-project/
├── AGENTS.md
├── memory/
│   ├── START-HERE.md
│   ├── developer-collaboration-memory.md
│   ├── project-specific-collaboration-memory.md
│   └── skill-maintenance-memory.md
└── .agents/
    └── skills/
        ├── current-task-capsule/
        ├── high-risk-preflight/
        └── handoff-retrospective/
```

### Claude Code

```text
your-project/
├── CLAUDE.md
├── memory/
│   ├── START-HERE.md
│   ├── developer-collaboration-memory.md
│   ├── project-specific-collaboration-memory.md
│   └── skill-maintenance-memory.md
└── .claude/
    └── skills/
        ├── current-task-capsule/
        ├── high-risk-preflight/
        └── handoff-retrospective/
```

## Docs to read first

- `docs/adoption-guide.md`
- `docs/why-this-kit-exists.md`
- `docs/privacy-and-redaction-guide.md`
- `docs/skill-auto-trigger-validation-checklist.md`
- `docs/skill-maintenance-rules.md`

## What this project is not

- Not a replacement for Codex, Claude Code, or other coding agents
- Not a benchmark framework
- Not a self-improving autonomous agent runtime
- Not a place to publish private project memory directly

## Privacy warning

Do not copy private incident reports, customer data, internal module names, credentials, personal machine paths, or unreleased product strategy into a public repository.
Read `docs/privacy-and-redaction-guide.md` before publishing any customized memory or skill content.

## License

MIT
