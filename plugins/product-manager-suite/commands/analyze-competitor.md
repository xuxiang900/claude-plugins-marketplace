---
name: analyze-competitor
description: Analyze competitor products and strategies
args:
  - product_url
tags: [research, competitor, analysis]
---

# `/analyze-competitor` - 竞品深度分析

## 用途
深度分析特定竞品的功能、定价和策略

## 使用方法
```bash
/analyze-competitor <产品URL>
```

## 示例
```bash
/analyze-competitor https://notion.so
/analyze-competitor https://slack.com
```

## 执行流程
1. 调用 `competitor-research` skill 进行深度分析
2. 生成SWOT分析报告
3. 输出可执行的对策建议
