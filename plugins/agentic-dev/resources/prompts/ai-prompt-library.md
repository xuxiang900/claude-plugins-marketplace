---
title: AI Prompt 库
version: 2.2.0
status: active
created: 2026-01-05
updated: 2026-01-08
authors:
  - Project Team
tags:
  - ai-assisted
  - prompt
  - library
  - persistent-planning
---

# AI Prompt 库

> 项目全生命周期（Phase 0-2）的 AI Prompt 模板集合。

## 使用说明

1. 选择适合的 Prompt 模板
2. 将 `[占位符]` 替换为实际内容
3. 根据需要调整或扩展

`phase` 字段使用 Phase 子阶段编号（如 0.1、1.1）。

---

## Phase 0: 需求分析

### 需求分析

<!-- agentic-dev:prompt id="requirements_analysis" phase=0 -->
```
请帮我进行需求分析。

项目/功能名称：{{project_name}}

需求背景：
{{background}}

已有信息：
{{existing_info}}

请执行以下分析：
1. **需求理解**：梳理核心需求和边界
2. **用户故事**：识别主要用户角色和使用场景
3. **功能列表**：列出功能需求（按优先级）
4. **非功能需求**：性能、安全、可用性等
5. **约束条件**：技术、业务、资源约束
6. **验收标准**：可量化的成功标准

输出格式：结构化的需求分析文档
```
<!-- /agentic-dev:prompt -->

---

## Phase 0.1: 需求收集与参考分析

### 生成参考方案

<!-- agentic-dev:prompt id="generate_reference_solutions" phase=0.1 -->
```
我正在设计一个 {{project_type}} 项目，需要解决以下问题：

[问题描述]

请从 [角度/视角] 提供一个完整的解决方案，包括：
1. 核心架构
2. 关键组件
3. 技术选型建议
4. 潜在风险和应对

输出格式：Markdown 文档
```
<!-- /agentic-dev:prompt -->

**变体**：生成多个方案时，可以指定不同角度：
- "从简单实现的角度"
- "从可扩展性的角度"
- "从性能优先的角度"

### 分析方案共性

<!-- agentic-dev:prompt id="analyze_solutions" phase=0.1 -->
```
我有以下 {{count}} 个参考方案：

方案 1: [方案描述或链接]
方案 2: [方案描述或链接]
...

请分析这些方案的：
1. 共同点（核心理念、技术选型等）
2. 差异点（架构、实现方式等）
3. 各自的优势和劣势
4. 建议采纳的部分

输出格式：对比表格 + 总结分析
```
<!-- /agentic-dev:prompt -->

### 撰写问题陈述

<!-- agentic-dev:prompt id="write_problem_statement" phase=0.1 -->
```
我需要为一个项目撰写问题陈述文档。以下是背景信息：

项目名称：{{project_name}}
当前状态：{{current_state}}
存在问题：{{pain_points}}
目标用户：{{target_users}}
约束条件：{{constraints}}

请基于以上信息，生成一份问题陈述文档，包括：
1. 问题背景
2. 目标用户/系统
3. 核心需求
4. 约束条件
5. 成功标准

使用模板格式，便于后续维护。
```
<!-- /agentic-dev:prompt -->

---

## Phase 1: 架构设计

### 架构设计

<!-- agentic-dev:prompt id="architecture_design" phase=1 -->
```
请帮我进行系统架构设计。

项目名称：{{project_name}}

需求概述：
{{requirements_summary}}

技术约束：
{{tech_constraints}}

请提供以下内容：
1. **架构概述**：整体架构方案和设计理念
2. **模块划分**：核心模块及职责
3. **技术选型**：关键技术栈选择和理由
4. **接口设计**：模块间接口定义
5. **数据设计**：数据模型和存储方案
6. **非功能设计**：
   - 性能设计
   - 安全设计
   - 可扩展性设计
7. **风险分析**：技术风险和缓解措施

输出格式：架构设计文档（含架构图描述）
```
<!-- /agentic-dev:prompt -->

---

## Phase 1.1: 初始架构建立

### 识别文档拆分边界

<!-- agentic-dev:prompt id="identify_doc_boundaries" phase=1.1 -->
```
以下是我的项目 README.md 内容：

{{readme_content}}

这个文档太长了（当前 {{line_count}} 行），需要拆分为多个专门的文档。

请分析并建议：
1. 应该拆分出哪些独立文档？
2. 每个文档的核心内容是什么？
3. 拆分后 README 应该保留什么？
4. 文档之间如何相互引用？

输出：拆分方案 + 新文档结构
```
<!-- /agentic-dev:prompt -->

