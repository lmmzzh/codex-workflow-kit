---
name: i18n-baseline-rollout
description: "Use for localization tasks involving locale files, language keys, source-language baseline copy, missing translations, placeholder/plural/newline/punctuation/spacing checks, dynamic copy templates, or a controlled rollout across multiple locales. Also use when the user asks to first lock a baseline language, define key scope, and avoid broad i18n edits."
---

# I18N Baseline Rollout

## Purpose

Avoid bulk localization rework by locking the source-language baseline before editing many locale files.

## Workflow

1. Read project memory, the target locale files, and `references/i18n-risk-patterns.template.md`.
2. Identify whether this round is missing-key fill, baseline-copy alignment, dynamic-template repair, or temporary stopgap.
3. Lock the source-language baseline first and state which locale is the baseline.
4. Define the exact key/module scope and explicit non-goals before touching many locale files.
5. Fill `assets/i18n-rollout-template.md`.
6. If placeholders/plurals/word-order/RTL risk are unclear, stop and ask for confirmation instead of bulk editing.
7. If only one locale/module was requested, do not expand to all locales by default.

## Do Not

- Do not expand to all locale files if the user only requested one module or one key group.
- Do not bulk-propagate translations before the baseline copy is stable.
- Do not ignore placeholder/plural/newline/punctuation/spacing/word-order/RTL risks.
- Do not silently rewrite copy tone or product semantics while "fixing translation".

## Output

Produce a rollout checklist with baseline locale, key scope, in-scope/out-of-scope locales, high-risk formatting checks, implementation order, and validation focus.
