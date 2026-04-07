---
name: figma-page-family-planner
description: "Use when a UI task involves Figma screens, page groups, page-family planning, shared component extraction, implementation order, reusable UI boundaries, or separating phase-1 structure work from phase-2 pixel calibration. Also use when the user asks to plan multiple related screens before coding instead of editing one screen at a time."
---

# Figma Page Family Planner

## Purpose

Plan Figma UI work by page families instead of editing one screen at a time.

## Workflow

1. Identify the page group, target code area, and UI goal.
2. Group screens into page families and assign a stable family name to each group.
3. Summarize shared layout, reusable components, shared assets, and key differences.
4. Decide what belongs to phase 1 structure/component work and what belongs to phase 2 visual calibration.
5. Fill `assets/page-family-plan-template.md`.
6. If the same component appears across families, note whether it should be extracted now or postponed.
7. If implementation risk touches navigation/state/data flow, recommend running `high-risk-preflight` before coding.

## Do Not

- Do not promise pixel-perfect implementation before page-family boundaries are clear.
- Do not mix structural refactor and pixel tuning into one uncontrolled round.
- Do not infer hidden product behavior from Figma visuals alone if state semantics are unclear.
- Do not create shared components too early if the family-level differences are still unknown.

## Output

Produce a page-family implementation plan with family grouping, shared components, differences, recommended order, phase split, and explicit non-goals.
