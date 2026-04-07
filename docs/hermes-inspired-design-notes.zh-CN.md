# 受 Hermes 启发的设计说明

这套 kit 借鉴了 Hermes 这类 agent framework 的一部分思路，但并不打算复刻它们的 runtime。

## 借鉴了什么

- 渐进披露：
  - `SKILL.md` 保持精简
  - 模板放到 `assets/`
  - 更长的参考资料放到 `references/`
- 分层上下文：
  - 用 `AGENTS.md` 或 `CLAUDE.md` 承载仓库级规则和记忆入口
  - 用 memory 文档保存长期协作偏好
  - 用 skills 承载可重复流程
- skill 生命周期意识：
  - 验证触发效果
  - 迭代 `description`
  - 避免 skill 无边界膨胀

## 没有照搬什么

- 完整 agent runtime
- 消息网关
- cron 自动化
- 默认自动自我改写 skill 的循环
- RL / 训练基础设施

## 为什么

这里的目标是做一层小而稳的本地工作流层，服务的是谨慎型 coding agent 使用方式，不是做平台级的自治 agent 系统。

## 运行时兼容范围

这份 draft 故意把目标控制在一个可共享的工作流层上，可以映射到：

- Codex 风格仓库：
  - `AGENTS.md`
  - `.agents/skills/`
- Claude Code 风格仓库：
  - `CLAUDE.md`
  - `.claude/skills/`

这样做的目的，是在不维护两套 skill 实现的前提下，尽量让工作流模板可以复用。
