---
name: dch-glab
description: |
  This skill should be used when the user asks to "query GitLab", "list MRs", "view commits", "check issues", "查看合并请求", "提交记录", or needs help querying GitLab data including merge requests, commits, and issues.
allowed-tools:
  - Bash(dch:*)
---

# dch-glab

This skill should be used when the user asks to "query GitLab", "list MRs", "view commits", "check issues", "查看合并请求", "提交记录", or needs help querying GitLab data including merge requests, commits, and issues.

## Trigger Keywords

- GitLab
- MR
- 合并请求
- 提交
- commits
- Issue

## Workflow

### Step 1: Determine Query Type

Identify what to query:
- MR list
- Commit history
- Issue list

### Step 2: Execute Query Command

Invoke dch glab command:
```bash
dch glab mrs <project> [--state opened]
dch glab commits <project> [--since "1 week ago"]
dch glab issues <project> [--state opened]
```

### Step 3: Format Output

Format query results into readable tables or lists.

## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash(dch:*) | dch glab 命令 | ✅ 可用 |

## Checklist

- [ ] Determine query type
- [ ] Identify project path
- [ ] Execute query command
- [ ] Format output
