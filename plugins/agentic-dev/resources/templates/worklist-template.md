---
title: "WORKLIST 模板"
version: 1.0.0
status: active
created: 2026-01-07
updated: 2026-01-07
authors:
  - agentic-dev Team
tags:
  - template
  - worklist
  - execution
  - phase2
---

# WORKLIST 模板

> 单 Issue 执行清单，用于 AI Coding 会话的上下文管理。

## 核心概念

```
1 Issue = 1 WORKLIST = 1 AI Coding 会话
```

- **生命周期**：会话级别，任务完成后删除
- **存放位置**：`docs/worklist/issue-{id}.md`
- **是否提交**：否（临时文件，加入 .gitignore）

---

## 使用说明

1. 开始任务时，从 GitLab Issue 创建 WORKLIST
2. 在 AI Coding 会话中使用 WORKLIST 作为上下文
3. 随着执行进度更新检查项状态
4. 任务完成后删除 WORKLIST 文件

---

## WORKLIST 模板

```markdown
# Issue #{issue_id}: {issue_title}

> 本地执行清单，会话结束后删除

## Issue 信息

| 字段 | 值 |
|------|-----|
| **Issue** | [#{issue_id}]({gitlab_issue_url}) |
| **类型** | `type::{type}` |
| **Feature** | `feat::{feature}` |
| **分支** | `feature/{feature}/{issue_id}-{short_desc}` |
| **开始时间** | {start_time} |

## 验收标准（从 Issue 复制）

- [ ] {acceptance_criteria_1}
- [ ] {acceptance_criteria_2}
- [ ] {acceptance_criteria_3}

## 执行清单

### 准备阶段

- [ ] 阅读并理解 Issue 描述
- [ ] 确认设计文档（如有）
- [ ] 创建/切换到工作分支
- [ ] 更新 TRACKING.md 状态为 🔵 in-progress

### 实现阶段

- [ ] {task_1}
- [ ] {task_2}
- [ ] {task_3}
- [ ] 代码符合项目规范

### 验证阶段

- [ ] 本地测试通过
- [ ] 验收标准全部满足
- [ ] 代码已提交

### 完成阶段

- [ ] 创建/更新 MR
- [ ] MR 描述完整
- [ ] 更新 TRACKING.md 状态为 ✅ done
- [ ] 更新 Issue 状态

## 执行记录

### {date} - 会话 1

**完成**：
- {completed_item_1}
- {completed_item_2}

**遇到的问题**：
- {issue_1}

**下次继续**：
- {next_step_1}

## 相关文件

- `{file_path_1}` - {description}
- `{file_path_2}` - {description}

## 备注

{notes}
```

---

## 任务类型特定清单

### type::prototype（原型验证）

```markdown
### 执行清单

#### 准备阶段
- [ ] 明确验证目标和边界
- [ ] 准备验证环境
- [ ] 创建工作分支

#### 验证阶段
- [ ] 实现 POC 代码
- [ ] 验证点 1：{point_1}
- [ ] 验证点 2：{point_2}
- [ ] 记录验证结果

#### 总结阶段
- [ ] 编写可行性报告
- [ ] 给出技术评估结论
- [ ] 提出下一步建议

#### 完成阶段
- [ ] 提交可行性报告
- [ ] 更新 Issue 结论
- [ ] POC 代码归档或清理
```

### type::feature（功能开发）

```markdown
### 执行清单

#### 准备阶段
- [ ] 阅读设计文档
- [ ] 确认接口定义
- [ ] 创建功能分支

#### 实现阶段
- [ ] 实现核心逻辑
- [ ] 编写单元测试
- [ ] 处理边界情况
- [ ] 代码符合规范

#### 测试阶段
- [ ] 单元测试通过
- [ ] 集成测试通过
- [ ] 手动验证功能

#### 文档阶段
- [ ] 更新 API 文档（如需）
- [ ] 更新使用说明（如需）

#### 完成阶段
- [ ] 创建 MR
- [ ] 代码 Review 通过
- [ ] 合并到主分支
```

### type::bugfix（Bug 修复）

```markdown
### 执行清单

#### 分析阶段
- [ ] 复现 Bug
- [ ] 定位根因
- [ ] 记录根因分析

#### 修复阶段
- [ ] 编写修复代码
- [ ] 添加回归测试
- [ ] 验证修复有效

#### 验证阶段
- [ ] 回归测试通过
- [ ] 相关功能不受影响
- [ ] 边界情况已覆盖

#### 完成阶段
- [ ] 创建 MR
- [ ] 在 Issue 记录根因
- [ ] 合并修复
```

---

## 会话恢复指南

如果 AI Coding 会话中断，使用以下信息恢复上下文：

1. **读取 WORKLIST**：了解任务背景和当前进度
2. **检查执行记录**：了解上次会话完成了什么
3. **查看相关文件**：了解已修改的代码
4. **继续未完成项**：从"下次继续"开始

---

## .gitignore 配置

```gitignore
# WORKLIST 文件不提交
docs/worklist/issue-*.md
```

---

## 相关文档

- [研发执行模式](../docs/design/dev-execution-model.md) - Phase 2 执行框架
- [Issue 模板](./issue-template.md) - GitLab Issue 标准格式
- [TRACKING 模板](./tracking-template.md) - Issue 状态追踪

---

## 变更历史

### v1.0.0 (2026-01-07)
- 初始版本
- 通用 WORKLIST 模板
- 任务类型特定清单
- 会话恢复指南
