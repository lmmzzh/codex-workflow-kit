# 接入指南

最快的接入方式，不是先理解所有模板。
更适合第一天的路径是：先生成最小工作流骨架，再让 AI 补项目专项记忆，最后用一个真实任务验证这套流程有没有用。

## 路径 A：Bootstrap 接入

1. 先把这个仓库下载到本地。
2. 执行：

```sh
./scripts/init.sh --target /path/to/your-project
```

3. 选择：
   - `Codex`
   - `Claude Code`
   - 或 `both`
4. 查看目标项目里生成的内容：
   - `AGENTS.md` 和/或 `CLAUDE.md`
   - `memory/*.md`
   - 运行时 skill 目录
   - `INIT-SUMMARY.md`
   - `NEXT-PROMPT.md`
5. 手工确认：
   - 脚本猜出的构建 / 测试 / 静态检查命令
   - 高风险链路和不可乱动模块
   - 运行时选择和默认 skill 集合
6. 把 `NEXT-PROMPT.md` 发给你的编码 Agent。
7. 先让 AI 补第一版项目专项记忆，不要改代码。
8. 再用一个真实任务试跑，决定是否继续加专项 skill。

## 初始化后立刻做什么

先打开 `INIT-SUMMARY.md`。它会告诉你脚本生成了什么、检测到了什么、还有哪些地方需要你确认。

再打开 `NEXT-PROMPT.md`，把里面的内容发给 Codex 或 Claude Code。
这一步应该产出的是“项目适配结果”，不是代码改动。

第一轮输出应该说清楚：

- AI 读了哪些 memory 和入口文件
- 从项目里识别到了哪些事实
- 哪些高风险区域只是猜测，需要你确认
- 现在能不能开始第一个真实任务

如果 AI 在这一步开始改代码，直接停掉，重新按 `NEXT-PROMPT.md` 里的“不要改代码”要求执行。

## 路径 B：手工接入

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

- 如果你只是第一次接入，优先走 `scripts/init.sh`，先拿到最小骨架。
- 第一天不要把所有 skill 都装进去
- 在项目 memory 里明确哪些 skill 属于默认动作，哪些属于手动调用
- 如果某个 skill 自动触发过于吵，先收窄它的 `description`，不要立刻再造一个重叠 skill
- 如果你想先理解这套默认拆法为什么成立，先看 `docs/why-this-kit-exists.md`

## 第一个任务怎么选

第一个任务应该是真实任务，但不要一上来就选会改核心业务逻辑的任务。

适合的第一任务：

- 边界清楚的小 UI 修复
- 和真实项目结构有关的文档更新
- 行为不变的低风险重构

不适合的第一任务：

- 支付或订阅流程重写
- 登录链路修改
- 数据库迁移
- 大型状态机重构

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
