# 项目专属协作记忆模板

项目名：`[YOUR_PROJECT_NAME]`

这个文件用来记录项目事实、模块边界、本地命令和高风险区域。  
如果仓库未来可能公开，不要在这里放私有客户数据、密钥或事故细节。

## 1. 仓库结构

- `[YOUR_MAIN_APP_MODULE]`
- `[YOUR_SHARED_COMPONENTS_DIR]`
- `[YOUR_SHARED_SERVICES_DIR]`
- `[YOUR_TESTS_DIR]`
- `[YOUR_DOCS_DIR]`

## 2. 构建与验证命令

```sh
[YOUR_BUILD_COMMAND]
[YOUR_TEST_COMMAND]
[YOUR_STATIC_CHECK_COMMAND]
```

## 3. 高风险区域

默认把下面这些模块或流程当作高风险：

- `[YOUR_HIGH_RISK_FLOW_1]`
- `[YOUR_HIGH_RISK_FLOW_2]`
- `[YOUR_HIGH_RISK_MODULE_PATH]`

规则：

- 不要随手重写这些流程
- 优先用 wrapper、边界抽取或最小局部修补
- 实现前先跑 `high-risk-preflight`
- 如果用户只点名一个文件或模块，不要顺手改周边模块

## 4. 更适合安全迭代的区域

- `[YOUR_LOW_RISK_UI_LAYER]`
- `[YOUR_COMPONENT_LAYER]`
- `[YOUR_ENTRY_ADAPTER_LAYER]`

## 5. 代码风格与架构偏好

- `[YOUR_NAMING_STYLE]`
- `[YOUR_COMPONENTIZATION_POLICY]`
- `[YOUR_COMMENT_POLICY]`
- `[YOUR_PERFORMANCE_POLICY]`
- `[YOUR_ERROR_HANDLING_POLICY]`

## 6. 验证归属

- 人工手动验证：
  - `[YOUR_DEVICE_OR_E2E_CHECKS]`
- Agent 自检：
  - `[YOUR_LIGHTWEIGHT_STATIC_CHECKS]`

## 7. 未经明确批准不要碰

- `[YOUR_FILE_OR_MODULE_1]`
- `[YOUR_FILE_OR_MODULE_2]`
- `[YOUR_REMOTE_FLAG_OR_STATE_MACHINE]`

## 8. 当前发布 / 运行时约束

- `[YOUR_TARGET_PLATFORM_OR_RUNTIME]`
- `[YOUR_MINIMUM_SUPPORTED_VERSION]`
- `[YOUR_DEPLOYMENT_OR_REVIEW_CONSTRAINTS]`
