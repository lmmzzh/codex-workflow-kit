---
name: current-task-capsule
description: "Use before medium or large coding tasks when the user asks to analyze first, clarify the single goal, list non-goals, identify must-read docs, main code locations, acceptance criteria, blockers, implementation order, or resume context. Useful when restarting a long-running project, continuing from handoff docs, or preventing cold-start drift before code edits."
---

# Current Task Capsule

## Purpose

Summarize the current task into one compact context package before implementation starts.

## Workflow

1. Read project memory and the most relevant current handoff/plan docs.
   - Codex projects typically reference memory from `AGENTS.md` and `memory/*`.
   - Claude Code projects typically import memory from `CLAUDE.md` and `memory/*`.
2. Extract only the task-local context needed for this round.
3. Fill `assets/current-task-template.md`.
4. Include one goal, explicit non-goals, code/doc entry points, acceptance criteria, blockers, and next steps.
5. If a high-risk module appears in the task, recommend running `high-risk-preflight` before implementation.

## Do Not

- Do not design a broad refactor in this step.
- Do not paste large chunks of historical docs.
- Do not mix future ideas into the current goal.

## Output

Produce a concise task capsule. If the boundary is still unclear, say that implementation should not start yet.
Prefer short bullets and concrete file/doc entry points over broad narrative.