### 生成文档骨架

<!-- agentic-dev:prompt id="generate_doc_skeleton" phase=1.1 -->
```
请为 {{doc_type}} 生成一个文档骨架。

文档名称：{{doc_name}}
目的：{{purpose}}
主要读者：{{target_readers}}
需要包含的内容：{{content_points}}

使用以下元数据格式：
---
title:
version: 1.0.0
status: draft
created: [今天日期]
updated: [今天日期]
authors:
  - [作者]
tags:
  - [标签]
---

输出：完整的 Markdown 文档骨架
```
<!-- /agentic-dev:prompt -->

### 建立引用关系

<!-- agentic-dev:prompt id="establish_references" phase=1.1 -->
```
我有以下设计文档：

{{doc_list}}

请分析这些文档之间的关系，并建议：
1. 哪些文档应该相互引用？
2. 引用的具体位置和方式？
3. 是否需要创建索引文档？

输出：引用关系图 + 具体引用建议
```
<!-- /agentic-dev:prompt -->

---

## Phase 1.2: 核心设计补全

### 生成设计文档

<!-- agentic-dev:prompt id="generate_design_doc" phase=1.2 -->
```
请为 {{module_name}} 生成一份设计文档。

背景：{{background}}
需求：{{requirements}}
约束：{{constraints}}
参考：{{references}}

文档应包含：
1. 概述
2. 设计方案
3. 接口定义（如适用）
4. 实现考虑
5. 相关文档

使用标准文档模板格式。
```
<!-- /agentic-dev:prompt -->

### 识别设计遗漏

<!-- agentic-dev:prompt id="identify_design_gaps" phase=1.2 -->
```
以下是我当前的设计文档列表：

{{doc_list}}

项目的核心功能包括：
{{feature_list}}

请检查：
1. 是否有功能没有对应的设计文档？
2. 现有文档是否覆盖了所有必要方面？
3. 是否遗漏了重要的非功能性设计（安全、性能、可观测性等）？

输出：遗漏分析 + 建议补充的文档
```
<!-- /agentic-dev:prompt -->

### 技术选型分析

<!-- agentic-dev:prompt id="tech_selection_analysis" phase=1.2 -->
```
我需要为 {{feature_name}} 选择技术方案。

候选方案：
{{candidate_solutions}}

评估维度：
- 性能
- 复杂度
- 维护成本
- 社区支持
- {{additional_dimensions}}

约束条件：{{constraints}}

请提供对比分析和推荐。

输出格式：对比表格 + 推荐理由
```
<!-- /agentic-dev:prompt -->

---

## Phase 1.3: 信息源统一

### 检测文档冲突

<!-- agentic-dev:prompt id="detect_doc_conflicts" phase=1.3 -->
```
请检查以下文档中是否存在冲突或不一致：

{{doc_contents}}

重点检查：
1. 同一概念是否有不同定义？
2. 同一功能是否有不同描述？
3. 版本/阶段划分是否一致？

输出：冲突列表 + 建议的统一方案
```
<!-- /agentic-dev:prompt -->

### 生成术语表

<!-- agentic-dev:prompt id="generate_glossary" phase=1.3 -->
```
请从以下文档中提取术语，生成术语表：

{{doc_contents}}

术语表格式：
- **术语名称**：定义说明

分类建议：
- 核心术语
- 技术术语
- 业务术语

输出：分类的术语表
```
<!-- /agentic-dev:prompt -->

### 内容去重

<!-- agentic-dev:prompt id="deduplicate_content" phase=1.3 -->
```
以下两处内容描述了同一个概念：

位置 1（{{doc_a}}）：
{{content_a}}

位置 2（{{doc_b}}）：
{{content_b}}

请：
1. 确定哪个描述更完整/准确
2. 建议保留位置
3. 生成替换引用的文本

输出：推荐方案 + 替换文本
```
<!-- /agentic-dev:prompt -->

---

## Phase 1.4: 文档同步与精简

### 执行文档同步

<!-- agentic-dev:prompt id="sync_documents" phase=1.4 -->
```
{{source_doc}} 是单一信息源，包含以下定义：

{{source_content}}

请检查 {{target_doc}} 中的相关内容，确保一致：

{{target_content}}

输出：
1. 不一致的地方
2. 建议的修改
3. 修改后的内容
```
<!-- /agentic-dev:prompt -->

### 精简文档内容

<!-- agentic-dev:prompt id="condense_document" phase=1.4 -->
```
以下文档需要精简（当前 [N] 行，目标 < [M] 行）：

[文档内容]

精简原则：
1. 详细内容移至专门文档，改为引用
2. 保留必须遵守的规则
3. 删除冗余描述

输出：精简后的文档 + 移出内容的建议位置
```
<!-- /agentic-dev:prompt -->

