# Claude Code Project Memory Template

This template repository keeps memory files as `*.template.md`.
After copying them into your own project, rename them to `.md` and update these imports to the final paths.

@memory/START-HERE.template.md
@memory/developer-collaboration-memory.template.md
@memory/project-specific-collaboration-memory.template.md
@memory/skill-maintenance-memory.template.md

## Claude Code Compatibility Notes

- Use `./CLAUDE.md` as the project memory entrypoint for Claude Code.
- Keep shared workflow Skills under `.claude/skills/<skill-name>/SKILL.md` in your own project.
- You can reuse the `skills/` templates in this repository by copying each skill directory into `.claude/skills/`.
- Skill names should remain lowercase and hyphenated, and should match the `name` field in `SKILL.md`.
- Claude Code Skills are model-invoked: if the task strongly matches a skill description, Claude may activate it automatically.
- For high-risk work, keep human review on final decisions even when a skill triggers automatically.
