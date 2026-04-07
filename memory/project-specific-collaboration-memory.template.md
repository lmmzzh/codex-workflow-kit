# Project-Specific Collaboration Memory Template

Project name: `[YOUR_PROJECT_NAME]`

Use this file for project facts, module boundaries, local commands, and high-risk areas.
Do not put private customer data, credentials, or incident details here if the repository may become public.

## 1. Repository Structure

- `[YOUR_MAIN_APP_MODULE]`
- `[YOUR_SHARED_COMPONENTS_DIR]`
- `[YOUR_SHARED_SERVICES_DIR]`
- `[YOUR_TESTS_DIR]`
- `[YOUR_DOCS_DIR]`

## 2. Build and Validation Commands

```sh
[YOUR_BUILD_COMMAND]
[YOUR_TEST_COMMAND]
[YOUR_STATIC_CHECK_COMMAND]
```

## 3. High-Risk Areas

Treat these modules/flows as high risk by default:

- `[YOUR_HIGH_RISK_FLOW_1]`
- `[YOUR_HIGH_RISK_FLOW_2]`
- `[YOUR_HIGH_RISK_MODULE_PATH]`

Rules:

- Do not rewrite these flows casually.
- Prefer wrapper, boundary extraction, or minimal local fixes.
- Run `high-risk-preflight` before implementation.
- If the user only asked for one file/module, do not modify neighboring modules without explicit approval.

## 4. Safer Iteration Areas

- `[YOUR_LOW_RISK_UI_LAYER]`
- `[YOUR_COMPONENT_LAYER]`
- `[YOUR_ENTRY_ADAPTER_LAYER]`

## 5. Code Style and Architecture Preferences

- `[YOUR_NAMING_STYLE]`
- `[YOUR_COMPONENTIZATION_POLICY]`
- `[YOUR_COMMENT_POLICY]`
- `[YOUR_PERFORMANCE_POLICY]`
- `[YOUR_ERROR_HANDLING_POLICY]`

## 6. Verification Ownership

- Human manual verification:
  - `[YOUR_DEVICE_OR_E2E_CHECKS]`
- Agent self-checks:
  - `[YOUR_LIGHTWEIGHT_STATIC_CHECKS]`

## 7. Do-Not-Touch Without Explicit Approval

- `[YOUR_FILE_OR_MODULE_1]`
- `[YOUR_FILE_OR_MODULE_2]`
- `[YOUR_REMOTE_FLAG_OR_STATE_MACHINE]`

## 8. Current Release / Runtime Constraints

- `[YOUR_TARGET_PLATFORM_OR_RUNTIME]`
- `[YOUR_MINIMUM_SUPPORTED_VERSION]`
- `[YOUR_DEPLOYMENT_OR_REVIEW_CONSTRAINTS]`
