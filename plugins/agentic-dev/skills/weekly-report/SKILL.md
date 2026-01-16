---
name: agentic-dev-weekly-report
description: >
  This skill should be used when the user asks to "generate weekly report", "summarize weekly progress", "create week summary", "整理周报", "生成周报", or needs help compiling project progress into structured documents for review and NotebookLLM consumption.
  Triggered by: "生成周报", "整理周报", "一周进展", "weekly report", "周报"
version: 1.0.5
---

# agentic-dev-weekly-report

This skill should be used when the user asks to "generate weekly report", "summarize weekly progress", "create week summary", "整理周报", "生成周报", or needs help compiling project progress into structured documents for review and NotebookLLM consumption.

## Trigger Keywords

- 生成周报
- 整理周报
- 一周进展
- weekly report
- 周报

## Workflow

### Step 1: 确定时间范围

确认周报覆盖的时间范围
- 默认：过去 7 天
- 可自定义开始和结束日期
- 格式：YYYY-MM-DD

### Step 2: 收集 Git 提交记录

获取指定时间范围内的 Git 活动
```bash
git log --since="7 days ago" --pretty=format:"%h %ad %s" --date=short
git log --since="7 days ago" --stat --oneline
```
提取信息：
- 提交数量和频率
- 主要变更文件
- 提交消息摘要

### Step 3: 收集 Issue 进展

从 GitLab/GitHub 获取 Issue 状态
```bash
glab issue list --state=closed --updated-after="7 days ago"
glab issue list --state=opened
```
分类整理：
- ✅ 已完成的 Issues
- 🔵 进行中的 Issues
- 🆕 新增的 Issues

### Step 4: 收集文档变更

识别文档目录的变更
```bash
git diff --stat HEAD~7 -- docs/ README.md CLAUDE.md
git log --since="7 days ago" --name-only -- docs/
```
重点关注：
- docs/design/ - 设计文档
- docs/planning/ - 规划文档
- docs/research/ - 研究文档

### Step 5: 提取重点文档内容

读取并摘要关键文档
- docs/planning/roadmap.md - 路线图
- docs/design/*.md - 设计文档
- docs/research/*.md - 研究文档

提取要点：
- 新增章节
- 重要决策
- 关键结论

### Step 6: 生成详细信息文档

输出文件：`docs/weekly_report/weekly-{date}-detail.md`

包含完整信息：
- Git 提交完整列表
- Issue 详细状态
- 文档变更详情
- 重点文档摘要
- 下周计划（从 roadmap/issues 提取）

### Step 7: 生成总结文档

输出文件：`docs/weekly_report/weekly-{date}-summary.md`

**文档结构（按顺序）**：
1. **本周亮点**（3-5 条）
   - 对每个亮点适度展开，介绍重要信息
   - 不是简单罗列，而是说明亮点的意义和影响
   - 每个亮点 2-3 句话
2. **统计**
   - Commits、MRs、Issues、新增文档等数据
   - 简洁的表格形式
3. **待解决问题**
   - 当前阻塞或需关注的问题
   - 关联 Issue 链接
4. **下周重点**
   - 下周优先事项
   - 关联 Issue 链接
5. **关键进展**（放最后，作为详细参考）
   - 文档和重点文档链接放在最前面
   - Issue 进度、MR 列表放在后面
   - 代码与工具变更放在最后

**重要：添加 GitLab 链接**
- 变更文档需提供 GitLab blob 链接
- 格式：`{repo_url}/-/blob/main/{file_path}`
- Issue 链接：`{repo_url}/-/issues/{id}`
- MR 链接：`{repo_url}/-/merge_requests/{id}`
- 从 git remote -v 获取仓库 URL

### Step 8: 生成 NotebookLLM 优化版

输出文件：`docs/weekly_report/weekly-{date}-notebookllm.md`

**文档结构**（聚焦变化和进展，避免重复整体架构细节）：
1. **周期概述**
   - 时间范围、主题
   - 本周期的核心目标
2. **里程碑与重大进展**
   - 达成的里程碑
   - 关键成果和突破
3. **设计与架构变化**
   - 新增或调整的设计
   - 变化的原因和背景思考
   - 决策依据
4. **技术栈演进**
   - 新引入的技术或工具
   - 技术栈变化及原因
   - 新技术的应用场景
5. **新功能与能力**
   - 产品/项目新增的功能
   - 功能的价值和使用场景
6. **问题与解决**
   - 遇到的问题
   - 解决方案和思路
7. **决策记录**
   - 本周期的关键决策
   - 决策背后的思考过程
8. **下一周期展望**
   - 重点计划
   - 预期目标

**内容指南**：
- 聚焦变化和进展，避免重复介绍整体架构细节
- 强调"为什么"而不仅是"是什么"
- 记录决策背后的思考过程
- 突出新增和调整的内容

**重要：内联文档摘要**
NotebookLLM 无法访问外部链接，必须内联所有引用内容：
- 重点文档（design/, research/）需提取核心内容摘要
- 每个文档摘要 200-500 字
- 包含文档的主要结论、决策、要点
- 代码变更需说明具体改动意图
- 不要只给链接，要给实际内容

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
   - 示例："生成 10-15 张幻灯片，面向技术团队介绍本周进展"
   - 示例："创建 5-7 张精简幻灯片，供管理层快速了解里程碑"

2. **选择合适的 Deck 类型**
   - Detailed Deck：内容详尽，适合邮件发送或独立阅读
   - Presenter Slides：简洁视觉化，配合演讲使用

3. **指定视觉风格**
   - 示例："使用专业商务风格，蓝白配色"
   - 示例："采用简约现代设计，突出数据可视化"

4. **请求图表和可视化**
   - 示例："将统计数据以图表形式展示"
   - 示例："用流程图展示工作流程变化"
   - 示例："用架构图说明系统设计调整"

5. **结构化内容请求**
   - 示例："按照：里程碑 → 技术变化 → 问题解决 → 下周计划 的顺序组织"
   - 示例："每个主题点用 2-3 张幻灯片展开"

6. **迭代优化**
   - 如果首次生成不满意，调整提示词重新生成
   - 可以请求"更精简"或"更详细"的版本


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取文档和配置文件 | ✅ 可用 |
| Write | 生成周报文档 | ✅ 可用 |
| Grep | 搜索文档内容 | ✅ 可用 |
| Glob | 查找文档文件 | ✅ 可用 |
| Bash | 执行 git 和 glab 命令 | ✅ 可用 |

## Checklist

- [ ] 时间范围已确认
- [ ] Git 提交记录已收集
- [ ] Issue 进展已整理
- [ ] 文档变更已识别
- [ ] 重点文档已提取
- [ ] 详细信息文档已生成
- [ ] 总结文档已生成
- [ ] NotebookLLM 版本已生成