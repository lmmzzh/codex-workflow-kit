# Skill Maintenance Rules

## When to Add a New Skill

Add a new skill only if:

- the same task pattern appears repeatedly
- the workflow is stable
- inputs and outputs are clear
- the skill reduces repeated prompting
- it does not encourage scope creep

## When to Edit an Existing Skill Instead

- If auto-trigger misses sometimes, refine `description`.
- If output format is awkward, update `assets/*.md`.
- If two skills overlap, narrow one scope instead of creating a broader third skill.

## When Not to Skillize

- one-off tasks
- high-risk business logic rewrites
- pixel-level visual tuning driven by human screenshots
- algorithm experiments
- broad all-in-one workflows

## Degrade or Remove a Skill

- If a default skill becomes noisy, stop treating it as a default workflow first.
- If it still misfires, narrow its description.
- If it still has no real value, remove or archive it.

## Recommended Pace

- Keep a small number of stable default skills.
- Add specialized skills one or two at a time.
- Prefer fewer skills with clear boundaries over a large overlapping set.
