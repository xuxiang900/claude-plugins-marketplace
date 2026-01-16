---
name: dch
description: |
  This skill should be used when the user asks about "DCH", "context management", "上下文", "搜索文档", "GitLab queries", "飞书导出", or needs help with development context management. Routes to sub-skills for document search, GitLab queries, Feishu export, and context operations.
allowed-tools:
  - Bash(dch:*)
  - Read
---

# dch

This skill should be used when the user asks about "DCH", "context management", "上下文", "搜索文档", "GitLab queries", "飞书导出", or needs help with development context management.

## Trigger Keywords

- DCH
- 上下文
- context
- 搜索文档
- GitLab
- 飞书

## Sub-Skills

| Sub-Skill | Trigger | Description |
|-----------|---------|-------------|
| [context](context/SKILL.md) | "context", "上下文", "数据仓", "同步" | Context 管理 |
| [search](search/SKILL.md) | "搜索", "查找", "search" | 内容搜索 |
| [glab](glab/SKILL.md) | "GitLab", "MR", "提交", "commits" | GitLab 操作 |
| [feishu](feishu/SKILL.md) | "飞书", "feishu", "导出文档" | 飞书操作 |
| [index](index/SKILL.md) | "索引", "index" | 索引管理 |

## Workflow

### Step 1: Identify User Intent

Extract keywords from user query to determine task type.

### Step 2: Route to Sub-Skill

Match keywords to route to the appropriate sub-skill.

### Step 3: Execute Operation

Invoke dch CLI to complete the specific task.

## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash(dch:*) | 调用 dch CLI | ✅ 可用（需安装 dchapp） |
| Read | 读取文档内容 | ✅ 可用 |

## Error Handling

If command execution fails, check the following common issues:

| Error | Cause | Solution |
|-------|-------|----------|
| `dch: command not found` | dchapp 未安装 | 请先安装 dchapp： |
| `配置文件未找到` | DCH 配置未初始化 | 请运行初始化： |
| `Context .* not found` | 指定的 Context 不存在 | 查看可用 context：`dch context list` 添加 context：`dch co... |
| `Connection|timeout|Network` | 网络连接失败 | - 检查网络连接 - 检查 GitLab/飞书 服务是否可访问 - 检查配置文件中的 URL 是否正... |

**Detailed Solutions:**

### dchapp 未安装

请先安装 dchapp：
```bash
pip install dch
dch init
```

### DCH 配置未初始化

请运行初始化：
```bash
dch init
```

### 指定的 Context 不存在

查看可用 context：`dch context list`
添加 context：`dch context add <name> <remote-url>`

### 网络连接失败

- 检查网络连接
- 检查 GitLab/飞书 服务是否可访问
- 检查配置文件中的 URL 是否正确
