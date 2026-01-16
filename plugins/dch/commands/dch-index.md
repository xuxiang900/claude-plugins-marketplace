---
description: DCH 索引管理命令
argument-hint: "<operation: init|update|status|rebuild>"
allowed-tools:
  - Bash(dch:*)
---

# DCH Index

管理 DCH 上下文索引。

**操作**: $ARGUMENTS

## 支持的操作

- `init` - 初始化索引
- `update` - 更新索引
- `status` - 查看索引状态
- `rebuild` - 重建索引

## 执行流程

### 1. 解析操作参数

根据 `$ARGUMENTS` 确定操作类型：

| 参数 | 命令 |
|------|------|
| `init` | `dch index init` |
| `update` | `dch index update` |
| `status` | `dch index status` |
| `rebuild` | `dch index rebuild --force` |
| 留空 | 显示帮助信息 |

### 2. 执行命令

```bash
dch index <operation> [options]
```

### 3. 返回结果

显示命令执行结果，包括：
- 索引文件数量
- 更新的文档
- 错误信息（如有）

## 示例

### 示例 1: 初始化索引

```
/dch-index init
```

### 示例 2: 更新索引

```
/dch-index update
```

### 示例 3: 查看状态

```
/dch-index status
```