### 检查引用完整性

<!-- agentic-dev:prompt id="check_references" phase=1.4 -->
```
请检查以下文档中的引用是否完整：

{{doc_content}}

检查项：
1. 所有 [链接](path) 格式的引用是否有效？
2. 是否有应该添加引用但遗漏的地方？
3. 相关文档章节是否完整？

输出：检查结果 + 修复建议
```
<!-- /agentic-dev:prompt -->

---

## Phase 1.5: 治理框架建立

### 生成规则文档

<!-- agentic-dev:prompt id="generate_rules_doc" phase=1.5 -->
```
请为 {{rule_type}} 生成规则文档。

规范范围：{{scope}}
目标读者：{{target_readers}}
参考示例：{{examples}}

内容要求：
1. 规则要明确，无模糊表述
2. 每条规则要有理由或示例
3. 使用统一的文档模板格式

输出：完整的规范文档
```
<!-- /agentic-dev:prompt -->

### 检查规范完整性

<!-- agentic-dev:prompt id="check_rules_completeness" phase=1.5 -->
```
以下是我当前的规范文档列表：

{{rules_list}}

请检查是否缺少常见的规范：
1. 文档规范
2. 版本管理规范
3. 代码规范
4. 配置规范
5. 安全规范
6. [其他]

输出：缺失分析 + 建议补充
```
<!-- /agentic-dev:prompt -->

### 创建 CLAUDE.md

<!-- agentic-dev:prompt id="create_claude_md" phase=1.5 -->
```
请为我的项目创建 AI Agent 工作指南（CLAUDE.md）。

项目信息：
- 项目名称：{{project_name}}
- 核心概念：{{core_concepts}}
- 技术栈：{{tech_stack}}
- 主要文档：{{main_docs}}

指南要求：
- 保持简洁（< 150 行）
- 包含核心口径、工作方式、快速参考
- 包含 Git 提交规范
- 变更历史仅保留最近 3-5 个版本（如已有 CLAUDE.md，检查并压缩历史）

使用标准 claude-template.md 格式。

输出：完整的 CLAUDE.md
```
<!-- /agentic-dev:prompt -->

### 压缩 CLAUDE.md 变更历史

<!-- agentic-dev:prompt id="compress_claude_changelog" phase=1.5 -->
```
请压缩 CLAUDE.md 的变更历史，保持文档简洁。

当前文件：{{current_claude_md_path}}

压缩规则：
1. 仅保留最近 3-5 个版本的完整变更记录
2. 更早的版本归档到 `docs/history/claude-md-changelog.md`
3. 归档格式：版本号、日期、核心变更（1 行摘要）
4. 在 CLAUDE.md 的变更历史章节顶部添加归档说明

操作步骤：
1. 读取当前 CLAUDE.md
2. 统计变更历史版本数量
3. 如果超过 5 个版本：
   - 提取前 N-5 个版本作为归档内容
   - 创建/更新 `docs/history/claude-md-changelog.md`
   - 更新 CLAUDE.md，仅保留最近 5 个版本
   - 添加归档文件链接
4. 如果 ≤ 5 个版本：无需压缩

输出：
- 更新后的 CLAUDE.md
- docs/history/claude-md-changelog.md（如需归档）
```
<!-- /agentic-dev:prompt -->

---

## Phase 2: 开发执行

> Phase 2 采用统一执行模式，通过任务类型 Label 区分不同工作性质。

### 任务拆分（从 Roadmap 到 Issue）

<!-- agentic-dev:prompt id="split_roadmap_to_issues" phase=2 -->
```
请帮我将以下 Roadmap 功能拆分为可执行的 GitLab Issue。

Roadmap 内容：
{{roadmap_content}}

Feature Label：{{feature_label}}

拆分原则：
1. 每个 Issue 应该在一次 AI Coding 会话内可完成
2. Issue 之间的依赖关系要清晰
3. 每个 Issue 有明确的验收标准

输出格式：
- Issue 标题
- Issue 描述（使用标准模板）
- 建议的任务类型 Label
- 依赖关系说明
```
<!-- /agentic-dev:prompt -->

### 创建 WORKLIST

