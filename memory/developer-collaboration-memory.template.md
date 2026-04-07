# Developer Collaboration Memory Template

This template stores durable collaboration preferences and default workflows.
Keep it generic, explicit, and project-neutral enough to reuse across agents.

## 1. Working Style

- For medium or large tasks, analyze first, align with current code and product intent, then propose a practical plan before implementation.
- For major refactors, entry-flow changes, or high-risk behavior changes, write a plan document first.
- Prefer clear boundaries, low coupling, maintainability, and rollback-friendly changes.
- Do not expand scope into files, modules, or flows that were not explicitly requested.
- If implementation starts before the task boundary is clear, stop and run `current-task-capsule`.

## 2. Default Workflow Skills

- `current-task-capsule`
  - Use before medium or large tasks to summarize one goal, non-goals, key docs, code locations, acceptance criteria, blockers, and next steps.
- `high-risk-preflight`
  - Use before touching high-risk flows, state machines, payment/auth/subscription logic, persistence, or remote flags.
- `handoff-retrospective`
  - Use after real code changes to summarize what changed, what did not, what was verified, what remains unverified, and what to do next.

Runtime mapping:

- Codex skills live under `.agents/skills/<skill-name>/`.
- Claude Code skills live under `.claude/skills/<skill-name>/`.
- Keep skill directory names equal to the `name` field in `SKILL.md`.

## 3. Human vs Agent Responsibilities

- Human owner:
  - final product judgment
  - high-risk business decisions
  - device/manual verification when applicable
- Agent:
  - code implementation within explicit scope
  - lightweight self-checks
  - docs, handoff, and risk summaries
  - explicit disclosure of assumptions, risks, and unverified items

## 4. Communication Preferences

- Be direct and concrete.
- State assumptions and risks explicitly.
- If a requirement is ambiguous, ask only after checking local context first.
- If a risky shortcut would make maintenance worse, explain why and suggest a safer alternative.

## 5. Documentation Rules

- Keep a small set of long-term baseline docs.
- Archive temporary plans and retrospectives instead of mixing everything in one directory.
- Make handoffs easy to resume from.
- Prefer file paths, exact scope boundaries, and next-step instructions over broad narrative summaries.

## 6. Update Rule

When a new stable preference or project rule emerges, update the project memory after finishing the current task.
