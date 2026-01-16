---
name: dch-feishu
description: |
  This skill should be used when the user asks to "export Feishu document", "convert Feishu to Markdown", "导出飞书文档", "飞书链接转换", or needs help exporting Feishu (Lark) documents to Markdown format.
allowed-tools:
  - Bash(dch:*)
  - Read
  - Write
---

# dch-feishu

This skill should be used when the user asks to "export Feishu document", "convert Feishu to Markdown", "导出飞书文档", "飞书链接转换", or needs help exporting Feishu (Lark) documents to Markdown format.

## Trigger Keywords

- 飞书
- feishu
- 导出文档
- 飞书链接

## Workflow

### Step 1: Extract Feishu Link

Extract Feishu document link from user input.
Supported types: docx, wiki, sheet, etc.

### Step 2: Execute Export Command

Invoke dch feishu command:
```bash
dch feishu export "<url>" [-o <output_dir>]
dch feishu fetch "<url>"  # fetch content only
```

### Step 3: Confirm Export Results

Display exported file path or content preview.

## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Bash(dch:*) | dch feishu 命令 | ✅ 可用 |
| Read | 读取文档内容 | ✅ 可用 |
| Write | 保存导出文件 | ✅ 可用 |

## Checklist

- [ ] Extract Feishu link
- [ ] Determine output location
- [ ] Execute export command
- [ ] Confirm export results
