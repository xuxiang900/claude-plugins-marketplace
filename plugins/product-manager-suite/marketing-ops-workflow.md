# 市场运营人员工作流指南

## 概述

本指南描述了市场运营人员使用Product Manager Suite策划和执行营销活动的完整工作流。市场运营涵盖活动策划、促销页面设计、新闻信编写、用户转化路径优化、活动效果分析等端到端工作。

市场运营的核心目标：
- 🎯 提升转化率（注册/购买/留存）
- 📈 扩大用户规模和品牌影响
- 💰 实现业务增长和利润提升
- 🔄 优化用户全生命周期价值

## 市场运营工作流

### 阶段零：活动策划与方案设计（第1周）

**核心目标**：制定活动策略，设计促销玩法，明确业务目标

**技能流程**:
```
campaign-strategist  →  competitor-research  →  data-analysis  →  user-journey-mapper
```

**工作要点**：

1. **活动策略规划**（使用 campaign-strategist）
   - 活动主题设计（黑五/圣诞/618等大促）
   - 促销玩法策划（限时折扣/满减/抽奖/拼团）
   - 定价策略优化（基础版/专业版/企业版）
   - 生命周期营销（新用户转化/老用户召回/流失挽回）
   - 预算分配与ROI目标设定

   **示例调用**：
   ```bash
   /campaign-strategist "设计圣诞节促销活动，提升客单价30%，预算10万"
   ```

2. **竞品活动分析**（使用 competitor-research）
   - 竞品当前促销策略
   - 竞品价格对比矩阵
   - 竞品活动创意亮点
   - 差异化策略制定

   **示例调用**：
   ```bash
   /competitor-research "SaaS项目管理软件 圣诞促销 年度优惠"
   ```

3. **历史数据分析**（使用 data-analysis）
   - 去年同期活动数据复盘
   - 用户购买行为模式
   - 转化率漏斗分析
   - 热力图分析（用户关注点）

4. **用户旅程绘制**（使用 user-journey-mapper）
   - 从首次接触到购买的全流程
   - 识别决策关键点和流失点
   - 优化用户情绪曲线

### 阶段一：页面与内容设计（第2周）

**核心目标**：设计高转化的活动页面和营销内容

**技能流程**:
```
growth-web-architect  →  form-designer (可选)  →  performance-optimizer
```

5. **落地页/活动页设计**（使用 growth-web-architect）
   - **模式A：高转化落地页**
     - 首屏价值主张（Hero Section）
     - AIDA模型应用（吸引/兴趣/欲望/行动）
     - 信任背书（客户案例/奖项/数据）
     - CTA按钮优化（颜色/文案/位置）

   - **模式B：活动运营页**
     - 倒计时营造紧迫感
     - 优惠力度可视化
     - 社交传播设计
     - 规则说明清晰易理解

   - **模式C：整站重构**
     - 信息架构优化（IA）
     - 导航与信息层级
     - SEO友好性设计
     - 品牌一致性

   **示例调用**：
   ```bash
   /growth-web-architect "设计圣诞节促销落地页，卖SaaS项目管理工具年度套餐，6折优惠仅限本周"
   ```

6. **表单设计优化**（复杂转化场景使用 form-designer）
   - 活动报名表单优化
   - 订阅注册表单（减少必填字段）
   - 结账支付流程（多步骤优化）
   - 问卷调查设计（提升完成率）

   **示例调用**：
   ```bash
   /form-designer "优化活动报名表单，当前完成率15%，字段包括姓名、邮箱、电话、公司规模"
   ```

7. **Search页面优化**（电商/内容场景使用 search-experience-designer）
   - 搜索框自动补全优化（热门商品/关键词）
   - 搜索结果排序调整（促销品置顶）
   - 筛选器设计（价格区间/类别/标签）
   - 无结果页面优化（推荐替代商品）

   **示例调用**
   ```bash
   /search-experience-designer "优化电商搜索，圣诞季需要展示促销品，支持价格筛选"
   ```

8. **性能优化**（使用 performance-optimizer）
   - Core Web Vitals优化
   - 图片懒加载和压缩
   - 代码分割减少首屏加载
   - CDN配置与缓存策略

   **关键指标**：
   - LCP < 2.5s（首屏加载速度）
   - 页面大小 < 3MB
   - Lighthouse评分 > 85分

### 阶段二：Newsletter与邮件设计（第2-3周）

**核心目标**：设计高打开率和高点击率的邮件营销

