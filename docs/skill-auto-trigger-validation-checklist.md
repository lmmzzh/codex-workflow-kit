# Skill Auto-Trigger Validation Checklist

Validate whether a skill helps on real prompts, not idealized trigger phrases.

This applies to both:

- Codex local skills
- Claude Code project/personal skills

## Skills to Test First

- `current-task-capsule`
- `high-risk-preflight`
- `handoff-retrospective`

## A / B / C Rating

- A:
  - The skill workflow appears naturally without explicit invocation and the output is usable.
- B:
  - The model moves in the right direction but needs one reminder.
- C:
  - The workflow does not appear and the response behaves like plain chat.

## Test Prompts

### current-task-capsule

- "I want to continue this page refactor. Analyze first before coding."
- "Don't start implementation yet. Clarify this round's goal and boundaries first."

Expected signs:

- one goal
- explicit non-goals
- must-read docs
- code entry points
- acceptance criteria
- next steps

### high-risk-preflight

- "This entry flow may be risky. Check what can and cannot be changed before editing code."
- "I want the smallest safe plan for this subscription/auth flow."

Expected signs:

- allowed changes vs non-goals
- baseline/flag/state-machine checks
- smallest safe plan
- regression paths
- can-start/cannot-start conclusion

### handoff-retrospective

- "Summarize this round's handoff."
- "Write what changed, what did not, risks, and next steps."

Expected signs:

- what changed
- what stayed untouched
- verified vs unverified
- risks
- next entry point

## Record Template

```md
- Date:
- Task:
- Target skill:
- Explicitly invoked: yes / no
- Natural workflow appeared: yes / no
- Rating: A / B / C
- What worked:
- What still required a reminder:
```

## Runtime-Specific Checks

### Codex

- Verify the skill exists under `.agents/skills/<skill-name>/SKILL.md`.
- Restart or start a fresh session if your local runtime does not reload skill metadata live.
- Check whether your project memory explicitly lists which workflows should be default and which should be manual.

### Claude Code

- Verify the skill exists under `.claude/skills/<skill-name>/SKILL.md` or `~/.claude/skills/<skill-name>/SKILL.md`.
- Verify `CLAUDE.md` is present in the project root and imports your memory files if needed.
- Restart Claude Code after editing a skill, because skill changes take effect on next start.
- If a skill does not trigger, first make its `description` more specific and verify YAML frontmatter syntax.
