---
name: agentic-dev-git-workflow
description: >
  This skill should be used when the user asks to "create branch", "push branch", "create MR", "create merge request", "switch branch", or needs help with Git branch management and Merge Request workflow.
  Triggered by: "创建分支", "推送分支", "创建 MR", "git 工作流", "切换分支"
version: 1.0.5
---

# agentic-dev-git-workflow

This skill should be used when the user asks to "create branch", "push branch", "create MR", "create merge request", "switch branch", or needs help with Git branch management and Merge Request workflow.

## Trigger Keywords

- 创建分支
- 推送分支
- 创建 MR
- git 工作流
- 切换分支

## Workflow

### Step 1: 创建分支

根据任务类型创建规范命名的分支
- feature/{feature-name}/issue-{id}-{short-desc}
- bugfix/{feature-name}/issue-{id}-{short-desc}
- hotfix/{version}/{short-desc}
- release/{version}

### Step 2: 推送分支

将分支推送到远程仓库
- 首次推送设置上游分支
- 禁止直接推送到 main/master

### Step 3: 创建 MR

创建 Merge Request

**执行前确认**：
- 向用户展示 MR 标题和描述预览
- 询问用户是否确认创建
- 如果 20 秒内未应答，自动执行创建

```bash
glab mr create --title "..." --description "..."
```

### Step 4: 分支状态检查

检查当前 Git 工作区状态
- 当前分支名称
- 未提交的变更
- 领先/落后远程的提交数

### Step 5: 切换分支

安全切换到指定分支
- 检查未提交变更
- 提示 stash/commit/放弃


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash | 执行 git 和 glab/gh 命令 | ✅ 可用 |

## Checklist

- [ ] 分支名称符合规范
- [ ] 不在 main/master 分支直接开发
- [ ] 变更已提交
- [ ] 分支已推送到远程
- [ ] MR 描述包含关联 Issue