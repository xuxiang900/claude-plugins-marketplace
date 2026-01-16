---
name: agentic-dev-notebooklm-doc
description: >
  This skill should be used when the user asks to "generate NotebookLM documents", "create AI-friendly docs", "prepare content for NotebookLM", "整理 NotebookLM 文档", "生成 AI 文档", or needs help converting project content into structured documents optimized for Google NotebookLM consumption and AI understanding.
  Triggered by: "NotebookLM", "生成 NotebookLM 文档", "AI 文档", "notebooklm", "notebook llm"
version: 1.0.5
---

# agentic-dev-notebooklm-doc

This skill should be used when the user asks to "generate NotebookLM documents", "create AI-friendly docs", "prepare content for NotebookLM", "整理 NotebookLM 文档", "生成 AI 文档", or needs help converting project content into structured documents optimized for Google NotebookLM consumption and AI understanding.

## Trigger Keywords

- NotebookLM
- 生成 NotebookLM 文档
- AI 文档
- notebooklm
- notebook llm

## Workflow

### Step 1: 确认主题和操作模式

与用户确认要提炼的内容主题和操作模式：

**操作模式**：
| 模式 | 说明 | 适用场景 |
|------|------|----------|
| 新建 | 创建全新的主题文档 | 首次生成某主题 |
| 更新 | 基于已有文档进行增量更新 | 源文档有变更，需要同步 |
| 重写 | 完全重新生成，保留版本历史 | 结构大调整或重大更新 |

**常见主题类型**：
| 主题 | 说明 | 关键信息 |
|------|------|---------|
| 项目概览 | 项目定位、架构、技术栈 | README, CLAUDE.md, 设计文档 |
| 方法论 | 工作流程、最佳实践 | methodology.md, 指南文档 |
| 用户指南 | 快速上手、关键操作、使用说明 | docs/guides/users/, README, 入门文档 |
| 开发者指南 | 开发环境、配置、技术栈、设计背景 | docs/guides/developers/, CLAUDE.md, 设计文档 |
| 技术决策 | 架构选择、技术方案 | ADR, 设计文档 |
| 周期进展 | 周报、月报、里程碑 | weekly_report/, TRACKING.md |
| 研究主题 | 特定领域的研究 | docs/research/ |
| 自定义 | 用户指定的内容 | 用户提供 |

**确认项**：
- 操作模式（新建/更新/重写）
- 主题名称和范围
- 输出目录（默认: docs/notebookllm/）
- 是否需要多文件（复杂主题）

**检查已有文档**：
```bash
ls -la docs/notebookllm/{topic}*.md 2>/dev/null || echo "无已有文档"
```

### Step 2: 收集源材料

根据主题类型收集相关文档：

```bash
# 查找相关文档
find docs/ -name "*.md" -type f
ls -la *.md
```

**按主题的默认源**：
- 项目概览: README.md, CLAUDE.md, docs/design/
- 方法论: methodology.md, docs/guides/, checklists/
- 用户指南: docs/guides/users/, README.md, 入门文档, 快速开始
- 开发者指南: docs/guides/developers/, CLAUDE.md, CONTRIBUTING.md, docs/design/, 技术文档
- 技术决策: docs/design/, docs/adr/
- 周期进展: docs/weekly_report/, TRACKING.md
- 研究主题: docs/research/

**收集信息**：
- 核心文档内容
- 关键代码示例（如需要）
- 相关图表说明（文字描述）

### Step 3: 内容提炼和结构化

将收集的内容进行提炼，遵循 NotebookLM 优化原则：

**内容处理原则**：
1. **完整内联**：NotebookLM 无法访问外部链接，所有引用内容必须内联
2. **保留重点**：提取核心概念、关键决策、重要结论
3. **避免信息丢失**：重要细节需保留，不能过度简化
4. **结构化组织**：使用清晰的标题层级和标签