**技能流程**:
```
growth-web-architect (Newsletter模式)  →  data-analysis (邮件数据)
```

9. **Newsletter设计**（使用 growth-web-architect 模式D）
   - **邮件主题优化**
     - 个性化（姓名/行为触发）
     - 紧迫感营造（限时/最后机会）
     - 好奇心驱动（问题/悬念/数字）

   - **邮件内容策略**
     - 移动优先设计（60%邮件在手机上打开）
     - 单一点引导（Single CTA原则）
     - 视觉层次清晰（标题/副标题/正文/CTA）
     - 品牌一致性（色彩/字体/Logo）

   - **邮件类型设计**
     - 促销类邮件（节日特惠/限时折扣）
     - 内容类邮件（博客更新/教程）
     - 系统类邮件（订单确认/发货通知）
     - 唤醒类邮件（流失用户召回）

   - **A/B测试建议**
     - 主题行测试（A/B测试不同主题）
     - 发送时间优化（周几/几点打开率最高）

   **示例调用**：
   ```bash
   /growth-web-architect "设计圣诞节促销 Newsletter，向老用户推广6折优惠，要求打开率>30%，点击率>5%"
   ```

10. **邮件数据分析**
    - 打开率（Open Rate，行业基准20-25%）
    - 点击率（CTR，基准3-5%）
    - 转化率（购买率，基准1-2%）
    - 退订率（<0.5%为健康）

    **优化建议**：
    ```bash
    /data-analysis "分析近3个月Newsletter数据，打开率从35%降到20%，找出原因并优化建议"
    ```

### 阶段三：A/B测试与优化（第3-4周）

**核心目标**：科学验证设计假设，持续优化转化率

**技能流程**:
```
ab-test-designer  →  data-analysis (测试期)  →  data-analysis (结果)
```

11. **测试方案设计**（使用 ab-test-designer）
    - **测试假设构建**
      ```
      如果我们 [做出这个改变]，那么 [期望效果]，因为 [合理依据]。
      示例：
      "如果我们将CTA按钮从绿色改为红色，那么点击率会提升15%，因为红色在页面中更具视觉冲击力"
      ```

    - **测试变量选择**
      - 单变量测试（只改变一个元素）
      - 多变量测试（MVT，测试多个组合）
      - 页面级测试（全新落地页）

    - **样本量计算**
      - 基准转化率10%
      - 预期提升15%
      - 置信度95%，功效80%
      - 每组需要4,300样本，总计8,600

    - **测试时长规划**
      - 日均流量2000 UV → 9天测试期
      - 至少覆盖完整业务周期（周末+工作日）

   **示例调用**：
   ```bash
   /ab-test-designer "测试CTA按钮颜色从绿变红，当前点击率8%，目标提升到10%，日流量2000"
   ```

12. **测试结果分析**
    - 统计显著性判断（p-value < 0.05）
    - 置信区间计算（95% CI）
    - 业务决策建议（是否全量上线）
    - ROI量化（转化率提升 → 收益增长）

    **示例场景**：
    ```bash
    /data-analysis "A/B测试结果显示B组转化率提升18%，p=0.002，计算业务价值，月增收入预计多少"
    ```

### 阶段四：效果分析与复盘（第4-5周）

**核心目标**：量化活动效果，提炼可复用的方法论

**技能流程**:
```
data-analysis  →  user-insight-miner (可选)  →  prd-writer (复盘)
```

13. **活动效果分析**（使用 data-analysis）
    - **核心指标计算**
      - ROI = (收入 - 成本) / 成本 × 100%
      - CPA = 总成本 / 转化用户数（Cost per Acquisition）
      - LTV = 用户生命周期价值
      - 投入产出比 = LTV / CPA（健康值 > 3）

    - **漏斗分析**
      - 曝光量 → 点击量 → 访问量 → 注册量 → 购买量
      - 每步转化率分析
      - 识别最大流失点用于下次优化

    - **用户分层分析**
      - 新用户 vs 老用户转化率
      - 不同渠道质量对比（SEO/SEM/社媒/邮件）
      - 地域/年龄段/设备类型差异

    - **归因分析**
      - 首次触点归因
      - 最后触点归因
      - 多触点归因模型

   **示例调用**：
   ```bash
   /data-analysis "12月圣诞活动数据：投入10万，总收入38万，转化率3.2%，分析ROI和可优化点"
   ```

14. **用户反馈深度挖掘**（可选，但强烈推荐）
    - 活动期间用户反馈聚类
    - NPS评分变化（活动前/中/后）
    - 用户满意度关键词提取
    - 负面反馈优先级排序

