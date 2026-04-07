# 隐私与脱敏指南

如果你准备公开自己定制过的 memory、skill、handoff 或示例项目，先确认里面没有以下内容：

- 真实项目名或私有产品名
- 内部包名、类名、API 名、远程开关名
- 客户数据、凭证、设备标识、token 或其他密钥
- 本机路径、用户名、工作目录路径
- 事故细节、上线节奏、产品策略、私有 roadmap
- 足以把私有代码库或未发布产品反推出来的组合线索

## 更安全的占位写法

可以替换成下面这类占位符：

- `[YOUR_PROJECT_NAME]`
- `[YOUR_MODULE_PATH]`
- `[YOUR_HIGH_RISK_FLOW]`
- `[YOUR_BUILD_COMMAND]`
- `[YOUR_REMOTE_FLAG_NAME]`
- `[YOUR_LOCALIZATION_FILES]`
- `[YOUR_FIGMA_SOURCE]`

## 改写示例

如果原始示例里出现了很具体的业务实现，比如真实的订阅链路或 onboarding 逻辑，改写成更中性的例子会更安全，比如：

- checkout flow
- auth onboarding
- billing status sync
- localization rollout
- profile settings

拿不准的时候，优先只保留工作流形状，把业务细节去掉。
