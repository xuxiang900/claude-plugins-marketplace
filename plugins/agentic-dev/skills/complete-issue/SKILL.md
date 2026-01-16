---
name: agentic-dev-complete-issue
description: >
  This skill should be used when the user asks to "complete issue", "finish task", "generate MR description", "create merge request", "prepare code review", or needs help finalizing an Issue with MR creation and TRACKING update.
  Triggered by: "完成 issue", "生成 MR", "合并请求", "代码审查"
version: 1.0.5
---

# agentic-dev-complete-issue

This skill should be used when the user asks to "complete issue", "finish task", "generate MR description", "create merge request", "prepare code review", or needs help finalizing an Issue with MR creation and TRACKING update.

## Trigger Keywords

- 完成 issue
- 生成 MR
- 合并请求
- 代码审查

## Workflow

### Step 1: 确认任务完成

检查 WORKLIST 中所有任务项
- 确认所有 checkbox 已勾选
- 验证测试通过

### Step 2: 生成 MR 描述

使用 TEMPLATES.md 中的 Prompt 生成 MR 描述
- 变更摘要
- 测试说明
- 关联 Issue（添加 `Closes #issue_id` 使 MR 合并后自动关闭 Issue）

### Step 3: 创建 Merge Request

使用 glab 创建 MR
```bash
glab mr create --title "..." --description "..."
```

### Step 4: 更新 TRACKING.md

更新 Issue 状态
- 设置状态为 🟢 已完成
- 记录完成时间
- 关联 MR 链接

### Step 5: 关闭 Issue

手动关闭 Issue（如果 MR 描述中已包含 `Closes #issue_id`，MR 合并后会自动关闭）

**执行前确认**：
- 向用户展示即将关闭的 Issue
- 询问用户是否确认关闭
- 如果 20 秒内未应答，自动执行关闭

```bash
glab issue close <issue_id>
```


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取 WORKLIST 和变更记录 | ✅ 可用 |
| Write | 更新文档 | ✅ 可用 |
| Edit | 更新 TRACKING.md | ✅ 可用 |
| Bash | 执行 git (查看变更/提交) 和 glab (创建 MR/关闭 Issue) 命令 | ✅ 可用 |

## Checklist

- [ ] WORKLIST 任务已完成
- [ ] 测试已通过
- [ ] MR 描述已生成（包含 Closes
- [ ] MR 已创建
- [ ] TRACKING.md 已更新
- [ ] Issue 已关闭