<!-- agentic-dev:prompt id="create_worklist" phase=2 -->
```
请根据以下 GitLab Issue 创建 WORKLIST 执行清单。

Issue 信息：
- Issue ID：{{issue_id}}
- 标题：{{issue_title}}
- 描述：{{issue_description}}
- 验收标准：{{acceptance_criteria}}
- 任务类型：{{task_type}}

请生成包含以下内容的 WORKLIST：
1. Issue 基本信息表格
2. 验收标准（从 Issue 复制）
3. 分阶段执行清单
4. 相关文件列表

使用 worklist-template.md 格式。
```
<!-- /agentic-dev:prompt -->

### 功能开发（type::feature）

<!-- agentic-dev:prompt id="implement_feature" phase=2 type="feature" -->
```
请帮我实现以下功能。

功能描述：
{{feature_description}}

验收标准：
{{acceptance_criteria}}

技术约束：
- 允许修改的文件：{{allowed_files}}
- 代码风格：{{code_style}}
- 测试要求：{{test_requirements}}

设计文档：
{{design_doc_content}}

请按以下步骤执行：
1. 分析需求和设计文档
2. 实现核心逻辑
3. 编写单元测试
4. 确保代码符合规范
```
<!-- /agentic-dev:prompt -->

### 原型验证（type::prototype）

<!-- agentic-dev:prompt id="prototype_validation" phase=2 type="prototype" -->
```
请帮我进行以下技术方案的原型验证。

验证目标：
{{validation_goal}}

验证点：
{{validation_points}}

约束条件：
{{constraints}}

请执行：
1. 实现最小 POC
2. 验证各验证点
3. 记录验证结果
4. 给出可行性结论（可行/不可行/有条件可行）
5. 提出下一步建议

输出：可行性报告 + POC 代码（如适用）
```
<!-- /agentic-dev:prompt -->

### 代码重构（type::refactor）

<!-- agentic-dev:prompt id="refactor_code" phase=2 type="refactor" -->
```
请帮我重构以下代码。

重构目标：
{{refactor_goal}}

待重构代码：
{{code_to_refactor}}

重构原因：
{{refactor_reason}}

约束条件：
- 保持外部接口不变：{{keep_interface}}
- 测试要求：{{test_requirements}}
- 代码规范：{{code_standards}}

请执行：
1. 分析现有代码结构和问题
2. 设计重构方案
3. 分步骤实施重构
4. 确保测试通过
5. 记录重构前后对比

输出：重构后的代码 + 重构说明
```
<!-- /agentic-dev:prompt -->

### Bug 修复（type::bugfix）

<!-- agentic-dev:prompt id="fix_bug" phase=2 type="bugfix" -->
```
请帮我修复以下 Bug。

问题描述：
{{bug_description}}

复现步骤：
{{reproduction_steps}}

期望行为：
{{expected_behavior}}

相关代码/日志：
{{related_info}}

请执行：
1. 复现并确认问题
2. 定位根因
3. 实现修复
4. 添加回归测试
5. 记录根因分析

输出：修复代码 + 根因分析 + 回归测试
```
<!-- /agentic-dev:prompt -->

### 测试编写（type::test）

<!-- agentic-dev:prompt id="write_tests" phase=2 type="test" -->
```
请为以下功能编写测试。

测试目标：
{{test_target}}

测试范围：
- 功能测试：{{functional_scope}}
- 边界测试：{{boundary_cases}}
- 异常测试：{{exception_cases}}

代码/接口信息：
{{code_info}}

测试框架：{{test_framework}}

请生成：
1. 测试用例列表
2. 测试代码
3. 测试数据（如需要）

覆盖率目标：{{coverage_target}}
```
<!-- /agentic-dev:prompt -->

### 生成 MR 描述

<!-- agentic-dev:prompt id="generate_mr_description" phase=2 -->
```
请为以下代码变更生成 MR 描述。

关联 Issue：{{issue_id}} - {{issue_title}}
变更文件：
{{changed_files}}

变更摘要：
{{change_summary}}

请生成包含以下内容的 MR 描述：
1. 变更概述
2. 主要修改点
3. 测试情况
4. 影响范围
5. 关联 Issue

格式要求：简洁清晰，便于 Review
```
<!-- /agentic-dev:prompt -->

### 代码 Review 辅助

<!-- agentic-dev:prompt id="code_review" phase=2 -->
```
请帮我 Review 以下代码变更。

变更内容：
{{code_diff}}

Review 维度：
1. 代码质量（可读性、可维护性）
2. 逻辑正确性
3. 性能考虑
4. 安全风险
5. 测试覆盖

项目规范：
{{code_standards}}

输出：Review 意见列表（按严重程度分类）
```
<!-- /agentic-dev:prompt -->

### 初始化持久化规划

