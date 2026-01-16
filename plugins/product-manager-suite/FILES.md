# 文件清单

## 📁 目录结构

```
product-manager-suite/
│
├── 📄 .claude-plugin/
│   └── plugin.json                         # 插件清单（核心元数据）
│
├── 🤖 agents/
│   └── pm-lead/
│       └── AGENT.md                       # PM Leader Agent配置
│
├── ⚡ commands/                            # 快捷命令（5个）
│   ├── research-market.md                 # 市场调研命令
│   ├── write-prd.md                       # 生成PRD命令
│   ├── analyze-competitor.md              # 竞品分析命令
│   ├── score-requirements.md              # 优先级评分命令
│   └── plan-sprint.md                     # 冲刺规划命令
│
├── 🛠️ skills/                             # 专业技能（19个）
│   ├── ab-test-designer/                  # A/B测试方案设计 **[NEW]**
│   ├── api-spec-writer/
│   ├── bdd-feature-writer/
│   ├── bdd-spec-analyzer/
│   ├── campaign-strategist/
│   ├── competitor-research/
│   ├── data-analysis/
│   ├── form-designer/                     # 表单转化率优化 **[NEW]**
│   ├── growth-web-architect/
│   ├── performance-optimizer/             # 网站性能优化 **[NEW]**
│   ├── prd-auditor/
│   ├── prd-writer/
│   ├── rice-scorer/
│   ├── roadmap-visualizer/
│   ├── search-experience-designer/        # 搜索体验设计 **[NEW]**
│   ├── solution-architect/
│   ├── user-insight-miner/
│   ├── user-journey-mapper/
│   └── user-story-generator/
│
├── 📚 文档
│   ├── README.md                          # 完整使用指南
│   ├── INSTALL.md                         # 安装说明
│   ├── FILES.md                           # 本文件
│   ├── website-pm-workflow.md             # 网站产品经理工作流指南 **[NEW]**
│   ├── desktop-pm-workflow.md             # 桌面应用产品经理工作流指南 **[NEW]**
│   └── marketing-ops-workflow.md          # 市场运营人员工作流指南 **[NEW]**
│
└── 🔧 install.sh                          # 安装脚本
```

## 📊 统计

- **Total Files**: ~80+
- **Agent**: 1个 (pm-lead)
- **Skills**: 19个（新增4个）
- **Commands**: 5个
- **Documentation**: 6个（新增3个工作流指南）

## 🎯 功能覆盖（更新版）

### 研究分析 (3 skills)
- 竞品研究
- 用户洞察挖掘
- 数据分析

### 规划文档 (5 skills)
- 方案架构设计
- PRD生成
- 用户故事拆分
- API规范生成
- 路线图可视化

### 质量保证 (4 skills)
- PRD审计
- BDD验收标准分析
- BDD功能文件生成
- A/B测试方案设计 **[NEW]**

### 设计优化 (5 skills) **[扩展]**
- 网页架构设计
- 表单转化率优化 **[NEW]**
- 搜索体验设计 **[NEW]**
- 网站性能优化 **[NEW]**
- 用户旅程地图

### 策略决策 (2 skills)
- RICE优先级评分
- 营销活动策划

## 🎭 场景化工作流

### 网站产品经理 | website-pm-workflow.md
**核心关注**：网页设计、转化率、SEO、加载性能

**典型技能链**：
```
competitor-research → growth-web-architect → form-designer →
ab-test-designer → performance-optimizer → prd-writer → user-story-generator
```

### 桌面应用产品经理 | desktop-pm-workflow.md
**核心关注**：跨平台兼容、离线能力、系统集成、安装更新

**典型技能链**：
```
competitor-research → solution-architect → user-journey-mapper →
prd-writer → api-spec-writer
```

### 市场运营人员 | marketing-ops-workflow.md
**核心关注**：活动策划、转化漏斗、Newsletter设计、数据分析

**典型技能链**：
```
campaign-strategist → growth-web-architect → form-designer →
ab-test-designer → data-analysis → user-journey-mapper
```

## 🚀 安装后可用命令

```bash
# 启动代理
/Act as pm-lead

# 快速命令
/research-market <行业> <关键词>
/write-prd <功能名称> [上下文]
/analyze-competitor <URL>
/score-requirements <文件>
/plan-sprint

# 直接调用技能
/competitor-research <关键词>
/prd-writer <需求>
/rice-scorer <需求文件>
# ... 等等
```

## 🆕 版本演进

### v1.0.2 → v1.2.0 新增内容

#### 新增技能（4个）
1. **form-designer** (高优先级)
   - 表单转化率优化
   - 注册/结账/问卷等场景
   - 移动端专项适配

2. **ab-test-designer** (高优先级)
   - 科学A/B测试方案设计
   - 样本量计算与统计方法
   - 结果分析与决策

3. **search-experience-designer** (中优先级)
   - 站内搜索体验优化
   - 适用于电商/内容/SaaS平台
   - 查询理解 + 结果排序

4. **performance-optimizer** (中优先级)
   - Core Web Vitals优化
   - 图片/CSS/JS资源优化
   - SEO排名提升

#### 新增文档（3个）
1. **website-pm-workflow.md**
   - 6阶段工作流程
   - 19个技能应用指南
   - 6个典型场景示例

2. **desktop-pm-workflow.md**
   - 6阶段工作流程
   - 桌面端特有挑战
   - 6个典型场景示例

3. **marketing-ops-workflow.md**
   - 5阶段工作流程（策划→设计→测试→分析→优化）
   - 用户角色：市场运营人员
   - 6个营销场景（大促/Newsletter/SEO/社交媒体/召回/内容营销）

## 📥 快速开始

```bash
# 安装插件
/plugin install ./product-manager-suite

# 查看可用技能
/skill list

# 查看工作流文档
/help skill <skill-name>

# 开始工作
/Act as pm-lead
"我需要优化网站的注册转化率"
```

## 🔗 相关文档

- **README.md** - 完整使用指南（含安装、配置、快速开始）
- **INSTALL.md** - 安装说明
- **website-pm-workflow.md** - 网站PM专用指南
- **desktop-pm-workflow.md** - 桌面应用PM专用指南
- **marketing-ops-workflow.md** - 市场运营人员专用指南
- **agents/pm-lead/AGENT.md** - PM Leader详细配置
- **.claude-plugin/plugin.json** - 插件清单（核心元数据）
- **各 skill 目录下的 SKILL.md** - 每个技能的详细说明
