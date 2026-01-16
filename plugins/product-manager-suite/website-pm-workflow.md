# 网站产品经理工作流指南

## 概述

本指南描述了使用Product Manager Suite进行网站产品管理的典型工作流程。网站产品经理主要关注网页设计、信息架构、内容展示和用户体验优化。

## 典型工作流程

### 🔍 阶段一：发现与研究（1-2周）

**核心目标**：理解用户需求、市场现状和竞争格局

**技能流程**：
```
user-insight-miner  →  competitor-research  →  data-analysis
```

1. **用户洞察挖掘**：分析用户反馈、客服记录，识别网站体验痛点
2. **竞品研究**：分析竞品网站结构、信息架构、关键页面设计
3. **数据分析**：解读网站流量、转化率、用户行为数据

**新技能应用点**（可选）：
- 使用 `search-experience-designer` 分析搜索可用性问题和日志
- 使用 `performance-optimizer` 分析网站性能瓶颈

### 🎯 阶段二：战略规划（第3周）

**核心目标**：确定网站整体架构和设计方案

**技能流程**：
```
solution-architect (Web模式)  →  performance-optimizer (可选)  →  campaign-strategist (可选)
```

4. **方案架构设计**（关键步骤）：
   - 网站信息架构设计（导航、页面层级）
   - 技术方案选型（CMS、前后端框架）
   - 功能模块规划
   - Plan A/B 对比分析
   - **性能基线设定**：调用 `performance-optimizer` 制定性能预算

5. **增长策略制定**（如果是营销导向的网站）：
   - 用户生命周期设计
   - 转化漏斗优化
   - 活动促销策略

### 🎨 阶段三：设计与UX（4-5周）

**核心目标**：将策略转化为具体的页面设计和用户体验

**技能流程**：
```
growth-web-architect  ↔  user-journey-mapper  ↔  form-designer (可选)
```

6. **网页架构设计**（核心技能）：
   - 页面结构设计（布局、模块、信息层级）
   - 文案策略制定（标题、CTA、价值主张）
   - 视觉动线规划
   - SEO友好性设计

7. **用户旅程可视化**：
   - 绘制用户访问路径图
   - 识别情绪曲线和痛点
   - 优化转化漏斗

8. **表单与搜索设计**（复杂场景）：
   - **表单设计**：调用 `form-designer` 优化注册、结账、问卷表单
   - **搜索设计**：调用 `search-experience-designer` 设计站内搜索
   - **A/B测试准备**：调用 `ab-test-designer` 设计验证方案

**⚠️ 重要**：这个阶段通常需要多次迭代，skills 会交叉使用。

### 🔧 阶段四：验证与优化（并行）

**核心目标**：确保设计质量，持续优化体验

**技能流程**：
```
prd-auditor  →  ab-test-designer  →  performance-optimizer (并行)
```

9. **PRD审计**：
   - 逻辑排雷，检查死循环和边界条件
   - 验证技术可行性

10. **测试方案设计**：
    - 设计A/B测试验证设计假设
    - 计算样本量、测试时长

11. **性能优化**：
    - 优化LCP、FID、CLS等Core Web Vitals指标
    - 图片压缩、代码分割、缓存策略

### 📝 阶段五：文档化（第6-7周）

**核心目标**：输出可执行的PRD文档

**技能流程**：
```
prd-writer  →  bdd-spec-analyzer (可选)  →  bdd-feature-writer (可选)
```

12. **PRD生成**：
    - 功能需求详细描述
    - 页面交互规格说明
    - 验收标准定义
    - 技术约束文档化

13. **BDD规范**（可选，复杂业务）：
    - 分析验收标准
    - 生成Gherkin测试用例

### 🚀 阶段六：交付支持（持续）

**技能流程**：
```
user-story-generator  →  road-map-visualizer  →  api-spec-writer  →  data-analysis (持续)
```

14. **用户故事拆分**：将PRD转化为开发任务
15. **路线图规划**：制定版本发布计划
16. **API规范生成**（如果需要）：前后端接口定义
17. **持续监控**：分析上线数据，迭代优化

## 网站PM专属技能组合（更新版）

### 核心技能（网站专用）
- **growth-web-architect**：唯一专注于网页架构设计的技能
  - AIDA模型应用
  - CTA优化策略
  - SEO结构规划
  - Newsletter/邮件模板

- **solution-architect**：内置Web模式识别
  - CMS维护成本评估
  - 权限模型设计（RBAC）
  - 平台/网站专属约束

- **form-designer**：表单转化率优化
  - 字段精简与验证策略
  - 移动端适配
  - 分步表单设计

- **search-experience-designer**：站内搜索体验设计
  - 自动补全与建议
  - 查询理解与排序算法
  - 无结果优化

