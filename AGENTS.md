# Repository Guidelines

## Project Scope

This repository is a local workflow kit for Codex-style coding agents.
It provides templates for `AGENTS.md`, long-term memory docs, workflow skills, and validation/maintenance guides.

It is not an agent runtime, not a benchmark project, and not a fully autonomous self-improving agent framework.

## Repository Structure

- `memory/`
  - template memory docs users can adapt into their own repositories
- `skills/`
  - task-focused workflow skills with `SKILL.md`, optional `assets/`, and optional `references/`
- `docs/`
  - adoption, philosophy, validation, maintenance, and privacy guidance

## Editing Rules

- Keep templates project-neutral and easy to copy.
- Do not add private company names, internal module names, secrets, real incident data, or personal machine paths.
- Prefer small single-purpose skills over broad all-in-one skills.
- Keep `SKILL.md` concise and move long templates into `assets/` or `references/`.
- If a skill behavior changes, update related docs and templates in the same round.

## Documentation Style

- Public-facing docs default to English.
- If Chinese docs are needed, add dedicated `*.zh-CN.md` files.
- Prefer concrete templates and checklists over abstract essays.

## Validation

- Before adding a new skill, check that the workflow is repeatable, bounded, and has clear inputs/outputs.
- After editing a skill description, test it on real prompts and evaluate whether auto-trigger behavior improves or gets noisier.
- Do not expand the skill set just to make the repository look complete.

## Privacy

- Never commit private project documents, customer data, credentials, machine-local paths, or logs from real incidents.
- Review `docs/privacy-and-redaction-guide.md` before publishing customized memory or skill files.
