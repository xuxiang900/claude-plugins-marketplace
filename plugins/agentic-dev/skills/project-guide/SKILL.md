---
name: agentic-dev-project-guide
description: >
  This skill should be used when the user asks to "create CLAUDE.md", "generate project guide", "write AI collaboration guide", "define project standards", or needs help creating or improving the project's AI collaboration guide (CLAUDE.md).
  Triggered by: "CLAUDE.md", "项目指南", "AI 协作指南", "项目规范", "生成 CLAUDE"
version: 1.0.5
---

# agentic-dev-project-guide

This skill should be used when the user asks to "create CLAUDE.md", "generate project guide", "write AI collaboration guide", "define project standards", or needs help creating or improving the project's AI collaboration guide (CLAUDE.md).

## Trigger Keywords

- CLAUDE.md
- 项目指南
- AI 协作指南
- 项目规范
- 生成 CLAUDE
- AI 工作指南

## Workflow

### Step 1: 收集项目信息

读取项目关键文档
- README.md - 项目概述
- methodology.md - 方法论（如有）
- docs/design/ - 设计文档
- 现有 CLAUDE.md（如有）

### Step 2: 提取核心概念

识别项目核心信息
- 项目名称和定位
- 核心理念和口径
- 技术栈
- 关键术语

### Step 3: 生成指南草稿

使用 TEMPLATES.md 中的 Prompt 生成 CLAUDE.md
- 核心口径（< 50 行）
- 工作方式
- 快速参考
- Git 提交规范

### Step 4: 检查并压缩变更历史

如果已有 CLAUDE.md，检查变更历史版本数
- 超过 5 个版本：压缩历史，归档旧版本
- 使用 compress_claude_changelog prompt
- 创建 docs/history/claude-md-changelog.md（如需）

### Step 5: 与用户确认

确认指南内容
- 口径是否准确
- 是否需要调整
- 保持简洁（< 150 行）


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取项目文档 | ✅ 可用 |
| Grep | 搜索关键信息 | ✅ 可用 |
| Write | 生成 CLAUDE.md | ✅ 可用 |

## Checklist

- [ ] 项目文档已读取
- [ ] 核心概念已提取
- [ ] CLAUDE.md 草稿已生成
- [ ] 变更历史已压缩（如需）
- [ ] 用户已确认