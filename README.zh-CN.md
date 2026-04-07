# codex-workflow-kit

一套面向 Codex 和 Claude Code 这类编码 Agent 的本地工作流模板库，来自真实项目协作实践的提炼。

这个项目不是 agent runtime，不是模型封装器，也不是全自动编程平台。
它更适合想让编码 Agent **复用稳定工作流、遵守项目边界、稳定产出交接文档** 的开发者，尤其适合真实工程环境下那种“要提效，但不能放任 AI 乱改”的使用方式。

这套模板库默认按“双入口、单套方法论”设计：

- Codex：`AGENTS.md` + `memory/*` + `.agents/skills/*`
- Claude Code：`CLAUDE.md` + `memory/*` 导入 + `.claude/skills/*`

核心 memory/skill 内容尽量共用，只在入口文件和 skill 目录约定上做轻量适配。

## 这个项目解决什么问题

很多 AI 编程方案默认追求“更高自治度”。
这个项目选择更谨慎的方向：

- 把可重复流程自动化
- 把高风险业务决策留给人审
- 把项目规则写进 `AGENTS.md` 和 memory 文档
- 只把稳定、边界清楚的任务沉淀成本地 skill
- 先用真实任务验证 skill 是否会自动命中，再决定是否继续扩展

这套仓库不是从 benchmark、prompt 收藏夹或抽象设计稿里长出来的，而是从真实项目里的反复协作、返工控制、风险预检和交接收口里提炼出来的。

如果你的目标是让 Agent 自己重写整个代码库，这个项目大概率不适合你。
如果你的目标是在真实项目里让 Agent 更可控、更可复用、更容易交接，这个项目会更适合你。

## 适合谁

更适合这些人：

- 在真实产品工程里工作，重视改动边界、可维护性和可回滚性
- 不想每天重复向 Agent 解释同一套工作流
- 更认同“有边界的自动化 + 高风险点人审”，而不是“无限放任 AI”
- 重视 handoff、验证、长期上下文沉淀

如果你主要想要的是“一键全自动 agent 平台”或“模型跑分/benchmark 项目”，这个仓库大概率不是第一优先级。

## 设计原则

- 边界优先
- 高频稳定流程才沉淀成 skill
- 长期规则继续放在 memory/context 文件里
- 高风险产品决策保留人审
- skill 数量先克制，不靠“堆很多 skill”制造体系感

## 包含哪些内容

- `AGENTS.md`
  - 面向 Codex 风格用法的仓库级规则模板
- `CLAUDE.md`
  - 面向 Claude Code 的项目记忆入口，负责导入 memory 模板
- `memory/`
  - 长期协作记忆和项目记忆模板
- `skills/`
  - 可复制到 `.agents/skills/` 或 `.claude/skills/` 的小型工作流 skill
- `docs/`
  - 接入指南、实践说明、自动触发验证清单、维护规则、脱敏说明

## 核心思路

采用三层结构：

1. `AGENTS.md` 或 `CLAUDE.md` 管仓库级硬规则和记忆入口
2. `memory/` 管长期协作偏好和默认流程
3. `skills/` 管可重复的任务步骤、边界和输出格式，再按运行时复制到对应 skill 目录

## 快速开始

1. 先决定你的运行时：
   - Codex
   - Claude Code
   - 或两者都用
2. 把对应入口文件复制到你的项目根目录：
   - Codex：`AGENTS.md`
   - Claude Code：`CLAUDE.md`
3. 把 `memory/*.template.md` 复制到你自己的项目记忆目录里，改名成 `.md` 后再替换占位符。
4. 挑选少量 skill 复制到对应目录：
   - Codex：`skills/<name>/` -> `.agents/skills/<name>/`
   - Claude Code：`skills/<name>/` -> `.claude/skills/<name>/`
5. 一开始只保留 2 到 3 个默认 skill，不要一次性加很多。
6. 用真实项目任务测试，并按 `docs/skill-auto-trigger-validation-checklist.md` 评估是否真的有收益。
7. 新增 skill 前先看 `docs/skill-maintenance-rules.md`。

## 推荐首批默认配置

- 中大型任务开始前：`current-task-capsule`
- 高风险链路改动前：`high-risk-preflight`
- 有实际实现改动后的收尾阶段：`handoff-retrospective`

`i18n-baseline-rollout` 和 `figma-page-family-planner` 这类专项 skill，建议第一阶段先按需点名调用，不要一开始就强求自动化。

## 建议在你自己项目里的目录摆法

### Codex

```text
your-project/
├── AGENTS.md
├── memory/
│   ├── START-HERE.md
│   ├── developer-collaboration-memory.md
│   ├── project-specific-collaboration-memory.md
│   └── skill-maintenance-memory.md
└── .agents/
    └── skills/
        ├── current-task-capsule/
        ├── high-risk-preflight/
        └── handoff-retrospective/
```

### Claude Code

```text
your-project/
├── CLAUDE.md
├── memory/
│   ├── START-HERE.md
│   ├── developer-collaboration-memory.md
│   ├── project-specific-collaboration-memory.md
│   └── skill-maintenance-memory.md
└── .claude/
    └── skills/
        ├── current-task-capsule/
        ├── high-risk-preflight/
        └── handoff-retrospective/
```

## 建议先读的文档

- `docs/adoption-guide.md`
- `docs/why-this-kit-exists.md`
- `docs/privacy-and-redaction-guide.md`
- `docs/skill-auto-trigger-validation-checklist.md`
- `docs/skill-maintenance-rules.md`

## 隐私提醒

不要把私有项目复盘、事故文档、内部模块名、个人机器路径、密钥、未公开产品策略直接放进公开仓库。
发布前先按 `docs/privacy-and-redaction-guide.md` 做脱敏检查。
