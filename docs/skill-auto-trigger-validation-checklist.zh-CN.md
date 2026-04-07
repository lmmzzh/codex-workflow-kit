# Skill 自动触发验证清单

验证的重点不是“在理想触发词下能不能命中”，而是“在真实任务描述里有没有帮助”。

这份清单同时适用于：

- Codex 本地 skills
- Claude Code 的 project/personal skills

## 建议先测的 skill

- `current-task-capsule`
- `high-risk-preflight`
- `handoff-retrospective`

## A / B / C 评级

- A：
  - 不用显式点名，skill 工作流自然出现，而且输出已经够用
- B：
  - 模型方向对了，但还需要你补一句提醒
- C：
  - 工作流没有出现，整体表现还是普通聊天式响应

## 测试话术

### current-task-capsule

- “我想继续这个页面重构，先分析清楚再写代码。”
- “先别开始实现，先帮我把这轮目标和边界收一下。”

期望信号：

- 唯一目标
- 明确不改范围
- 必读文档
- 代码入口
- 验收标准
- 下一步顺序

### high-risk-preflight

- “这个入口流程风险有点高，先看能改什么、不能改什么，再动代码。”
- “我想先拿一个订阅/登录链路的最小安全方案。”

期望信号：

- 允许改动 vs 不改范围
- 基线/开关/状态判断
- 最小安全方案
- 关键回归路径
- 能不能开始实现的结论

### handoff-retrospective

- “帮我整理一下这轮 handoff。”
- “把这轮改了什么、没改什么、风险和下一步写一下。”

期望信号：

- 改了什么
- 没改什么
- 已验证 / 未验证
- 风险
- 下一次从哪接着看

## 记录模板

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

## 运行时专项检查

### Codex

- 确认 skill 在 `.agents/skills/<skill-name>/SKILL.md`
- 如果本地运行时不会热更新 skill 元数据，重开一个新会话再测
- 确认项目 memory 里已经明确哪些 workflow 是默认动作，哪些是手动调用

### Claude Code

- 确认 skill 在 `.claude/skills/<skill-name>/SKILL.md` 或 `~/.claude/skills/<skill-name>/SKILL.md`
- 确认项目根目录有 `CLAUDE.md`，并按需要导入了 memory 文件
- 修改 skill 之后，重启 Claude Code 再测，因为很多变更要下次启动才生效
- 如果 skill 不触发，先把 `description` 写得更具体，并检查 YAML frontmatter 格式
