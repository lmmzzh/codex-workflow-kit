#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

TARGET_DIR=""
RUNTIME=""
OVERWRITE="false"
GENERATE_SUMMARY="true"

print_usage() {
  cat <<'EOF'
Usage:
  ./scripts/init.sh --target /path/to/project [--runtime codex|claude|both] [--overwrite]

Options:
  --target PATH     Target project directory.
  --runtime VALUE   One of: codex, claude, both.
  --overwrite       Overwrite existing generated files.
  --no-summary      Skip INIT-SUMMARY.md generation.
  --help            Show this help message.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET_DIR="${2:-}"
      shift 2
      ;;
    --runtime)
      RUNTIME="${2:-}"
      shift 2
      ;;
    --overwrite)
      OVERWRITE="true"
      shift
      ;;
    --no-summary)
      GENERATE_SUMMARY="false"
      shift
      ;;
    --help|-h)
      print_usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      print_usage
      exit 1
      ;;
  esac
done

prompt_runtime() {
  echo "Choose runtime:"
  echo "  1) Codex"
  echo "  2) Claude Code"
  echo "  3) Both"
  printf "> "
  read -r choice
  case "$choice" in
    1) RUNTIME="codex" ;;
    2) RUNTIME="claude" ;;
    3) RUNTIME="both" ;;
    *)
      echo "Invalid choice." >&2
      exit 1
      ;;
  esac
}

if [[ -z "${TARGET_DIR}" ]]; then
  echo "--target is required." >&2
  print_usage
  exit 1
fi

TARGET_DIR="$(cd "${TARGET_DIR}" && pwd)"

if [[ ! -d "${TARGET_DIR}" ]]; then
  echo "Target directory does not exist: ${TARGET_DIR}" >&2
  exit 1
fi

if [[ -z "${RUNTIME}" ]]; then
  prompt_runtime
fi

case "${RUNTIME}" in
  codex|claude|both) ;;
  *)
    echo "Invalid runtime: ${RUNTIME}" >&2
    exit 1
    ;;
esac

PROJECT_NAME="$(basename "${TARGET_DIR}")"

has_file() {
  [[ -e "${TARGET_DIR}/$1" ]]
}

has_glob() {
  compgen -G "${TARGET_DIR}/$1" > /dev/null
}

detect_tech_stack() {
  if has_file "pubspec.yaml"; then
    echo "flutter"
  elif has_file "Package.swift"; then
    echo "swift-package"
  elif has_file "Podfile" || has_glob "*.xcodeproj" || has_glob "*.xcworkspace"; then
    echo "ios"
  elif has_file "Cargo.toml"; then
    echo "rust"
  elif has_file "package.json"; then
    echo "node"
  elif has_file "pyproject.toml" || has_file "requirements.txt"; then
    echo "python"
  elif has_file "go.mod"; then
    echo "go"
  else
    echo "generic"
  fi
}

TECH_STACK="$(detect_tech_stack)"

build_commands() {
  case "${TECH_STACK}" in
    flutter)
      printf '%s\n' "flutter pub get" "flutter test" "flutter analyze"
      ;;
    ios)
      printf '%s\n' "xcodebuild -list" "xcodebuild test" "xcodebuild analyze"
      ;;
    swift-package)
      printf '%s\n' "swift build" "swift test" "swift package diagnose-api-breaking-changes"
      ;;
    rust)
      printf '%s\n' "cargo build" "cargo test" "cargo clippy"
      ;;
    node)
      printf '%s\n' "npm run build" "npm test" "npm run lint"
      ;;
    python)
      printf '%s\n' "python -m build" "pytest" "ruff check ."
      ;;
    go)
      printf '%s\n' "go build ./..." "go test ./..." "go vet ./..."
      ;;
    *)
      printf '%s\n' "[YOUR_BUILD_COMMAND]" "[YOUR_TEST_COMMAND]" "[YOUR_STATIC_CHECK_COMMAND]"
      ;;
  esac
}

join_bullets() {
  local prefix="$1"
  shift
  local item
  for item in "$@"; do
    if [[ -n "${item}" ]]; then
      printf '%s%s\n' "${prefix}" "${item}"
    fi
  done
}

collect_repo_structure() {
  case "${TECH_STACK}" in
    flutter)
      printf '%s\n' \
        "lib/features" \
        "lib/shared/widgets" \
        "lib/shared/services" \
        "lib/l10n" \
        "test" \
        "docs"
      ;;
    ios)
      printf '%s\n' \
        "App/Features" \
        "App/Shared/Components" \
        "App/Shared/Services" \
        "App/Resources" \
        "Tests" \
        "docs"
      ;;
    rust)
      printf '%s\n' \
        "src" \
        "crates" \
        "tests" \
        "docs"
      ;;
    node)
      printf '%s\n' \
        "src" \
        "app" \
        "components" \
        "services" \
        "tests" \
        "docs"
      ;;
    python)
      printf '%s\n' \
        "src" \
        "app" \
        "tests" \
        "docs"
      ;;
    go)
      printf '%s\n' \
        "cmd" \
        "internal" \
        "pkg" \
        "tests" \
        "docs"
      ;;
    *)
      printf '%s\n' \
        "src" \
        "app" \
        "tests" \
        "docs"
      ;;
  esac
}

