---
name: write-prd
description: Generate PRD document for a feature
args:
  - feature_name
  - context_file
tags: [documentation, prd, planning]
---

# `/write-prd` - 快速生成PRD

## 用途
基于初步想法或上下文快速生成产品需求文档

## 使用方法
```bash
/write-prd <功能名称> [上下文文件路径]
```

## 示例
```bash
/write-prd "微信一键登录" "context/feedback.csv"
/write-prd "会员积分系统"
```

## 执行流程
1. 调用 `solution-architect` 进行方案设计（如果需要）
2. 调用 `prd-writer` 生成PRD文档
3. 调用 `prd-auditor` 检查逻辑漏洞
4. 输出完整的PRD文档