15. **复盘报告生成**（使用 prd-writer）
    - 活动目标回顾
    - 执行过程总结
    - 关键数据展示
    - 成功/失败原因分析
    - 可复用的方法论
    - 下次优化建议

### 阶段五：持续优化与自动化（持续进行）

**核心目标**：建立长期运营机制，提升运营效率

**技能流程**:
```
user-insight-miner  →  form-designer (表单优化)  →  solution-architect (系统优化)
```

16. **用户旅程持续优化**
    - 识别新的流失点
    - 优化关键触点体验
    - 提升整体转化率

17. **表单和流程优化**
    - 基于数据的字段精简
    - 多步骤流程优化
    - 移动端专项适配

18. **自动化流程设计**
    - 触发式邮件（用户行为触发）
    - 营销自动化（用户分层自动培育）
    - 客服机器人集成

## 市场运营技能组合

### 核心技能（市场运营高频使用）
| 技能 | 使用场景 | 价值 |
|-----|---------|------|
| **campaign-strategist** | 促销活动策划、定价策略、玩法设计 | 🎯 提升活动创意与策略 |
| **growth-web-architect** | 落地页/活动页/Newsletter设计 | 🎨 提升视觉与转化率 |
| **form-designer** | 报名表单/支付表单优化 | 📝 提升表单转化率 |
| **search-experience-designer** | 电商/内容搜索优化 | 🔍 提升搜索体验 |
| **ab-test-designer** | 测试方案设计 | 🧪 数据驱动决策 |
| **performance-optimizer** | 页面性能优化 | ⚡ 提升加载速度 |
| **data-analysis** | 效果分析/用户行为分析 | 📊 量化优化效果 |

### 支持技能
- **competitor-research**：竞品活动调研
- **user-journey-mapper**：用户转化路径分析
- **user-insight-miner**：用户需求挖掘
- **rice-scorer**：活动优先级排序

### 不适用技能说明
- **solution-architect**：技术架构规划（主要由技术/产品负责）
- **api-spec-writer**：API接口定义（技术专属）
- **user-story-generator**：用户故事拆分（产品专属）
- **prd-writer**：完整PRD编写（产品专属）
- **bdd-spec-analyzer**：BDD测试用例（QA专属）

## 市场运营典型场景

### 场景1：618大促活动策划（4-6周）
```
campaign-strategist (玩法设计) → competitor-research (竞品调研) →
data-analysis (历史数据) → growth-web-architect (活动页) →
form-designer (购买表单) → performance-optimizer (页面加速) →
ab-test-designer (测试方案) → data-analysis (效果复盘)
```

**预期效果**：
- 用户转化率提升30%
- 客单价提升20%
- 活动ROI > 400%

### 场景2：Newsletter设计与优化（2-3周）
```
user-insight-miner (用户偏好) → growth-web-architect (Newsletter) →
form-designer (订阅表单) → data-analysis (打开率分析) →
ab-test-designer (主题优化) → data-analysis (转化率提升)
```

**关键指标**：
- 打开率：25-40%（行业平均20%）
- 点击率：3-8%（行业平均3%）
- 退订率：<0.5%（健康阈值）

### 场景3：搜索引擎优化（SEO）（4-8周）
```
competitor-research (竞品关键词) → growth-web-architect (SEO结构) →
performance-optimizer (性能优化) → data-analysis (排名监控) →
user-insight-miner (搜索意图)
```

**预期效果**：
- 自然流量提升50%
- 目标关键词排名Top 3
- 搜索转化率提升15%

### 场景4：社交媒体营销Campaign（3-4周）
```
campaign-strategist (活动主题) → growth-web-architect (落地页) →
form-designer (报名表单) → data-analysis (渠道效果) →
user-journey-mapper (转化路径)
```

**适用平台**：
- Facebook/Instagram广告
- LinkedIn B2B营销
- TikTok短视频营销
- Reddit社区营销

### 场景5：用户召回活动（2-3周）
```
data-analysis (流失用户) → user-insight-miner (流失原因) →
campaign-strategist (召回策略) → growth-web-architect (召回页面) →
form-designer (回归表单) → data-analysis (召回率)
```

**召回策略**：
- 优惠券激励
- 新功能试用
- 会员专属福利
- 情感化内容