collect_risky_areas() {
  case "${TECH_STACK}" in
    flutter)
      printf '%s\n' \
        "Auth/session state" \
        "Checkout/payment flow" \
        "Routing or state restoration" \
        "Local persistence and migration" \
        "Remote config or feature flags"
      ;;
    ios)
      printf '%s\n' \
        "Auth/session flow" \
        "Checkout/subscription flow" \
        "Persistence or migration logic" \
        "Remote config or feature flags"
      ;;
    rust)
      printf '%s\n' \
        "Unsafe or FFI boundaries" \
        "Persistence and migration logic" \
        "Authentication or authorization flow" \
        "Concurrency or background job coordination"
      ;;
    node)
      printf '%s\n' \
        "Authentication/session flow" \
        "Checkout/subscription flow" \
        "Database migration logic" \
        "Background jobs or queue consumers" \
        "Remote flags or rollout gates"
      ;;
    python)
      printf '%s\n' \
        "Authentication/session flow" \
        "Persistence and migration logic" \
        "Task queues or background workers" \
        "External service adapters with side effects"
      ;;
    go)
      printf '%s\n' \
        "Authentication/session flow" \
        "Persistence and migration logic" \
        "Background workers and schedulers" \
        "Feature flags or rollout gates"
      ;;
    *)
      printf '%s\n' \
        "Authentication/session flow" \
        "Persistence and migration logic" \
        "Checkout/subscription flow" \
        "Remote flags or rollout gates"
      ;;
  esac
}

collect_safer_areas() {
  case "${TECH_STACK}" in
    flutter)
      printf '%s\n' \
        "Reusable widgets" \
        "Pure presentation adjustments" \
        "Localized copy/layout changes with fixed behavior"
      ;;
    ios)
      printf '%s\n' \
        "Reusable UI components" \
        "Pure presentation adjustments" \
        "Screen-level layout changes without behavior changes"
      ;;
    *)
      printf '%s\n' \
        "Reusable UI/components" \
        "Pure presentation adjustments" \
        "Small local refactors with fixed behavior"
      ;;
  esac
}

BUILD_COMMANDS=()
while IFS= read -r line; do
  BUILD_COMMANDS+=("${line}")
done < <(build_commands)

REPO_STRUCTURE=()
while IFS= read -r line; do
  REPO_STRUCTURE+=("${line}")
done < <(collect_repo_structure)

RISKY_AREAS=()
while IFS= read -r line; do
  RISKY_AREAS+=("${line}")
done < <(collect_risky_areas)

SAFER_AREAS=()
while IFS= read -r line; do
  SAFER_AREAS+=("${line}")
done < <(collect_safer_areas)

write_file() {
  local path="$1"
  local content="$2"
  mkdir -p "$(dirname "${path}")"
  if [[ -e "${path}" && "${OVERWRITE}" != "true" ]]; then
    echo "Skipping existing file: ${path}"
    return
  fi
  printf '%s' "${content}" > "${path}"
  echo "Wrote ${path}"
}

copy_skill() {
  local skill_name="$1"
  local target_base="$2"
  mkdir -p "${target_base}"
  local destination="${target_base}/${skill_name}"
  if [[ -e "${destination}" && "${OVERWRITE}" != "true" ]]; then
    echo "Skipping existing skill: ${destination}"
    return
  fi
  rm -rf "${destination}"
  cp -R "${ROOT_DIR}/skills/${skill_name}" "${destination}"
  echo "Installed skill ${skill_name} -> ${destination}"
}

