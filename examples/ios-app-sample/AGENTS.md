# Repository Guidelines

## Project Scope

This is a sanitized iOS sample layout for demonstrating `codex-workflow-kit`.
It is not a real app implementation.

## Project Structure

- `App/Features/`
  - feature screens and feature-specific logic
- `App/Shared/Components/`
  - reusable UI components
- `App/Shared/Services/`
  - shared services and adapters
- `App/Resources/`
  - localized strings, assets, and bundled resources
- `memory/`
  - project memory docs

## Default Memory

Read these files before substantial work:

1. `memory/START-HERE.md`
2. `memory/developer-collaboration-memory.md`
3. `memory/project-specific-collaboration-memory.md`
4. `memory/skill-maintenance-memory.md`

## Default Skills

- Use `current-task-capsule` before medium or large tasks.
- Use `high-risk-preflight` before auth, checkout, persistence, or remote-flag changes.
- Use `handoff-retrospective` after real implementation work.

## High-Risk Boundaries

- Do not rewrite auth/session flow casually.
- Do not rewrite checkout/subscription flow casually.
- Do not modify persistence or migration logic without a preflight.
- Do not expand one screen request into neighboring feature modules without explicit approval.

## Validation

- The human owner performs final device/UI verification.
- The agent should keep edits scoped, document risks, and clearly state unverified items.
