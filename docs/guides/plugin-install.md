---
title: "Plugin 安装指南"
version: "1.2.0"
created: "2026-01-08"
updated: "2026-01-09"
---

# Plugin 安装指南

本指南介绍如何从 Agent Lab Marketplace 安装和使用 Plugin。

## 安装方式

### 方式 1: 远程 HTTPS URL（推荐）

直接从远程 Marketplace 安装：

```bash
# 1. 添加远程 Marketplace（仅需执行一次）
/plugin marketplace add https://github.com/dvdfab/pm-plugin-marketplace.git

# 2. 从 Marketplace 安装 Plugin
/plugin install <plugin-name>@agent-lab
```

> **Note**: Claude Code `/plugin marketplace add` 支持的格式：
> - HTTPS URL: `https://example.com/repo.git`
> - GitHub: `owner/repo`
> - Local path: `./path/to/marketplace`
>
> **不支持** HTTP 和 SSH 协议。

### 方式 2: 本地路径安装（备选）

如果 HTTPS 远程访问不可用，可先 clone 到本地：

```bash
# 1. Clone Marketplace 仓库（仅需执行一次）
git clone https://github.com/dvdfab/pm-plugin-marketplace.git
# 如果 HTTPS 无法访问，使用内网 HTTP 地址：
# git clone http://10.10.2.124/agent/pm-plugin-marketplace.git

# 2. 添加本地 Marketplace（仅需执行一次）
/plugin marketplace add /path/to/pm-plugin-marketplace

# 3. 从 Marketplace 安装 Plugin
/plugin install <plugin-name>@agent-lab
```

### 方式 3: 直接从本地路径安装（开发测试）

```bash
# 1. 构建 Plugin
cd /path/to/<plugin-name>
python scripts/build_plugin.py

# 2. 从本地目录安装
/plugin marketplace add ./build/plugin
/plugin install <plugin-name>

# 或者从集中仓库本地路径安装
/plugin marketplace add /path/to/pm-plugin-marketplace
/plugin install <plugin-name>@agent-lab
```

### 方式 4: 开发时直接加载

```bash
# 启动 Claude Code 时直接加载 Plugin 目录
claude --plugin-dir ./build/plugin
```

## 验证安装

安装后，可以通过以下方式验证：

```bash
# 查看已安装的 Plugins
/plugin list

# 查看 Plugin 详情
/plugin info <plugin-name>
```

## 使用 Skills

安装后，Skills 会自动激活。当你提到相关关键词时，对应的 Skill 会被触发。

以 `agentic-dev` 为例：

| 关键词 | 触发的 Skill | 说明 |
|--------|-------------|------|
| "需求分析"、"PRD"、"用户故事" | requirements | 需求收集和分析 |
| "架构设计"、"技术方案" | architecture | 系统架构设计 |
| "拆分任务"、"创建 issue" | split-issues | 任务分解 |
| "CLAUDE.md"、"项目指南" | project-guide | 生成项目 AI 协作指南 |
| "开始 issue"、"创建 worklist" | start-issue | 创建 WORKLIST |
| "实现功能"、"修复 bug" | implement | 代码实现指导 |
| "完成 issue"、"生成 MR" | complete-issue | 完成 Issue 并生成 MR |

## 使用 Commands

Commands 需要显式调用，格式为 `/<plugin-name>:<command-name>`。

以 `agentic-dev` 为例：

```bash
# 为 Issue 创建 WORKLIST
/agentic-dev:worklist #123

# 更新 TRACKING.md
/agentic-dev:tracking

# 生成 MR 描述
/agentic-dev:mr-description
```

## 更新 Plugin

```bash
# 更新到最新版本
/plugin update <plugin-name>

# 安装指定版本
/plugin install <plugin-name>@<version>
```

## 卸载 Plugin

```bash
/plugin uninstall <plugin-name>
```

## 常见问题

### Q: Skills 没有被触发？

A: 确保使用正确的触发关键词。Skills 基于意图识别，可能需要更明确的表述。例如说"帮我进行需求分析"而不只是"需求"。

### Q: Commands 报错？

A: 确保 Plugin 已正确安装并启用。使用 `/plugin list` 检查状态。

### Q: 如何查看模板？

A: 模板文件位于 Plugin 的 `resources/templates/` 目录下，也可以通过 Skills 自动引用。

### Q: 如何获取最新版本？

A:
1. 开发者更新集中仓库后，执行 `/plugin update <plugin-name>`
2. 或重新安装：`/plugin install <plugin-name>@agent-lab`

## 相关文档

- [Plugin 发布指南](./plugin-publish.md) - 如何发布和更新 Plugin
- [开发文档索引](../README.md) - Plugin 开发文档和示例

## 参考资源

### 官方文档

- [Claude Code Plugin 官方文档](https://docs.claude.com/en/docs/claude-code/plugins)
- [Claude Code 概览](https://docs.claude.com/en/docs/claude-code/overview)

### 可用 Plugins

查看 [README.md](../../README.md#available-plugins) 获取当前可用的 Plugin 列表。
