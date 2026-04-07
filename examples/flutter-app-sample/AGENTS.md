# Repository Guidelines

## Project Scope

This is a sanitized Flutter sample layout for demonstrating `codex-workflow-kit`.
It is not a real app implementation.

## Project Structure

- `lib/features/`
  - feature screens, state, and feature-specific logic
- `lib/shared/widgets/`
  - reusable widgets
- `lib/shared/services/`
  - shared services and adapters
- `lib/l10n/`
  - localization files and generated localization code
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
- Use `high-risk-preflight` before auth, checkout, routing, persistence, or feature-flag changes.
- Use `handoff-retrospective` after real implementation work.

## High-Risk Boundaries

- Do not rewrite auth/session state casually.
- Do not rewrite checkout/payment flow casually.
- Do not change routing/state restoration or persistence logic without a preflight.
- Do not expand one widget or screen request into adjacent feature modules without explicit approval.

## Validation

- The human owner performs final simulator/device/UI verification.
- The agent should keep edits scoped, document risks, and clearly state unverified items.
