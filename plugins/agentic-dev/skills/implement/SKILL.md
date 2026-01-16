---
name: agentic-dev-implement
description: >
  This skill should be used when the user asks to "implement feature", "fix bug", "refactor code", "write tests", or needs help with code implementation based on task type (feature/bugfix/refactor/test).
  Triggered by: "实现功能", "修复 bug", "重构代码", "编写测试"
version: 1.0.5
---

# agentic-dev-implement

This skill should be used when the user asks to "implement feature", "fix bug", "refactor code", "write tests", or needs help with code implementation based on task type (feature/bugfix/refactor/test).

## Trigger Keywords

- 实现功能
- 修复 bug
- 重构代码
- 编写测试

## Workflow

### Step 1: 理解任务需求

阅读 WORKLIST 中的当前任务
- 明确功能需求
- 了解验收标准

### Step 2: 分析现有代码

使用 Grep/Glob 搜索相关代码
- 找到需要修改的文件
- 理解现有实现

### Step 3: 实现代码变更

根据任务类型执行：
- **feature**: 新增功能代码
- **bugfix**: 定位并修复问题
- **refactor**: 优化代码结构
- **test**: 编写测试用例

### Step 4: 验证实现

确保代码正确性
- 运行相关测试
- 检查代码规范

### Step 5: 更新 WORKLIST

标记当前任务为已完成
- 勾选对应 checkbox
- 添加实现备注（如需要）


## Available Tools

| Tool | Description | Status |
|------|-------------|--------|
| Read | 读取源代码和文档 | ✅ 可用 |
| Grep | 搜索代码模式 | ✅ 可用 |
| Glob | 查找文件 | ✅ 可用 |
| Write | 写入新文件 | ✅ 可用 |
| Edit | 编辑现有文件 | ✅ 可用 |
| Bash | 运行测试和构建 | ✅ 可用 |

## Checklist

- [ ] 任务需求已理解
- [ ] 相关代码已分析
- [ ] 代码变更已实现
- [ ] 测试已通过
- [ ] WORKLIST 已更新