# Hermes-Inspired Design Notes

This kit borrows a few ideas from agent frameworks such as Hermes, but does not try to replicate their runtime.

## Borrowed Ideas

- Progressive disclosure:
  - keep `SKILL.md` concise
  - put templates in `assets/`
  - put longer references in `references/`
- Layered context:
  - use `AGENTS.md` or `CLAUDE.md` for repository rules and memory entrypoints
  - use memory docs for durable collaboration preferences
  - use skills for repeatable procedures
- Skill lifecycle thinking:
  - validate trigger behavior
  - refine descriptions
  - avoid unbounded skill growth

## Not Copied

- full agent runtime
- messaging gateways
- cron automation
- self-modifying skill loops by default
- RL/training infrastructure

## Why

The target here is a small local workflow layer for conservative coding-agent usage, not a platform-scale autonomous agent system.

## Runtime Compatibility Scope

This draft intentionally aims for a shared workflow layer that can be mapped into:

- Codex-style repositories:
  - `AGENTS.md`
  - `.agents/skills/`
- Claude Code-style repositories:
  - `CLAUDE.md`
  - `.claude/skills/`

The intent is to keep the workflow templates reusable without maintaining two separate skill implementations.
