---
title: "Issue Notes 模板"
version: 1.0.0
status: active
created: 2026-01-08
updated: 2026-01-08
authors:
  - agentic-dev Team
tags:
  - template
  - notes
  - persistent-planning
  - phase2
---

# Issue Notes 模板

> 研究笔记文件，用于暂存代码探索发现、API 记录和临时代码片段。

## 核心概念

```
notes.md = 研究的"草稿本" = 外置大内容，减少上下文压力
```

- **生命周期**：Issue 级别，与 plan.md 同步管理
- **存放位置**：`docs/worklist/issue-{id}-notes.md`
- **是否提交**：可选（同 plan.md）

---

## 使用说明

1. 在代码探索过程中记录发现
2. 暂存待使用的代码片段
3. 记录 API/接口信息供后续参考
4. 减少对话历史中的大内容，保持上下文窗口高效

---

## Notes 模板

```markdown
# Notes: Issue #{issue_id} - {issue_title}

> 研究发现和临时暂存，保持对话上下文精简

## 代码探索

### 相关文件

- `{file_path}:{line_range}` - {description}
- `{file_path}:{line_range}` - {description}

### 现有模式

{记录发现的现有实现模式、代码惯例}

### 依赖分析

{记录关键依赖和调用链}

---

## 研究发现

### {topic_1}

- {finding_1}
- {finding_2}
- {finding_3}

### {topic_2}

- {finding_1}
- {finding_2}

---

## 代码片段暂存

### {snippet_description_1}

```{language}
{code_snippet}
```

**用途**：{intended_use}
**状态**：待使用 / 已使用 / 已放弃

### {snippet_description_2}

```{language}
{code_snippet}
```

---

## API/接口记录

### {api_name}

- **URL**: `{url}`
- **方法**: `{method}`
- **参数**:
  - `{param_1}`: {description}
  - `{param_2}`: {description}
- **返回示例**:

```json
{response_example}
```

---

## 配置/环境记录

### {config_name}

```{format}
{config_content}
```

---

## 参考资料

- [{title_1}]({url_1}) - {description}
- [{title_2}]({url_2}) - {description}

---

## 待解决问题

- [ ] {question_1}
- [ ] {question_2}
```

---

## 使用场景

### 场景 1: 代码探索

在阅读现有代码时，记录关键文件和模式：

```markdown
## 代码探索

### 相关文件

- `src/export/base.py:1-50` - 导出基类定义
- `src/models/user.py:45-60` - User 模型，包含 to_dict 方法

### 现有模式

- 所有导出器继承 BaseExporter
- 使用 Strategy 模式，通过 format 参数选择实现
- 文件命名规则：{entity}_{timestamp}.{format}
```

### 场景 2: API 记录

记录外部 API 信息供实现参考：

```markdown
## API/接口记录

### 用户列表 API

- **URL**: `GET /api/v1/users`
- **参数**:
  - `page`: 页码，默认 1
  - `limit`: 每页数量，默认 20
- **返回示例**:

```json
{
  "users": [...],
  "total": 100,
  "page": 1
}
```
```

### 场景 3: 代码片段暂存

在多阶段实现中暂存待使用的代码：

```markdown
## 代码片段暂存

### CSV 导出辅助函数

```python
def format_row(user: User) -> list:
    return [
        user.id,
        user.name,
        user.email,
        user.created_at.isoformat()
    ]
```

**用途**：Phase 3 实现 CSV 导出时使用
**状态**：待使用
```

---

## 与 plan.md 的配合

| 文件 | 作用 | 内容类型 |
|------|------|----------|
| **plan.md** | 任务的"大脑" | 目标、阶段、决策、错误 |
| **notes.md** | 研究的"草稿本" | 发现、片段、API、参考 |

**协作模式**：

1. 探索代码 → 记录到 notes.md
2. 做出决策 → 记录到 plan.md
3. 遇到有用片段 → 暂存到 notes.md
4. 完成功能 → 更新 plan.md 进度

---

## 上下文优化

### 为什么需要 notes.md

- **减少对话膨胀**：大段代码、API 响应等存入 notes，对话中只保留路径
- **支持 KV-cache**：稳定的文件内容有利于缓存命中
- **便于恢复**：中断后快速找回研究成果

### 最佳实践

1. **及时记录**：发现有用信息立即存入，避免遗忘
2. **分类存放**：使用清晰的章节结构
3. **标注状态**：代码片段标注"待使用/已使用/已放弃"
4. **定期清理**：已使用的片段可以删除或标记

---

## .gitignore 配置

```gitignore
# 与 plan.md 相同配置
docs/worklist/issue-*.md
!docs/worklist/TRACKING.md
```

---

## 相关文档

- [持久化规划整合设计](../docs/design/persistent-planning-integration.md) - 设计背景
- [Plan 模板](./issue-plan-template.md) - 执行计划模板
- [WORKLIST 模板](./worklist-template.md) - 临时会话清单

---

## 变更历史

### v1.0.0 (2026-01-08)
- 初始版本
- 研究笔记文件模板
- 使用场景示例
- 与 plan.md 配合说明
