---
name: agentic-dev-start-issue
description: >
  This skill should be used when the user asks to "start issue", "begin task", "create worklist", "setup development environment", or needs help initializing an Issue for development with WORKLIST, TRACKING, and feature branch.
  Triggered by: "开始 issue", "创建 worklist", "执行任务", "开始开发"
version: 1.0.5
---

# agentic-dev-start-issue

This skill should be used when the user asks to "start issue", "begin task", "create worklist", "setup development environment", or needs help initializing an Issue for development with WORKLIST, TRACKING, and feature branch.

## Trigger Keywords

- 开始 issue
- 创建 worklist
- 执行任务
- 开始开发

## Workflow

### Step 1: 获取 Issue 信息

从 GitLab 获取 Issue 详情
```bash
glab issue view <issue_id>
```
或从用户提供的 Issue 链接解析

### Step 2: 创建 WORKLIST

使用 worklist-template.md 生成工作列表
- 路径: `docs/worklist/issue-{id}.md`
- 包含任务分解和检查项

### Step 3: 更新 TRACKING.md

在 TRACKING.md 中添加 Issue
- 设置状态为 🔵 进行中
- 记录开始时间

### Step 4: 创建开发分支

创建功能分支
```bash
git checkout -b feature/{feature}/{issue_id}-{short_desc}
```


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取模板文件和现有文档 | ✅ 可用 |
| Write | 生成 WORKLIST 文件 | ✅ 可用 |
| Edit | 更新 TRACKING.md | ✅ 可用 |
| Bash | 执行 glab (获取 Issue) 和 git (创建分支) 命令 | ✅ 可用 |

## Checklist

- [ ] Issue 信息已获取
- [ ] WORKLIST 文件已创建
- [ ] TRACKING.md 已更新
- [ ] 开发分支已创建