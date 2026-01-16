---
name: research-market
description: Quick market research using available data
args:
  - industry
  - keywords
tags: [research, market, analysis]
---

# `/research-market` - 快速市场调研

## 用途
快速进行市场调研和竞品分析

## 使用方法
```bash
/research-market <行业> <关键词...>
```

## 示例
```bash
/research-market 电商 "社区团购 直播带货"
/research-market SaaS "团队协作 项目管理"
```

## 执行流程
1. 调用 `competitor-research` skill 分析市场现状
2. 生成结构化竞品分析报告
3. 输出关键洞察和建议
