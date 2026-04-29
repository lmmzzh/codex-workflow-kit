# codex-workflow-kit

English | [简体中文](./README.zh-CN.md)

A workflow kit that helps coding agents work your way inside real projects.

It turns repeatable project routines into reusable workflows, while keeping boundaries, high-risk decisions, and handoffs explicit.

A conservative local workflow kit for Codex-style and Claude Code-style coding agents, extracted from real project collaboration practice.

This repository is not an agent runtime, not a model wrapper, and not a fully autonomous coding platform.
It is a template kit for developers who want coding agents to reuse stable workflows, respect project boundaries, and produce maintainable handoffs inside real product work.

It is useful when your coding agent keeps running into the same project-level problems:

- It starts coding before the real task boundary is clear.
- It changes a risky flow when you only asked for a local page or adapter change.
- It finishes a round of work without leaving enough context for the next session.

The kit's first job is not to make the agent "more autonomous".
Its first job is to make the first working loop more predictable: clarify the task, preflight risky changes, and leave a handoff.

The first-class target is a dual setup:

- Codex: `AGENTS.md` + `memory/*` + `.agents/skills/*`
- Claude Code: `CLAUDE.md` + `memory/*` imports + `.claude/skills/*`

The workflow philosophy and skill content are shared; only the runtime entrypoints and skill directories differ.

## 3-minute setup

```sh
./scripts/init.sh --target /path/to/your-project
```

The init script will:

1. let you choose `Codex`, `Claude Code`, or `both`
2. scaffold the minimum workflow files into your project
3. install the default 3 skills
4. generate an `INIT-SUMMARY.md` checklist so you know what to confirm manually
5. generate a `NEXT-PROMPT.md` you can paste into your coding agent for the first project adaptation round

The first version is intentionally conservative:

- it bootstraps a usable draft
- it does not try to fully understand your product or codebase
- it keeps high-risk boundaries as human-confirmed input

After setup, open `NEXT-PROMPT.md` in the target project and paste it into Codex or Claude Code.
That first prompt asks the agent to read the generated workflow files, improve the project-specific memory, and identify risky areas without editing code.

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

### Path A: bootstrap setup

1. Clone this repository locally.
2. Run:

```sh
./scripts/init.sh --target /path/to/your-project
```

3. Review the generated files in your project:
   - `AGENTS.md` and/or `CLAUDE.md`
   - `memory/*.md`
   - `.agents/skills/` or `.claude/skills/`
   - `INIT-SUMMARY.md`
   - `NEXT-PROMPT.md`
4. Confirm guessed build commands, risky areas, and do-not-touch boundaries.
5. Paste `NEXT-PROMPT.md` into your coding agent and let it adapt the first project-specific memory draft without editing code.
6. Start with only the default 3 skills.
7. Run one real task and evaluate whether the flow is already more predictable.

### Path B: manual setup

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
- `docs/before-after.md`
- `docs/case-study-ios-high-risk-flow.md`
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

This repository shares workflow structure, not private project content.
If you publish your own memory, skill, or handoff files, remove project names, internal module names, machine-local paths, secrets, incident details, and unreleased strategy first.
Read `docs/privacy-and-redaction-guide.md` before publishing any customized memory or skill content.

## License

MIT
