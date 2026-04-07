# 接入指南

## 最小接入路径

1. 先确定你的运行时：
   - Codex
   - Claude Code
   - 或两者都用
2. 把对应的项目入口文件复制到项目根目录：
   - Codex：`AGENTS.md`
   - Claude Code：`CLAUDE.md`
3. 把 `memory/*.template.md` 复制到你自己的项目 `memory/` 目录里，改名为 `.md` 后再替换占位符。
4. 第一阶段只先接这 3 个 skill：
   - `current-task-capsule`
   - `high-risk-preflight`
   - `handoff-retrospective`
5. 把这些 skill 复制到运行时对应目录：
   - Codex：`.agents/skills/`
   - Claude Code：`.claude/skills/`
6. 默认 skill 稳定之前，不要急着继续加专项 skill。
7. 用 `docs/skill-auto-trigger-validation-checklist.md` 验证这套流程是不是真的有收益。

## 推荐目录结构

### Codex

```text
your-project/
├── AGENTS.md
├── memory/
└── .agents/
    └── skills/
```

### Claude Code

```text
your-project/
├── CLAUDE.md
├── memory/
└── .claude/
    └── skills/
```

## 建议默认配置

- 中大型任务前使用 `current-task-capsule`
- 高风险链路改动前使用 `high-risk-preflight`
- 真正有实现改动后使用 `handoff-retrospective`

## 推进建议

- 第一天不要把所有 skill 都装进去
- 在项目 memory 里明确哪些 skill 属于默认动作，哪些属于手动调用
- 如果某个 skill 自动触发过于吵，先收窄它的 `description`，不要立刻再造一个重叠 skill
- 如果你想先理解这套默认拆法为什么成立，先看 `docs/why-this-kit-exists.md`

## 运行时说明

- Codex 约定：
  - 项目规则写在 `AGENTS.md`
  - 项目 skill 复制到 `.agents/skills/<skill-name>/`
- Claude Code 约定：
  - 项目记忆入口是 `./CLAUDE.md`
  - 项目 skill 复制到 `.claude/skills/<skill-name>/`
  - memory 文件可以通过 `CLAUDE.md` 用 `@path/to/file` 导入
- 共同原则：
  - skill 本体和工作流可以共用
  - 真正需要按运行时区分的，只有入口文件和 skill 目录
