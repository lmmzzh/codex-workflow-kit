# Case Study: A Risky iOS Flow Change

This is a sanitized example.
It does not describe a real product, class name, module path, remote flag, or private repository.

## The Situation

An old iOS app has a subscription entry flow.

The product request sounds small:

> Replace the old subscription page with a new page.

In a real app, that "small" request may sit behind:

- remote config
- review-mode logic
- existing subscriber checks
- restore-purchase behavior
- fallback pages used by older flows

If a coding agent starts by editing the entry logic directly, it can accidentally change more than the page handoff.

## Before Using This Kit

A typical request might be:

> Help me replace the old subscription page with the new one.

The agent may jump straight into implementation:

- find the entry controller
- change the branch that returns the old page
- simplify surrounding conditions
- delete or bypass fallback behavior that looks unused

That can work in a happy path, but it creates a real risk:

- review-mode behavior may change
- subscribed users may see the wrong page
- remote flag semantics may be rewritten
- restore-purchase paths may be affected
- the owner may not notice the behavior change until manual testing

The problem is not that the agent cannot code.
The problem is that it starts from the wrong level.

## After Using This Kit

The same request should start with a workflow sequence:

1. `current-task-capsule`
2. `high-risk-preflight`
3. implementation only after the boundary is explicit
4. `handoff-retrospective` after real code changes

## Expected Task Capsule

The first useful output is not a code diff.
It is a short task boundary:

- Goal: replace the old subscription page handoff with the new page.
- Non-goals:
  - do not change remote flag semantics
  - do not change subscriber-state checks
  - do not change restore-purchase behavior
  - do not delete old fallback pages
- Entry points:
  - subscription entry factory
  - current old subscription page
  - new subscription page
- Acceptance:
  - old control point still decides when the subscription page appears
  - only the returned page changes
  - existing fallback paths remain available

## Expected High-Risk Preflight

The preflight should make the real boundary visible:

- Allowed change:
  - replace the page handoff inside the existing branch
- Not allowed:
  - rewrite remote config conditions
  - rewrite subscription status rules
  - delete old pages
  - change restore-purchase flow
- Regression paths:
  - new user enters subscription flow
  - existing subscriber opens the app
  - remote flag is on
  - remote flag is off
  - restore purchase is triggered

If the agent cannot identify the real control point, implementation should not start yet.

## Expected Handoff

After implementation, the handoff should say:

- which entry point changed
- which old behavior was intentionally left untouched
- which paths still need manual device testing
- how to roll back to the old page handoff
- where the next session should start

## What This Proves

This kit does not make the agent more reckless.
It makes the first few steps more explicit.

The useful change is:

- local page replacement stays local
- high-risk flow semantics stay human-reviewed
- the next session can resume from a clear handoff

That is the kind of real-project loop this workflow kit is designed to protect.
