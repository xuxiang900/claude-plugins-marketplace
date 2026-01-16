---
name: agentic-dev-architecture
description: >
  This skill should be used when the user asks to "design architecture", "plan tech stack", "create system design", "define module structure", or needs help with system architecture design and technical decisions.
  Triggered by: "架构设计", "技术方案", "系统设计", "模块划分"
version: 1.0.5
---

# agentic-dev-architecture

This skill should be used when the user asks to "design architecture", "plan tech stack", "create system design", "define module structure", or needs help with system architecture design and technical decisions.

## Trigger Keywords

- 架构设计
- 技术方案
- 系统设计
- 模块划分

## Workflow

### Step 1: 理解需求和约束

分析功能需求和非功能需求
- 性能要求
- 可扩展性需求
- 技术约束

### Step 2: 技术选型

根据需求选择技术栈
- 编程语言
- 框架和库
- 基础设施

### Step 3: 模块划分

设计系统模块和接口
- 核心模块识别
- 模块间依赖关系
- API 接口定义

### Step 4: 生成架构文档

使用 TEMPLATES.md 中的模板生成架构文档
- 架构图（文本描述）
- 模块说明
- 技术决策记录


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取需求文档和现有代码 | ✅ 可用 |
| Write | 生成架构文档 | ✅ 可用 |
| Grep | 搜索现有代码模式 | ✅ 可用 |

## Checklist

- [ ] 需求约束已分析
- [ ] 技术选型已完成
- [ ] 模块划分已确定
- [ ] 架构文档已生成