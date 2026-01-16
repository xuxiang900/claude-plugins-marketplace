---
name: score-requirements
description: Score multiple requirements using RICE framework
args:
  - requirements_file
tags: [prioritization, strategy, decision]
---

# `/score-requirements` - RICE优先级评分

## 用途
对多个需求进行RICE评分，帮助决策优先级

## 使用方法
```bash
/score-requirements <需求文件路径>
```

## 示例
```bash
/score-requirements backlog/requirements.md
```

## 需求文件格式
```markdown
- [ ] 功能A：用户微信登录
- [ ] 功能B：会员积分系统
- [ ] 功能C：社区评论功能
```

## 执行流程
1. 调用 `rice-scorer` skill 对每个需求进行评分
2. 计算RICE得分并排序
3. 输出优先级建议和ROI分析
