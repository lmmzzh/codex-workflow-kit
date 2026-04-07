# Project-Specific Collaboration Memory

Project name: `ios-app-sample`

## Repository Structure

- `App/Features/Auth`
- `App/Features/Checkout`
- `App/Features/Profile`
- `App/Shared/Components`
- `App/Shared/Services`
- `App/Resources`

## High-Risk Areas

- Auth/session flow
- Checkout/subscription flow
- Persistence or migration logic
- Remote config or feature-flag gates

## Safer Iteration Areas

- Reusable UI components
- Pure presentation adjustments
- Screen-level layout changes without behavior changes

## Validation Ownership

- Human verifies simulator/device behavior.
- Agent documents scope, risks, and unverified paths.
