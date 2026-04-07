# START-HERE

## Runtime Entry

- Codex:
  - Keep this file under your project memory docs and make sure `AGENTS.md` tells the agent to read it first.
- Claude Code:
  - Import this file from `./CLAUDE.md` with `@memory/START-HERE.md`.

## Template Repo Note

This repository stores memory files as `*.template.md`.
When you copy them into your own project, rename them to `.md` and keep the read order below unchanged.

## Read Order

Read these memory files before substantial work, in this order:

1. `memory/developer-collaboration-memory.md`
2. `memory/project-specific-collaboration-memory.md`
3. `memory/skill-maintenance-memory.md`

After reading them, summarize:

- which files were read
- what the current task boundary is
- whether any default workflow skill should be used first

Do not start implementation before this summary if the task is medium or large.

## Expected Behavior

- For a medium/large task, `current-task-capsule` should usually run first.
- For high-risk flows, `high-risk-preflight` should happen before code edits.
- After real implementation work, `handoff-retrospective` should happen before the session ends.
