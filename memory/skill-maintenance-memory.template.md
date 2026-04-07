# Skill Maintenance Memory Template

This template controls how aggressively local workflow skills are allowed to trigger or expand.
The default stance is "few stable skills first, explicit human review for risky additions."

## 1. Default Skills

These skills are allowed to trigger automatically when task wording strongly matches:

- `current-task-capsule`
- `high-risk-preflight`
- `handoff-retrospective`

Default behavior:

- These workflows should be attempted naturally when the task wording strongly matches.
- If the model skips one of them occasionally, refine the skill description before adding a duplicate skill.

## 2. Specialized Skills

These skills should usually be invoked explicitly unless the task wording is very clear:

- `i18n-baseline-rollout`
- `figma-page-family-planner`

Default behavior:

- Prefer explicit invocation unless the request is clearly a localization or Figma planning task.
- Do not force specialized skills into unrelated tasks just to make the system look more automated.

## 3. When to Add a New Skill

Add a new skill only if all conditions hold:

- the same task pattern appears repeatedly
- the workflow is stable
- inputs and outputs are clear
- the skill reduces repeated prompting
- it does not encourage scope creep

## 4. When to Edit an Existing Skill Instead

- If auto-trigger occasionally misses, first refine `description`.
- If output shape is awkward, adjust the template in `assets/`.
- If overlap appears, narrow one skill's responsibility instead of creating another broad one.

## 5. When Not to Skillize

- one-off tasks
- pixel-level visual tuning that depends on human screenshots/markup
- high-risk business logic rewrites
- exploratory algorithm experiments
- broad "do everything" workflows

## 6. Review Rule

After adding or changing a skill, test on several real prompts and keep it only if it actually improves task flow.

## 7. Runtime-Specific Notes

- Codex:
  - copy skills into `.agents/skills/<skill-name>/`
  - keep memory docs referenced from `AGENTS.md`
- Claude Code:
  - copy skills into `.claude/skills/<skill-name>/`
  - import this memory file from `CLAUDE.md`
  - restart Claude Code after skill edits if the runtime does not hot-reload skill metadata
