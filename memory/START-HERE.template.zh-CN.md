# START-HERE

## 运行时入口

- Codex：
  - 把这个文件放到项目 memory 文档目录里，并确保 `AGENTS.md` 明确要求 agent 先读它
- Claude Code：
  - 在 `./CLAUDE.md` 里用 `@memory/START-HERE.md` 导入它

## 模板仓库说明

这个仓库里的 memory 文件都以 `*.template.md` 保存。  
复制进你自己的项目后，请改名成 `.md`，并保持下面的读取顺序不变。

## 读取顺序

开始实质工作前，按下面顺序先读这些 memory 文件：

1. `memory/developer-collaboration-memory.md`
2. `memory/project-specific-collaboration-memory.md`
3. `memory/skill-maintenance-memory.md`

读完后，先总结：

- 读了哪些文件
- 当前任务边界是什么
- 这轮是否应该先跑某个默认 workflow skill

如果任务属于中大型需求，在完成这一步之前不要直接开始实现。

## 期望行为

- 中大型任务，通常先跑 `current-task-capsule`
- 高风险链路，在写代码前先跑 `high-risk-preflight`
- 真正有实现改动后，收尾时跑 `handoff-retrospective`
