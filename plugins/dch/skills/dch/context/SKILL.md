---
name: dch-context
description: |
  This skill should be used when the user asks to "list context", "add context", "sync context", "validate context", "管理上下文", "数据仓同步", or needs help with DCH context repository operations.
allowed-tools:
  - Bash(dch:*)
---

# dch-context

This skill should be used when the user asks to "list context", "add context", "sync context", "validate context", "管理上下文", "数据仓同步", or needs help with DCH context repository operations.

## Trigger Keywords

- context
- 上下文
- 数据仓
- 同步 context
- 列出 context
- 添加 context

## Workflow

### Step 1: Understand User Request

Determine the operation to perform:
- List contexts
- Add new context
- Sync context
- Validate context

### Step 2: Execute CLI Command

Invoke the appropriate dch context command:
```bash
dch context list
dch context add <name> <url>
dch context sync [name]
dch context validate <name>
```

### Step 3: Return Results

Interpret and present command execution results.

## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash(dch:*) | dch context 命令 | ✅ 可用 |

## Checklist

- [ ] Determine operation type
- [ ] Execute CLI command
- [ ] Return results