generate_agents_md() {
  cat <<EOF
# Repository Guidelines

## Project Scope

This repository uses \`codex-workflow-kit\` as a local workflow layer for coding agents.
The goal is to help the agent respect project boundaries, reuse stable routines, and leave maintainable handoffs inside real product work.

## Project Structure

$(join_bullets "- \`" "${REPO_STRUCTURE[@]}" | sed 's/$/\`/')
- \`memory/\`
  - project memory docs used before substantial work

## Default Memory

Read these files before substantial work:

1. \`memory/START-HERE.md\`
2. \`memory/developer-collaboration-memory.md\`
3. \`memory/project-specific-collaboration-memory.md\`
4. \`memory/skill-maintenance-memory.md\`

## Default Skills

- Use \`current-task-capsule\` before medium or large tasks.
- Use \`high-risk-preflight\` before touching risky flows, persistence, subscriptions, auth, or remote flags.
- Use \`handoff-retrospective\` after real implementation work.

## High-Risk Boundaries

$(join_bullets "- " "${RISKY_AREAS[@]}")

## Validation

- The human owner performs final manual/UI/device verification when needed.
- The agent should keep edits scoped, document risks, and clearly state unverified items.
EOF
}

generate_claude_md() {
  cat <<EOF
# Claude Code Project Memory

Read these memory files before substantial work:

@memory/START-HERE.md
@memory/developer-collaboration-memory.md
@memory/project-specific-collaboration-memory.md
@memory/skill-maintenance-memory.md

## Default Skills

- \`current-task-capsule\`
- \`high-risk-preflight\`
- \`handoff-retrospective\`

## Runtime Notes

- Keep project Skills under \`.claude/skills/<skill-name>/SKILL.md\`.
- Start with only the default 3 skills.
- Keep high-risk product decisions under human review.
EOF
}

copy_template_as_md() {
  local source="$1"
  local destination="$2"
  if [[ -e "${destination}" && "${OVERWRITE}" != "true" ]]; then
    echo "Skipping existing file: ${destination}"
    return
  fi
  mkdir -p "$(dirname "${destination}")"
  cp "${source}" "${destination}"
  echo "Wrote ${destination}"
}

generate_project_memory() {
  cat <<EOF
# Project-Specific Collaboration Memory

Project name: \`${PROJECT_NAME}\`

## Repository Structure

$(join_bullets "- \`" "${REPO_STRUCTURE[@]}" | sed 's/$/\`/')

## Build and Validation Commands

\`\`\`sh
${BUILD_COMMANDS[0]}
${BUILD_COMMANDS[1]}
${BUILD_COMMANDS[2]}
\`\`\`

## High-Risk Areas

$(join_bullets "- " "${RISKY_AREAS[@]}")

Rules:

- Do not rewrite these flows casually.
- Prefer wrapper, boundary extraction, or minimal local fixes.
- Run \`high-risk-preflight\` before implementation.
- If the user only asked for one file or module, do not modify neighboring modules without explicit approval.

## Safer Iteration Areas

$(join_bullets "- " "${SAFER_AREAS[@]}")

## Verification Ownership

- Human manual verification:
  - confirm device/UI behavior when applicable
- Agent self-checks:
  - lightweight static checks
  - explicit scope, risk, and unverified-path summaries

## Current Release / Runtime Constraints

- \`${TECH_STACK}\` project detected from local files
- Replace guessed commands or boundaries if they do not match your real project
- Add project-specific do-not-touch modules after the first real task review
EOF
}

generate_init_summary() {
  cat <<EOF
# INIT SUMMARY

Project: \`${PROJECT_NAME}\`
Runtime: \`${RUNTIME}\`
Detected tech stack: \`${TECH_STACK}\`

## Generated Files

$( [[ "${RUNTIME}" == "codex" || "${RUNTIME}" == "both" ]] && printf '%s\n' "- \`AGENTS.md\`" )
$( [[ "${RUNTIME}" == "claude" || "${RUNTIME}" == "both" ]] && printf '%s\n' "- \`CLAUDE.md\`" )
- \`memory/START-HERE.md\`
- \`memory/developer-collaboration-memory.md\`
- \`memory/project-specific-collaboration-memory.md\`
- \`memory/skill-maintenance-memory.md\`
- \`NEXT-PROMPT.md\`
$( [[ "${RUNTIME}" == "codex" || "${RUNTIME}" == "both" ]] && printf '%s\n' "- \`.agents/skills/current-task-capsule/\`" "- \`.agents/skills/high-risk-preflight/\`" "- \`.agents/skills/handoff-retrospective/\`" )
$( [[ "${RUNTIME}" == "claude" || "${RUNTIME}" == "both" ]] && printf '%s\n' "- \`.claude/skills/current-task-capsule/\`" "- \`.claude/skills/high-risk-preflight/\`" "- \`.claude/skills/handoff-retrospective/\`" )

## Detected Repository Structure Candidates

$(join_bullets "- " "${REPO_STRUCTURE[@]}")

## Commands To Review

- Build: \`${BUILD_COMMANDS[0]}\`
- Test: \`${BUILD_COMMANDS[1]}\`
- Static checks: \`${BUILD_COMMANDS[2]}\`

## Manual Confirmation Checklist

1. Review \`memory/project-specific-collaboration-memory.md\` and replace guessed repo paths or high-risk areas.
2. Confirm build, test, and static-check commands.
3. Add explicit do-not-touch modules if your project has payments, auth, migrations, or state machines.
4. Keep only the default 3 skills until real tasks prove you need more.
5. Paste \`NEXT-PROMPT.md\` into your coding agent and ask it to adapt project memory without editing code.
6. Run one medium task and verify whether the agent now reads memory first, runs capsule when needed, and produces a handoff after real changes.

## What To Do Next

1. Open \`NEXT-PROMPT.md\`.
2. Paste it into Codex or Claude Code.
3. Confirm which detected facts are correct and which guessed boundaries need edits.
4. Only then run the first real implementation task.

## First Task Recommendation

Choose a task that is real enough to need project context, but not dangerous enough to rewrite core business logic.

Good first tasks:

- small UI fix with clear scope
- documentation update tied to actual project structure
- low-risk refactor with no behavior change

Avoid as first tasks:

- payment / subscription rewrite
- auth flow change
- database migration
- large state-machine refactor
EOF
}

generate_next_prompt() {
  cat <<EOF
# NEXT PROMPT

You are working inside project \`${PROJECT_NAME}\`.

Do not edit code in this first pass.

First, read the workflow entrypoints and memory files generated by \`codex-workflow-kit\`:

$( [[ "${RUNTIME}" == "codex" || "${RUNTIME}" == "both" ]] && printf '%s\n' "- \`AGENTS.md\`" )
$( [[ "${RUNTIME}" == "claude" || "${RUNTIME}" == "both" ]] && printf '%s\n' "- \`CLAUDE.md\`" )
- \`memory/START-HERE.md\`
- \`memory/developer-collaboration-memory.md\`
- \`memory/project-specific-collaboration-memory.md\`
- \`memory/skill-maintenance-memory.md\`

Then inspect the repository lightly and improve the first project-specific memory draft.

Please produce a short setup report with:

1. Which workflow files you read.
2. Which repository facts you detected.
3. Which build, test, and static-check commands look likely.
4. Which high-risk areas are confirmed by local files and which are only guesses.
5. Which modules or flows should be treated as do-not-touch until I confirm them.
6. One recommended first real task for testing this workflow.

Important constraints:

- Do not modify source code.
- Do not add new skills.
- Do not claim guessed boundaries as confirmed facts.
- If something is unclear, mark it as needing human confirmation.
- Keep the output practical enough that I can edit \`memory/project-specific-collaboration-memory.md\` from it.

Detected by the init script:

- Runtime: \`${RUNTIME}\`
- Tech stack: \`${TECH_STACK}\`
- Build command candidate: \`${BUILD_COMMANDS[0]}\`
- Test command candidate: \`${BUILD_COMMANDS[1]}\`
- Static-check candidate: \`${BUILD_COMMANDS[2]}\`
EOF
}

mkdir -p "${TARGET_DIR}/memory"

copy_template_as_md "${ROOT_DIR}/memory/START-HERE.template.md" "${TARGET_DIR}/memory/START-HERE.md"
copy_template_as_md "${ROOT_DIR}/memory/developer-collaboration-memory.template.md" "${TARGET_DIR}/memory/developer-collaboration-memory.md"
copy_template_as_md "${ROOT_DIR}/memory/skill-maintenance-memory.template.md" "${TARGET_DIR}/memory/skill-maintenance-memory.md"
write_file "${TARGET_DIR}/memory/project-specific-collaboration-memory.md" "$(generate_project_memory)"
write_file "${TARGET_DIR}/NEXT-PROMPT.md" "$(generate_next_prompt)"

if [[ "${RUNTIME}" == "codex" || "${RUNTIME}" == "both" ]]; then
  write_file "${TARGET_DIR}/AGENTS.md" "$(generate_agents_md)"
  copy_skill "current-task-capsule" "${TARGET_DIR}/.agents/skills"
  copy_skill "high-risk-preflight" "${TARGET_DIR}/.agents/skills"
  copy_skill "handoff-retrospective" "${TARGET_DIR}/.agents/skills"
fi

if [[ "${RUNTIME}" == "claude" || "${RUNTIME}" == "both" ]]; then
  write_file "${TARGET_DIR}/CLAUDE.md" "$(generate_claude_md)"
  copy_skill "current-task-capsule" "${TARGET_DIR}/.claude/skills"
  copy_skill "high-risk-preflight" "${TARGET_DIR}/.claude/skills"
  copy_skill "handoff-retrospective" "${TARGET_DIR}/.claude/skills"
fi

if [[ "${GENERATE_SUMMARY}" == "true" ]]; then
  write_file "${TARGET_DIR}/INIT-SUMMARY.md" "$(generate_init_summary)"
fi

echo
echo "Bootstrap complete for ${PROJECT_NAME}."
echo "Next:"
echo "  1) Review INIT-SUMMARY.md"
echo "  2) Paste NEXT-PROMPT.md into your coding agent"
echo "  3) Confirm high-risk areas before the first real task"