### 场景6：内容营销与SEO（持续）
```
competitor-research (热门内容) → user-insight-miner (痛点) →
search-experience-designer (关键词) → growth-web-architect (内容页) →
performance-optimizer (性能) → data-analysis (流量/转化)
```

**内容类型**：
- 博客文章（教育用户）
- 白皮书（深度内容）
- 案例研究（客户证言）
- 视频教程（产品展示）

## 市场运营 vs 产品经理 vs 设计师

| 维度 | 市场运营 | 产品经理 | 设计师 |
|------|---------|---------|--------|
| **核心产出** | 营销活动、转化漏斗 | 产品功能、用户价值 | 视觉设计、交互体验 |
| **关键指标** | ROI、CPA、转化率、GMV | 留存率、DAU、NPS | 满意度、易用性 |
| **主要工具** | campaign-strategist、growth-web-architect | solution-architect、prd-writer | growth-web-architect |
| **思维方式** | 增长驱动、敏捷迭代 | 用户价值、长期规划 | 体验优先、美学追求 |
| **时间周期** | 短期（1-4周） | 中期（1-3个月） | 中期（1-3个月） |
| **决策依据** | 数据与ROI | 用户研究与战略 | 用户反馈与美学 |

## 市场运营最佳实践

### ✅ 活动前准备清单
- [ ] 明确活动目标（转化/品牌/获客）
- [ ] 竞品调研与差异化策略
- [ ] 历史数据分析与benchmark
- [ ] 预算规划与ROI预期
- [ ] 用户旅程分析与关键触点识别
- [ ] 活动页设计与表单优化
- [ ] 性能优化确保快速加载
- [ ] A/B测试方案准备

### ✅ 活动中执行清单
- [ ] 多渠道推广（邮件/社交/广告）
- [ ] 实时数据监控（流量/转化）
- [ ] 用户反馈收集（及时响应）
- [ ] A/B测试数据积累
- [ ] 活动调整优化（基于数据）

### ✅ 活动后复盘清单
- [ ] 核心指标计算（ROI/CPA/LTV）
- [ ] 数据归因分析
- [ ] 用户满意度调研
- [ ] 成功/失败原因分析
- [ ] 可复用方法论沉淀
- [ ] 下次优化方向确定

### 📊 关键指标公式

```
ROI = (收入 - 成本) / 成本 × 100%
CPA = 总成本 / 转化用户数
LTV = 平均订单价 × 购买频率 × 用户生命周期
投入产出比 = LTV / CPA （健康值 > 3）
转化率 = 转化用户数 / 总访问用户数 × 100%
```

## 快速上手

### 第1步：明确场景
确定你的营销目标：
- 提升转化率？→ 用 growth-web-architect + form-designer
- 测试新设计？→ 用 ab-test-designer
- 优化搜索？→ 用 search-experience-designer
- 分析效果？→ 用 data-analysis

### 第2步：选择技能链
```bash
# 方案A：设计活动页
/campaign-strategist "设计618大促方案" →
/growth-web-architect "设计促销页面" →
/performance-optimizer "优化页面速度" →
/ab-test-designer "设计A/B测试方案"

# 方案B：优化Newsletter
/growth-web-architect "设计圣诞促销邮件" →
/data-analysis "分析打开率" →
/ab-test-designer "测试不同主题"

# 方案C：搜索优化
/data-analysis "分析搜索可用性问题" →
/search-experience-designer "优化电商搜索体验" →
/ab-test-designer "验证新搜索算法效果"
```

### 第3步：执行优化
- 上线测试，收集数据
- 分析结果，找到洞察
- 继续优化，循环提升

## 实践口诀

**市场运营的黄金法则**：
1. **目标明确**：先定KPI再设计活动（转化/品牌/获客）
2. **数据为王**：所有假设都要测试（ab-test-designer）
3. **用户第一**：站在用户视角设计体验（user-journey-mapper）
4. **快速迭代**：小步快跑，持续优化（敏捷思维）
5. **结果驱动**：以ROI为最终衡量标准（量化价值）

**记住**：好运营 = 策略清晰 + 设计精美 + 测试科学 + 分析深入

## 相关文档

- **website-pm-workflow.md** - 网站产品经理工作流（技术实现视角）
- **campaign-strategist/SKILL.md** - 活动策划详细说明
- **growth-web-architect/SKILL.md** - 网页设计详细说明
- **ab-test-designer/SKILL.md** - A/B测试统计方法
- **data-analysis/SKILL.md** - 数据分析与可视化
- **form-designer/SKILL.md** - 表单优化最佳实践