**语言规范**（适用于所有主题）：
- **主体语言**：中文
- **英文使用场景**：
  - 技术术语（如 API、SDK、CI/CD）
  - 专有名词（如 NotebookLM、Claude Code）
  - 代码和命令示例
  - 引用原文（保留原始语言）
- **格式建议**：首次出现的英文术语可附中文说明，如 "Phase（阶段）"
- **术语解释要求**：
  - 文档中必须包含"关键术语"章节
  - 对所有专业词汇提供简明定义
  - 术语按字母或逻辑顺序排列
  - 格式示例：`**API（Application Programming Interface）**：应用程序编程接口，用于...`

**提炼策略（按主题）**：
- 项目概览: 定位 → 架构 → 技术栈 → 核心模块
- 方法论: 理念 → 流程 → 工具 → 最佳实践
- 用户指南: 是什么 → 快速开始 → 核心功能 → 关键操作 → 常见问题
- 开发者指南: 环境准备 → 项目结构 → 技术栈 → 开发流程 → 设计背景 → 配置说明
- 技术决策: 背景 → 选项 → 决策 → 理由
- 周期进展: 里程碑 → 设计变化 → 技术演进 → 新功能 → 问题解决 → 决策思考
- 研究主题: 背景 → 方法 → 发现 → 结论

### Step 4: 生成 NotebookLM 优化文档

**文件命名规范**：
- 新建: `{output_dir}/{topic}-{date}.md`
- 更新: 保持原文件名，更新版本号
- 重写: `{output_dir}/{topic}-{date}.md`（旧文件移至 archive/）

**文档结构模板（含版本信息）**：
```markdown
---
title: {主题名称}
type: notebooklm-optimized
topic: {主题类型}
version: {major}.{minor}.{patch}
created: {首次创建日期}
updated: {最后更新日期}
source_project: {项目名}
source_docs_version: {源文档版本，如 methodology.md v3.0.0}
tags: [{标签1}, {标签2}, ...]
---

# {主题名称}

## 概述
[简要说明本文档涵盖的内容和目的]

## 核心要点
[最重要的 3-5 个要点，每个要点 2-3 句话展开]

## 详细内容
[按逻辑组织的完整内容，使用清晰的子标题]

### [子主题 1]
...

### [子主题 2]
...

## 关键术语
[重要概念的定义，便于 NotebookLM 理解]

## 常见问题
[Q&A 格式组织的常见问题和解答]

## 参考信息
[原始文档列表和简要说明，非链接形式]

---

## 版本历史

### v{version} ({date})
- {变更说明 1}
- {变更说明 2}

### v{prev_version} ({prev_date})
- {历史变更...}
```

**版本号规则**：
- major: 结构大调整或主题范围变更
- minor: 新增章节或重要内容更新
- patch: 小修正、格式调整、错误修复

**格式优化**：
- 使用 Markdown 格式（NotebookLM 原生支持）
- 清晰的层级结构（不超过 4 级标题）
- 适度使用列表和表格
- 每个文件控制在 10-20 万字以内

### Step 5: 处理大型或复杂主题

如果内容超过单文件推荐大小，拆分为多个文件：

**文件命名规范**：
- `{topic}-overview.md` - 总览
- `{topic}-part1-{subtopic}.md` - 分部
- `{topic}-part2-{subtopic}.md` - 分部
- `{topic}-reference.md` - 参考资料

**拆分策略**：
- 按逻辑模块拆分
- 每个文件保持独立可理解
- 在 overview 中说明各文件关系
- 文件数量建议 2-5 个

### Step 6: 处理更新模式（如适用）

如果是更新或重写已有文档：

**更新模式流程**：
1. 读取已有文档，提取当前版本号和版本历史
2. 对比源文档变更，识别需要更新的内容
3. 更新文档内容，保留未变更的部分
4. 递增版本号（根据变更程度选择 major/minor/patch）
5. 在版本历史中添加本次变更说明