<!-- agentic-dev:prompt id="init_persistent_planning" phase=2 -->
```
请帮我为以下 Issue 初始化持久化规划文件。

Issue 信息：
- Issue ID：{{issue_id}}
- 标题：{{issue_title}}
- 描述：{{issue_description}}
- 验收标准：{{acceptance_criteria}}
- 任务类型：{{task_type}}
- 预估时间：{{estimate}}

请生成：
1. issue-{{issue_id}}-plan.md（执行计划）
   - 目标（一句话）
   - 验收标准（从 Issue 复制）
   - 执行阶段（根据任务类型拆分）
   - 关键决策表格（空）
   - 错误与解决表格（空）
   - 当前状态

2. issue-{{issue_id}}-notes.md（研究笔记）
   - 相关文件列表（空）
   - 研究发现区域（空）
   - 代码片段暂存区（空）

使用 issue-plan-template.md 和 issue-notes-template.md 格式。
```
<!-- /agentic-dev:prompt -->

### 会话恢复（持久化模式）

<!-- agentic-dev:prompt id="resume_session_persistent" phase=2 -->
```
请帮我恢复上次中断的工作会话。

执行计划文件：
{{plan_md_path}}

研究笔记文件（如有）：
{{notes_md_path}}

请执行：
1. 读取 plan.md
   - 了解目标和当前阶段
   - 查看已完成的阶段
   - 查看已做的决策和遇到的错误

2. 读取 notes.md（如有）
   - 恢复研究发现
   - 获取已收集的代码片段

3. 从 plan.md 的 CURRENT 阶段继续执行

4. 更新 plan.md 的"当前状态"
```
<!-- /agentic-dev:prompt -->

### 会话恢复（临时模式）

<!-- agentic-dev:prompt id="resume_session" phase=2 -->
```
请帮我恢复上次中断的工作会话。

WORKLIST 内容：
{{worklist_content}}

上次完成的工作：
{{last_completed}}

当前代码状态：
{{current_state}}

请：
1. 理解任务背景
2. 确认当前进度
3. 继续未完成的工作

从"{{next_step}}"开始继续执行。
```
<!-- /agentic-dev:prompt -->

### 注意力校准

<!-- agentic-dev:prompt id="attention_calibration" phase=2 -->
```
请重新校准注意力，确保不偏离核心目标。

执行计划文件：
{{plan_md_path}}

请执行：
1. 读取 plan.md 的"目标"和"验收标准"
2. 对比当前工作是否对齐核心目标
3. 如有偏离，说明偏离点并重新聚焦
4. 继续执行下一个阶段任务

这是一次注意力校准检查，触发原因：{{trigger_reason}}
（可能的原因：进入新阶段、做出架构决策、工具调用超过20次、遇到困惑）
```
<!-- /agentic-dev:prompt -->

---

## 通用 Prompt 模式

### 迭代改进

```
以下是之前生成的 [文档类型]：

[内容]

请根据以下反馈进行修改：

[反馈内容]

输出：修改后的完整文档
```

### 格式转换

```
请将以下内容转换为 [目标格式]：

[原始内容]

格式要求：
[具体要求]

输出：转换后的内容
```

### 扩展细化

```
以下是一个大纲/骨架：

[大纲内容]

请将 [指定章节] 展开，增加详细内容。

输出：展开后的完整内容
```

---

## 变更历史

### v2.2.0 (2026-01-08)
- **新增持久化规划相关 Prompt**
- 新增 `init_persistent_planning` - 初始化 plan.md + notes.md
- 新增 `resume_session_persistent` - 持久化模式会话恢复
- 新增 `attention_calibration` - 注意力校准检查
- 原 `resume_session` 重命名为"会话恢复（临时模式）"

### v2.1.0 (2026-01-07)
- **新增 Skills 所需 Prompt 标记**
- 新增 `requirements_analysis` - Phase 0 需求分析
- 新增 `architecture_design` - Phase 1 架构设计
- 新增 `refactor_code` - Phase 2 代码重构

### v2.0.0 (2026-01-07)
- **新增 Phase 2 开发执行 Prompt**
- 任务拆分（从 Roadmap 到 Issue）
- 创建 WORKLIST
- 功能开发（type::feature）
- 原型验证（type::prototype）
- Bug 修复（type::bugfix）
- 测试编写（type::test）
- 生成 MR 描述
- 代码 Review 辅助
- 会话恢复

### v1.1.0 (2026-01-05)
- 统一 Prompt 的阶段编号为 Phase 0.1-1.5
- 补充缺失的 Prompt 标记（精简文档内容）

### v1.0.0 (2026-01-05)
- 初始版本
- 覆盖 Phase 0-1 的常用 Prompt
- 添加通用 Prompt 模式
