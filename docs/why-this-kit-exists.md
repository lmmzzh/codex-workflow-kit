# Why This Kit Exists

This repository did not start as a public template project.
It started as a practical response to repeated friction in real project work with coding agents.

## The problem pattern

Across medium and large implementation rounds, the same issues kept showing up:

- too much context had to be re-explained at the start of a task
- risky flow changes needed explicit boundary checks before code edits
- useful session results were easy to lose without a clean handoff
- adding more prompts did not solve the real coordination problem

The bottleneck was not "how to make the model smarter".
The bottleneck was how to make the workflow more predictable inside a real codebase.

## The shift in approach

The practical answer became a three-layer structure:

1. repository-level rules
2. durable collaboration memory
3. a very small set of repeatable workflow skills

Instead of turning everything into a skill, the split became:

- long-term rules stay in memory
- only stable, bounded workflows become skills
- high-risk decisions stay under human review

## Why only a few default skills

The first useful default set was intentionally small:

- `current-task-capsule`
- `high-risk-preflight`
- `handoff-retrospective`

These three covered the highest-frequency coordination work:

- start a medium/large task without drifting
- stop risky edits from expanding silently
- make each implementation round resumable

Specialized workflows such as localization rollout or Figma family planning stayed opt-in first.

## Why validation and maintenance matter

A skill is not useful just because it exists.
It has to prove that it helps on real tasks.

That is why this kit includes:

- an auto-trigger validation checklist
- explicit rules for when to add, edit, narrow, or remove a skill

The goal is not to collect many skills.
The goal is to keep a small local workflow layer that is actually usable.

## What this repository tries to offer

This kit is for developers who want a coding agent to be:

- more predictable
- more reusable
- easier to resume
- safer around risky project areas

It is not trying to be a full autonomous agent platform.
It is trying to package a conservative, field-tested collaboration pattern into something another developer can copy and adapt.