**重写模式流程**：
1. 将旧文件移至 `docs/notebookllm/archive/{topic}-{old_version}.md`
2. 生成全新文档，继承版本历史
3. major 版本号 +1

**变更对比工具**：
```bash
# 检查源文档变更
git log --oneline -5 -- methodology.md docs/guides/
git diff HEAD~5 -- methodology.md
```

**更新摘要生成**：
- 自动识别新增章节
- 自动识别删除内容
- 自动识别修改部分
- 生成简洁的变更说明

### Step 7: 验证和交付

检查生成的文档：

**验证清单**：
- [ ] 文件大小合理（< 100MB, < 50 万字）
- [ ] 无外部链接依赖
- [ ] 核心信息完整无遗漏
- [ ] 结构清晰易读
- [ ] YAML frontmatter 正确（含版本信息）
- [ ] 标签覆盖关键主题
- [ ] 版本历史完整（更新模式）

**交付信息**：
- 列出生成的文件路径
- 说明如何导入 NotebookLM
- 建议的 Notebook 命名
- 版本变更摘要（更新模式）

**NotebookLM 更新提示**：
更新已有 Notebook 时：
1. 删除旧版本的 source
2. 上传新版本文件
3. NotebookLM 会自动重新索引

---

## NotebookLM Slide Deck 生成提示词

在 NotebookLM 中生成 Slide Deck 时，使用以下提示词：

```
中文
根据文档主题，生成相应信息
确保主题明确，结构清晰
减少非主题信息的内容
多提供架构图，流程图等图表的方式来表达信息
```

**Slide Deck 最佳实践**：

1. **明确幻灯片数量和受众**
   - 示例："生成 10-15 张幻灯片，面向初学者介绍项目概览"
   - 示例："创建 5-7 张精简幻灯片，供技术评审使用"

2. **选择合适的 Deck 类型**
   - Detailed Deck：内容详尽，适合邮件发送或独立阅读
   - Presenter Slides：简洁视觉化，配合演讲使用

3. **指定视觉风格**
   - 示例："使用专业商务风格，蓝白配色"
   - 示例："采用简约现代设计，突出数据可视化"
   - 高级技巧：上传品牌背景图或设计模板作为 source，确保视觉一致性

4. **请求图表和可视化**
   - 示例："将数据以信息图表形式展示，使用真实世界的类比"
   - 示例："用流程图展示工作流程"
   - 示例："用架构图说明系统设计"

5. **结构化内容请求**
   - 先让 NotebookLM 生成大纲，确认后再生成完整幻灯片
   - 示例："按照：概述 → 核心概念 → 详细内容 → 总结 的顺序组织"

6. **处理长内容**
   - 如果内容较多，分批生成幻灯片
   - 先生成前半部分，导出 PDF 后再上传继续生成后半部分

7. **迭代优化**
   - 如果幻灯片过于拥挤，点击"View Custom Prompt"，复制提示词
   - 选择 Presenter Slides 重新生成更简洁的版本
   - 可以请求"更精简"或"更详细"的版本


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取项目文档和源材料 | ✅ 可用 |
| Write | 生成 NotebookLM 优化文档 | ✅ 可用 |
| Grep | 搜索文档内容 | ✅ 可用 |
| Glob | 查找文档文件 | ✅ 可用 |
| Bash | 执行文件操作命令 | ✅ 可用 |
| WebSearch | 搜索 NotebookLM 最新实践（如需要） | ✅ 可用 |

## Checklist

- [ ] 操作模式已确认（新建/更新/重写）
- [ ] 主题和范围已确认
- [ ] 已有文档已检查（更新模式）
- [ ] 源材料已收集
- [ ] 内容已提炼和结构化
- [ ] NotebookLM 优化文档已生成
- [ ] 版本号和版本历史已更新
- [ ] 大型主题已合理拆分（如需要）
- [ ] 文档已验证（大小、格式、完整性、版本信息）