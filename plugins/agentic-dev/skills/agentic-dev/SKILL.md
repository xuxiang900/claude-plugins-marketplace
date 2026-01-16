---
name: agentic-dev
description: >
  This skill should be used when the user asks about "requirements analysis", "architecture design", "task breakdown", "development execution", "project management", or needs guidance on the agentic-dev methodology. It routes to appropriate sub-skills based on user intent.
  Triggered by: "需求分析", "架构设计", "任务拆分", "开发执行", "项目管理"
version: 1.0.5
---

# agentic-dev

This skill should be used when the user asks about "requirements analysis", "architecture design", "task breakdown", "development execution", "project management", or needs guidance on the agentic-dev methodology. It routes to appropriate sub-skills based on user intent.

## Trigger Keywords

- 需求分析
- 架构设计
- 任务拆分
- 开发执行
- 项目管理

## Sub-Skills

| Sub-Skill | Triggers | Description |
|-----------|----------|-------------|
| `planning/requirements` | 需求分析, PRD, 用户故事 | 需求收集和分析 |
| `planning/architecture` | 架构设计, 技术方案 | 系统架构设计 |
| `planning/split-issues` | 拆分任务, 创建 issue | Issue 拆分 |
| `planning/project-guide` | CLAUDE.md, 项目指南, AI 协作指南 | 生成项目 AI 协作指南 |
| `execution/start-issue` | 开始 issue, 创建 worklist | 创建 WORKLIST |
| `execution/implement` | 实现功能, 修复 bug | 代码实现 |
| `execution/complete-issue` | 完成 issue, 生成 MR | 生成 MR |
| `execution/git-workflow` | 创建分支, 推送分支, git 工作流 | Git 分支与 MR 工作流 |
| `manage/weekly-report` | 生成周报, 整理周报, 一周进展 | 整理项目一周进展成文档 |
| `manage/notebooklm-doc` | NotebookLM, 生成 NotebookLM 文档, AI 文档 | 生成 NotebookLM 优化文档 |

## Workflow

### Step 1: 识别用户意图

从用户查询中提取关键词，确定任务类型

### Step 2: 路由到子 Skill

根据关键词匹配，路由到对应的子 skill

### Step 3: 执行子 Skill

调用子 skill 完成具体任务
