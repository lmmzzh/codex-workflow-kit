# Project-Specific Collaboration Memory

Project name: `flutter-app-sample`

## Repository Structure

- `lib/features/auth`
- `lib/features/checkout`
- `lib/features/profile`
- `lib/shared/widgets`
- `lib/shared/services`
- `lib/l10n`

## High-Risk Areas

- Auth/session state
- Checkout/payment flow
- Routing or state restoration
- Local persistence and migration
- Remote config or feature flags

## Safer Iteration Areas

- Reusable widgets
- Pure presentation adjustments
- Localized copy/layout changes with fixed behavior

## Validation Ownership

- Human verifies simulator/device behavior.
- Agent documents scope, risks, and unverified paths.
