---
name: dch-index
description: |
  This skill should be used when the user asks to "initialize index", "update index", "check index status", "rebuild index", "管理索引", "更新索引", or needs help with DCH index operations.
allowed-tools:
  - Bash(dch:*)
---

# dch-index

This skill should be used when the user asks to "initialize index", "update index", "check index status", "rebuild index", "管理索引", "更新索引", or needs help with DCH index operations.

## Trigger Keywords

- 索引
- index
- 更新索引
- 重建索引
- 索引状态

## Workflow

### Step 1: Determine Operation Type

Identify index operation:
- Initialize index
- Update index
- Check status

### Step 2: Execute Command

Invoke dch index command:
```bash
dch index init
dch index update [--all]
dch index status
```

### Step 3: Report Results

Display index operation results.

## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash(dch:*) | dch index 命令 | ✅ 可用 |

## Checklist

- [ ] Determine operation type
- [ ] Execute command
- [ ] Report results
