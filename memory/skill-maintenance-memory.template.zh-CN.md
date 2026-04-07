# Skill 维护记忆模板

这个模板用来约束本地 workflow skills 到底允许多积极地触发和扩张。  
默认立场是：先保留少量稳定 skill，高风险新增继续走人工确认。

## 1. 默认 skills

下面这些 skill 在任务描述明显匹配时，可以默认自动触发：

- `current-task-capsule`
- `high-risk-preflight`
- `handoff-retrospective`

默认行为：

- 任务描述明显匹配时，这些 workflow 应该自然出现
- 如果偶尔漏触发，先改 skill 的 `description`，不要急着再复制一个重叠 skill

## 2. 专项 skills

下面这些 skill 一般优先手动调用，除非任务描述已经非常明确：

- `i18n-baseline-rollout`
- `figma-page-family-planner`

默认行为：

- 除非请求明显就是多语言或 Figma 页面规划，否则优先显式点名调用
- 不要为了看起来更自动，就把专项 skill 硬塞进不相关任务里

## 3. 什么时候新增一个 skill

只有下面条件都成立时，才值得新增：

- 同类任务模式反复出现
- 工作流已经比较稳定
- 输入和输出清楚
- 它确实减少了重复说明
- 不会鼓励 scope creep

## 4. 什么时候先改已有 skill

- 如果自动触发偶尔漏掉，先调整 `description`
- 如果输出形状不顺手，先改 `assets/` 里的模板
- 如果开始重叠，先收窄其中一个 skill 的职责，不要再造一个更大的

## 5. 什么情况不该技能化

- 一次性任务
- 依赖人工截图/标注的像素级 UI 微调
- 高风险业务逻辑重写
- 探索性算法实验
- 大而全的“什么都做”型 workflow

## 6. 复查规则

新增或修改一个 skill 之后，要用几条真实任务描述去测。  
只有它真的改善了任务流，才值得继续保留。

## 7. 运行时专项说明

- Codex：
  - 把 skills 复制到 `.agents/skills/<skill-name>/`
  - memory 文档从 `AGENTS.md` 引用
- Claude Code：
  - 把 skills 复制到 `.claude/skills/<skill-name>/`
  - 在 `CLAUDE.md` 里导入这个 memory 文件
  - 如果运行时不支持热更新 skill 元数据，改完后重启 Claude Code 再测
