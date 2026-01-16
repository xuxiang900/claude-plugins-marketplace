---
title: "Issue Plan 模板"
version: 1.0.0
status: active
created: 2026-01-08
updated: 2026-01-08
authors:
  - agentic-dev Team
tags:
  - template
  - plan
  - persistent-planning
  - phase2
---

# Issue Plan 模板

> 持久化规划文件，用于跨会话任务追踪和注意力管理。

## 核心概念

```
1 Issue = 1 plan.md + 1 notes.md（可选）= 跨会话执行
```

- **生命周期**：Issue 级别，Issue 完成后归档或删除
- **存放位置**：`docs/worklist/issue-{id}-plan.md`
- **是否提交**：可选（复杂 Issue 可提交便于协作）

---

## 使用说明

1. 开始任务时，从 GitLab Issue 创建 plan.md
2. 每次决策前重读 plan.md（注意力校准）
3. 随着执行进度更新阶段状态和错误记录
4. Issue 完成后归档或删除

---

## Plan 模板

```markdown
# Issue Plan: #{issue_id} - {issue_title}

> 持久化执行计划，跨会话保持上下文

## 元信息

| 字段 | 值 |
|------|-----|
| **Issue** | [#{issue_id}]({gitlab_issue_url}) |
| **分支** | `{branch_name}` |
| **开始时间** | {start_time} |
| **预估** | {estimate} |

## 目标

{用一句话描述这个 Issue 要达成的最终状态}

## 验收标准

从 Issue 复制，用于快速校验：

- [ ] {acceptance_criteria_1}
- [ ] {acceptance_criteria_2}
- [ ] {acceptance_criteria_3}

## 执行阶段

- [ ] Phase 1: 理解需求与上下文
- [ ] Phase 2: 设计实现方案
- [ ] Phase 3: 编码实现 (CURRENT)
- [ ] Phase 4: 测试验证
- [ ] Phase 5: 提交 MR

## 关键决策

| 决策 | 理由 | 时间 |
|------|------|------|
| {decision} | {reason} | {timestamp} |

## 错误与解决

| 错误 | 原因 | 解决方案 | 时间 |
|------|------|----------|------|
| {error} | {cause} | {solution} | {timestamp} |

## 当前状态

**Currently in Phase {N}** - {当前正在做的事情}

## 阻塞/待确认

- [ ] {blocking_item_1}
- [ ] {blocking_item_2}
```

---

## 注意力校准点

在以下时机强制重读 plan.md：

| 时机 | 目的 |
|------|------|
| 会话开始/恢复 | 重建完整上下文 |
| 进入新阶段前 | 确认阶段目标 |
| 做出架构/设计决策前 | 对齐核心目标 |
| 遇到阻塞/困惑时 | 重新聚焦 |
| 工具调用超过 20 次 | 防止目标漂移 |

---

## 任务类型特定阶段

### type::feature（功能开发）

```markdown
## 执行阶段

- [ ] Phase 1: 理解需求，阅读设计文档
- [ ] Phase 2: 确认接口和依赖
- [ ] Phase 3: 实现核心逻辑
- [ ] Phase 4: 编写测试
- [ ] Phase 5: 代码规范检查
- [ ] Phase 6: 提交 MR
```

### type::bugfix（Bug 修复）

```markdown
## 执行阶段

- [ ] Phase 1: 复现 Bug
- [ ] Phase 2: 定位根因
- [ ] Phase 3: 实现修复
- [ ] Phase 4: 添加回归测试
- [ ] Phase 5: 验证修复效果
- [ ] Phase 6: 提交 MR
```

### type::prototype（原型验证）

```markdown
## 执行阶段

- [ ] Phase 1: 明确验证目标
- [ ] Phase 2: 技术调研
- [ ] Phase 3: 实现 POC
- [ ] Phase 4: 验证各验证点
- [ ] Phase 5: 编写可行性报告
- [ ] Phase 6: 归档或清理
```

---

## 会话恢复指南

会话中断后恢复时：

1. **读取 plan.md**
   - 了解目标和当前阶段
   - 查看已完成的阶段
   - 查看已做的决策和遇到的错误

2. **读取 notes.md**（如有）
   - 恢复研究发现
   - 获取已收集的代码片段

3. **继续执行**
   - 从 plan.md 的 CURRENT 阶段继续

---

## 归档策略

### Issue 完成后

| 场景 | 处理方式 |
|------|----------|
| 简单 Issue（无重要发现） | 直接删除 |
| 有价值的错误/决策记录 | 归档保留 |
| 团队协作 Issue | 归档保留 |

### Milestone 完成后

移动到 `docs/worklist/archive/milestone-{name}/` 目录。

---

## .gitignore 配置

```gitignore
# 默认不提交执行文件（可根据需要调整）
docs/worklist/issue-*.md

# 但保留 TRACKING.md
!docs/worklist/TRACKING.md
```

---

## 相关文档

- [持久化规划整合设计](../docs/design/persistent-planning-integration.md) - 设计背景
- [Notes 模板](./issue-notes-template.md) - 研究笔记模板
- [研发执行模式](../docs/design/dev-execution-model.md) - Phase 2 执行框架
- [WORKLIST 模板](./worklist-template.md) - 临时会话清单（Level 0）

---

## 变更历史

### v1.0.0 (2026-01-08)
- 初始版本
- 持久化规划文件模板
- 注意力校准点定义
- 任务类型特定阶段
- 归档策略说明
