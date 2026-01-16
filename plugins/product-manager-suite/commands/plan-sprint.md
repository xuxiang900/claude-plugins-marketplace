---
name: plan-sprint
description: Plan sprint with user stories and estimates
tags: [agile, planning, sprint]
---

# `/plan-sprint` - 敏捷迭代规划

## 用途
将PRD转化为用户故事和冲刺计划

## 使用方法
```bash
/plan-sprint
```

## 前提条件
- 已完成PRD文档
- 已与开发团队对齐技术方案

## 执行流程
1. 调用 `user-story-generator` 切分用户故事
2. 生成验收标准（BDD Spec）
3. 创建冲刺看板和甘特图
4. 输出完整的迭代计划
