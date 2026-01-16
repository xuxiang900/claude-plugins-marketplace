---
description: 获取工作空间 Git 更新记录并总结
argument-hint: "[time range: today|this week|last N days]"
allowed-tools:
  - Bash
  - Read
  - Write
---

# Workspace Git Summary

获取整个工作空间在指定时段内的 Git 更新记录，并生成总结报告。

**时间范围**: $ARGUMENTS

## 支持的时间格式

- `today` - 今天的提交
- `yesterday` - 昨天的提交
- `this week` / `本周` - 本周的提交
- `last week` / `上周` - 上周的提交
- `last N days` - 最近 N 天的提交 (如 `last 7 days`)
- `since YYYY-MM-DD` - 从指定日期开始
- `YYYY-MM-DD..YYYY-MM-DD` - 指定日期范围
- 留空 - 默认最近 7 天

## 执行流程

### 1. 解析时间参数

根据 `$ARGUMENTS` 解析时间范围，转换为 git log 的 `--since` 和 `--until` 参数：

| 参数 | Git 参数 |
|------|----------|
| `today` | `--since="00:00:00"` |
| `yesterday` | `--since="yesterday 00:00:00" --until="today 00:00:00"` |
| `this week` | `--since="last monday 00:00:00"` |
| `last week` | `--since="2 weeks ago monday" --until="last monday 00:00:00"` |
| `last N days` | `--since="N days ago"` |
| `since YYYY-MM-DD` | `--since="YYYY-MM-DD"` |
| 留空 | `--since="7 days ago"` |

### 2. 扫描工作空间仓库

在当前工作空间目录下扫描所有 Git 仓库：

```bash
# 查找所有包含 .git 的目录
find . -maxdepth 2 -type d -name ".git" 2>/dev/null | sed 's|/.git$||'
```

对于 DCH 工作空间，标准仓库包括：
- `dch-root/` (当前目录)
- `dch-tools/`
- `dch-context-main/`
- `dch-context-mmeai/`
- 其他 `dch-context-*` 仓库

### 3. 获取各仓库的提交记录

对每个仓库执行：

```bash
git -C <repo> log --oneline --since="<time>" --until="<time>" \
    --format="%h|%as|%an|%s" --no-merges
```

输出格式：`短哈希|日期|作者|提交消息`

### 4. 生成总结报告

**报告格式**：

```markdown
# Workspace Git Summary

> 时间范围: <start_date> - <end_date>
> 生成时间: <now>

## 关键变更摘要

<根据提交内容生成 3-5 点关键变更摘要，放在最前面便于快速了解>

1. **xxx 功能完成** - 描述...
2. **xxx 问题修复** - 描述...
3. ...

## 概览

| 仓库 | 提交数 | 贡献者 |
|------|--------|--------|
| dch-root | N | Alice, Bob |
| dch-tools | N | Alice |
| ... | ... | ... |

**总计**: X 次提交，Y 位贡献者

## 按类型分组

| 类型 | 数量 | 说明 |
|------|------|------|
| feat | N | 新功能 |
| fix | N | Bug 修复 |
| docs | N | 文档更新 |
| refactor | N | 重构 |
| chore | N | 杂项 |

## 按仓库分组

### dch-root (N commits)

| 日期 | 作者 | 提交 |
|------|------|------|
| 2025-12-30 | Alice | feat(xxx): add ... |
| ... | ... | ... |

### dch-tools (N commits)

...
```

### 5. 可选：导出报告

如果用户指定 `--output` 或 `-o` 参数，将报告保存到文件：

```bash
# 示例调用
/git-summary last 7 days -o weekly-summary.md
```

## 执行命令

### 获取提交记录的命令模板

```bash
# 遍历所有仓库
for repo in $(find . -maxdepth 2 -type d -name ".git" 2>/dev/null | sed 's|/.git$||'); do
    echo "=== $repo ==="
    git -C "$repo" log --oneline --since="7 days ago" \
        --format="%h|%as|%an|%s" --no-merges 2>/dev/null || true
done
```

### 获取统计信息

```bash
# 每个仓库的提交统计
git -C <repo> log --since="<time>" --oneline --no-merges | wc -l

# 贡献者列表
git -C <repo> log --since="<time>" --format="%an" --no-merges | sort -u
```

## 示例

### 示例 1: 获取本周提交

```
/git-summary this week
```

输出：
```markdown
# Workspace Git Summary

> 时间范围: 2025-12-23 - 2025-12-30
> 生成时间: 2025-12-30 10:30

## 关键变更摘要

1. **AI 工具集成完成** - 完成 AGENTS.md 和 CLAUDE.md 生成工具链
2. **Claude Code Skills Phase 3 完成** - 实现全局部署和上下文索引
3. ...

## 概览

| 仓库 | 提交数 | 贡献者 |
|------|--------|--------|
| dch-root | 8 | yong.li |
| dch-tools | 15 | yong.li |
| dch-context-main | 5 | yong.li |
| dch-context-mmeai | 3 | yong.li |

**总计**: 31 次提交，1 位贡献者

## 按类型分组
...

## 按仓库分组
...
```

### 示例 2: 获取最近 3 天

```
/git-summary last 3 days
```

### 示例 3: 指定日期范围

```
/git-summary 2025-12-25..2025-12-30
```

### 示例 4: 导出到文件

```
/git-summary this week -o reports/weekly-2025-w52.md
```

## 注意事项

- 仅统计非 merge 提交 (`--no-merges`)
- 仓库扫描深度为 2 级目录
- 如果仓库没有符合条件的提交，显示 "无提交"
- 提交消息中的 Angular 规范 type 会被自动识别和分类
- 生成的摘要使用中文描述
