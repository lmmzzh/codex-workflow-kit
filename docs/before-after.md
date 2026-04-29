# Before / After

This kit does not make a coding agent fully autonomous on day one.
The first visible change is more practical: the agent starts with clearer boundaries, pauses before risky edits, and leaves a usable handoff.

## Scenario 1: Starting a Medium Task

Before:

- You ask the agent to continue a page refactor.
- It starts reading random files or edits before the task boundary is clear.
- You have to repeat the goal, non-goals, relevant docs, and acceptance criteria.

After:

- `current-task-capsule` makes the agent summarize one goal, explicit non-goals, entry files, acceptance criteria, blockers, and next steps.
- If the task boundary is still unclear, implementation should not start yet.
- The first output is a task capsule, not a code diff.

What changes in the project:

- `AGENTS.md` or `CLAUDE.md` tells the agent to read the project memory first.
- `memory/` holds the stable collaboration rules.
- `.agents/skills/current-task-capsule/` or `.claude/skills/current-task-capsule/` gives the agent a repeatable startup routine.

## Scenario 2: Touching a Risky Flow

Before:

- You ask for a local subscription, auth, onboarding, persistence, or entry-flow change.
- The agent may change the surrounding flow semantics while trying to make the local fix work.
- Remote flags, fallback paths, or old behavior can be changed without being called out.

After:

- `high-risk-preflight` makes the agent write down what can change and what must not change.
- It separates presentation-only changes, adapter changes, boundary fixes, and behavior-semantics changes.
- If the baseline behavior or control point is unclear, the agent should stop before editing code.

What changes in the project:

- `memory/project-specific-collaboration-memory.md` lists high-risk areas and do-not-touch boundaries.
- The preflight output names allowed files, read-only files, regression paths, and the largest risk.
- A local fix is less likely to become an accidental flow rewrite.

## Scenario 3: Resuming After Real Implementation

Before:

- A session ends after real code changes.
- The next session has to infer what changed from git diff, chat history, or memory.
- Unverified items and rejected directions are easy to lose.

After:

- `handoff-retrospective` records what changed, what did not change, what works, what remains unverified, and where to resume.
- The next session can read the handoff before opening code.
- The project owner can see whether the work is ready for manual verification.

What changes in the project:

- The workflow expects a handoff after real implementation work.
- The handoff names touched files, untouched boundaries, risks, rollback notes, and suggested next steps.
- The next agent starts from a concrete resume point instead of reconstructing context from scratch.

## The First Useful Result

The first useful result is not "the agent writes more code".

The first useful result is:

- medium tasks start with a task boundary
- risky tasks pause for a preflight
- finished work leaves a handoff
- the human owner can still decide high-risk business behavior

That is the first loop this kit tries to make reliable.
