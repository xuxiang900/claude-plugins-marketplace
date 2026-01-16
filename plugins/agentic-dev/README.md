# agentic-dev Plugin

Agent 驱动的项目全生命周期方法论 Plugin。

## 概述

agentic-dev 提供从需求分析到开发执行的完整项目管理方法论，专为 AI Agent 协作场景设计。

**核心特性：**
- **3 Phase 模型**：需求规划（Phase 0）→ 设计（Phase 1）→ 开发执行（Phase 2）
- **8 个 Skills**：基于意图自动触发，无需记忆命令
- **3 个 Commands**：快捷操作，显式调用
- **模板库**：标准化的文档格式
- **Prompt 库**：优化过的 AI 协作提示词

## 安装

```bash
# 推荐：从 Marketplace 安装
/plugin marketplace add ~/claude-plugins/agent-lab
/plugin install agentic-dev@agent-lab
```

## 快速开始

安装后，直接用自然语言描述需求，对应 Skill 会自动触发：

```
用户：帮我进行需求分析
→ 触发 requirements Skill

用户：设计一下系统架构
→ 触发 architecture Skill

用户：把需求拆分成任务
→ 触发 split-issues Skill
```

## Skills 列表

| Skill | 触发关键词 | 说明 |
|-------|-----------|------|
| `requirements` | 需求分析、PRD、用户故事 | 需求收集和分析 |
| `architecture` | 架构设计、技术方案 | 系统架构设计 |
| `split-issues` | 拆分任务、创建 issue | 任务分解 |
| `project-guide` | CLAUDE.md、项目指南 | 生成 AI 协作指南 |
| `start-issue` | 开始 issue、创建 worklist | 创建任务清单 |
| `implement` | 实现功能、修复 bug | 代码实现指导 |
| `complete-issue` | 完成 issue、生成 MR | 完成并提交 |
| `agentic-dev` | agentic-dev 方法论 | 入口 Skill，路由到子 Skill |

## Commands 列表

显式调用的快捷命令：

| Command | 用法 | 说明 |
|---------|------|------|
| `/agentic-dev:worklist` | `/agentic-dev:worklist #123` | 为 Issue 创建 WORKLIST |
| `/agentic-dev:tracking` | `/agentic-dev:tracking` | 更新 TRACKING.md 状态 |
| `/agentic-dev:mr-description` | `/agentic-dev:mr-description` | 生成 MR 描述 |

## 3 Phase 模型

```
Phase 0: 需求与规划
├── 需求收集和分析
├── PRD 编写
└── 技术可行性评估

Phase 1: 设计
├── 架构设计
├── 技术方案制定
└── 任务拆分（Issues）

Phase 2: 开发执行
├── 开始 Issue（WORKLIST）
├── 代码实现
├── 测试验证
└── 完成 Issue（MR）
```

## 包含资源

- **模板** (`resources/templates/`)
  - `issue-template.md` - Issue 模板
  - `worklist-template.md` - WORKLIST 模板
  - `tracking-template.md` - TRACKING 模板
  - `issue-plan-template.md` - Issue Plan 模板
  - `issue-notes-template.md` - Issue Notes 模板

- **Prompt 库** (`resources/prompts/`)
  - `ai-prompt-library.md` - AI 协作 Prompt 集合

## 版本信息

- Plugin 版本：1.0.5
- 方法论版本：3.0（3 Phase 模型）

## 相关文档

- [Plugin 安装指南](https://gitlab.example.com/agent/claude-code-plugins/-/blob/main/docs/guides/plugin-install.md)
- [agentic-dev 方法论](https://gitlab.example.com/agent/agentic-dev)
