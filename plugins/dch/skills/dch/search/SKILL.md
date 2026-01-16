---
name: dch-search
description: |
  This skill should be used when the user asks to "search documents", "find content", "搜索文档", "查找资料", "有没有关于...", or needs help searching DCH context documents by keywords or field values.
allowed-tools:
  - Bash(dch:*)
---

# dch-search

This skill should be used when the user asks to "search documents", "find content", "搜索文档", "查找资料", "有没有关于.

## Trigger Keywords

- 搜索
- 查找
- search
- 找文档
- 有没有关于

## Workflow

### Step 1: Analyze Search Intent

Determine search type:
- Text search: contains keywords
- Field search: by front-matter fields

### Step 2: Build Search Command

Construct command based on intent:
```bash
dch search text "<query>"
dch search field <field>=<value>
```

### Step 3: Execute and Interpret Results

Execute search command and interpret the returned document list.

## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash(dch:*) | dch search 命令 | ✅ 可用 |

## Checklist

- [ ] Determine search type
- [ ] Build search command
- [ ] Execute and interpret results