- **performance-optimizer**：网站性能优化
  - Core Web Vitals优化
  - 资源加载策略
  - 缓存与CDN配置

### 支持技能
- **user-journey-mapper**：网页导航流程可视化
- **ab-test-designer**：A/B测试方案设计，验证优化效果
- **campaign-strategist**：营销页、活动页策划
- **competitor-research**：竞品网站分析

## 典型场景示例（更新版）

### 场景1：落地页快速制作（2-3周）
```
competitor-research → growth-web-architect → form-designer (如有表单) → prd-writer → user-journey-mapper
```

### 场景2：官网重构（2-3个月）
```
user-insight-miner → data-analysis → performance-optimizer → solution-architect → growth-web-architect → user-journey-mapper → form-designer (注册/联系表单) → prd-writer → user-story-generator
```

### 场景3：营销活动页（1-2周）
```
campaign-strategist → growth-web-architect → performance-optimizer → form-designer (报名表单) → prd-writer → user-journey-mapper → bdd-spec-analyzer
```

### 场景4：搜索功能优化（3-4周）
```
data-analysis (分析搜索日志) → search-experience-designer → ab-test-designer (测试新搜索) → performance-optimizer (优化搜索性能) → prd-writer → data-analysis (验证效果)
```

### 场景5：结账流程优化（2-3周）
```
user-journey-mapper (识别流失点) → form-designer (设计结账表单) → ab-test-designer (测试优化方案) → performance-optimizer (确保流程流畅) → data-analysis (分析转化率提升)
```

### 场景6：全站性能改造（4-6周）
```
performance-optimizer (性能审计) → solution-architect (技术方案) → growth-web-architect (页面改造) → ab-test-designer (验证改进) → data-analysis (量化ROI: 性能提升→转化率提升)
```

## 技能协同矩阵

| 技能组合 | 应用场景 | 输出价值 |
|---------|---------|---------|
| **user-journey-mapper + form-designer** | 复杂表单设计 | 识别痛点→优化设计，转化率提升20% |
| **growth-web-architect + performance-optimizer** | 落地页/官网 | 美观+快速，平衡体验与性能 |
| **search-experience-designer + ab-test-designer** | 搜索功能优化 | 数据验证搜索改进效果 |
| **form-designer + ab-test-designer** | 表单优化 | 科学验证字段/布局的最佳方案 |
| **performance-optimizer + data-analysis** | 性能优化 | 量化性能提升的业务价值 |

## 网站PM vs 通用PM的区别（更新版）

| 维度 | 网站PM | 通用PM |
|------|--------|--------|
| **核心产出** | 网页、信息架构、视觉设计 | 功能、逻辑、数据模型 |
| **关键指标** | PV、转化率、跳出率、SEO排名 | DAU、留存率、功能使用率 |
| **主要工具** | growth-web-architect、performance-optimizer、search-experience-designer | solution-architect、api-spec-writer |
| **核心能力** | 表单优化、搜索设计、性能优化 | 数据库设计、API规范、系统集成 |
| **优化重点** | 加载速度、转化率、用户体验 | 功能完整性、系统稳定性 |

## 技能索引（19个技能 - 更新版）

### 研究分析类
- `/competitor-research` - 竞品网站分析
- `/user-insight-miner` - 用户反馈分析
- `/data-analysis` - 网站数据分析

### 设计优化类
- `/growth-web-architect` - 网页设计与优化
- `/form-designer` - 表单转化率优化
- `/search-experience-designer` - 搜索体验设计
- `/performance-optimizer` - 网站性能优化
- `/user-journey-mapper` - 用户旅程可视化

### 测试验证类
- `/ab-test-designer` - A/B测试方案设计
- `/prd-auditor` - PRD逻辑排雷
- `/bdd-spec-analyzer` - 验收标准分析
- `/bdd-feature-writer` - BDD测试用例

### 规划文档类
- `/solution-architect` - 网站架构设计
- `/prd-writer` - 网站PRD撰写
- `/user-story-generator` - 用户故事拆分
- `/roadmap-visualizer` - 产品路线图
- `/api-spec-writer` - 接口规范定义

### 策略决策类
- `/campaign-strategist` - 营销活动策划
- `/rice-scorer` - 需求优先级评分

## 实践口诀

**网站PM的黄金法则**：
1. **先研究再设计**：competitor-research → growth-web-architect
2. **数据驱动优化**：ab-test-designer 验证所有假设
3. **性能是基本**：performance-optimizer 确保快速体验
4. **转化靠细节**：form-designer + search-experience-designer 提升关键路径
5. **持续迭代**：data-analysis 监控效果，循环优化

**记住**：好网站 = 美观设计 + 快速加载 + 流畅体验 + 持续优化
