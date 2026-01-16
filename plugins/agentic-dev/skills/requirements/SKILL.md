---
name: agentic-dev-requirements
description: >
  This skill should be used when the user asks to "analyze requirements", "write user story", "create PRD", "define functional requirements", or needs help with requirements gathering and documentation.
  Triggered by: "需求分析", "PRD", "用户故事", "功能需求"
version: 1.0.5
---

# agentic-dev-requirements

This skill should be used when the user asks to "analyze requirements", "write user story", "create PRD", "define functional requirements", or needs help with requirements gathering and documentation.

## Trigger Keywords

- 需求分析
- PRD
- 用户故事
- 功能需求

## Workflow

### Step 1: 收集需求背景

了解项目背景、目标用户、核心问题
- 询问用户当前痛点
- 确认项目范围和边界

### Step 2: 分析用户场景

梳理典型用户场景和使用流程
- 识别主要用户角色
- 绘制用户旅程

### Step 3: 生成需求文档

使用 TEMPLATES.md 中的模板生成 PRD
- 功能需求列表
- 非功能需求
- 验收标准

### Step 4: 需求评审

与用户确认需求完整性和优先级
- 确认优先级排序
- 标注 MVP 范围


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取现有文档和上下文 | ✅ 可用 |
| Write | 生成需求文档 | ✅ 可用 |

## Checklist

- [ ] 背景信息已收集
- [ ] 用户场景已分析
- [ ] 需求文档已生成
- [ ] 优先级已确认