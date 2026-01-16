---
name: agentic-dev-split-issues
description: >
  This skill should be used when the user asks to "split tasks", "create issues", "break down roadmap", "decompose features into issues", or needs help converting a roadmap or feature description into executable GitLab Issues.
  Triggered by: "拆分任务", "创建 issue", "分解 roadmap", "任务分解"
version: 1.0.5
---

# agentic-dev-split-issues

This skill should be used when the user asks to "split tasks", "create issues", "break down roadmap", "decompose features into issues", or needs help converting a roadmap or feature description into executable GitLab Issues.

## Trigger Keywords

- 拆分任务
- 创建 issue
- 分解 roadmap
- 任务分解

## Workflow

### Step 1: 读取 Roadmap

获取 Roadmap 或功能描述
- 从 docs/planning/roadmap.md 读取
- 或从用户输入获取

### Step 2: 识别可拆分项

分析 Roadmap 中的功能项
- 识别独立可交付的功能
- 估算复杂度
- 确定依赖关系

### Step 3: 生成 Issue 列表

使用 issue-template.md 模板生成 Issue
- 标题符合规范
- 描述包含验收标准
- 标签和里程碑

### Step 4: 批量创建 Issues

使用 glab 命令创建 Issues

**执行前确认**：
- 向用户展示即将创建的 Issues 列表
- 询问用户是否确认创建
- 如果 20 秒内未应答，自动执行创建

```bash
glab issue create --title "..." --description "..."
```


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取 Roadmap 文档 | ✅ 可用 |
| Write | 生成 Issue 描述文件 | ✅ 可用 |
| Bash | 执行 glab 命令创建 Issues 和 Milestones | ✅ 可用 |

## Checklist

- [ ] Roadmap 已读取
- [ ] 功能项已识别
- [ ] Issue 描述已生成
- [ ] Issues 已创建（可选）