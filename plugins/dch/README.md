# DCH Plugin

Dev Context Hub - 开发上下文管理 Plugin。

## 概述

DCH Plugin 提供统一的开发上下文管理能力，专为 AI Agent 协作场景设计。

**核心特性：**
- **统一入口**: 通过自然语言访问所有 DCH 能力
- **6 个 Skills**: 基于意图自动触发
- **3 个 Commands**: 快捷操作，显式调用
- **CLI 集成**: 通过 `Bash(dch:*)` 调用 dch CLI

## 前置条件

使用前需要安装 dchapp：

```bash
pip install dch
dch init
```

## 安装

> **注意**: 以下安装命令中的 `10.10.2.124` 是内网 GitLab 地址，仅限内部网络访问。

```bash
# 1. Clone Marketplace（仅需一次）
mkdir -p ~/claude-plugins
git clone http://10.10.2.124/agent/claude-code-plugins ~/claude-plugins/agent-lab

# 2. 添加 Marketplace（仅需一次）
/plugin marketplace add ~/claude-plugins/agent-lab

# 3. 安装 Plugin
/plugin install dch@agent-lab

# 或从本地路径安装
/plugin install /path/to/dch-tools/build/plugin
```

## 快速开始

安装后，直接用自然语言描述需求，对应 Skill 会自动触发：

```
用户：搜索关于视频编码的文档
→ 触发 dch-search Skill

用户：查看 dch-tools 最近的 MR
→ 触发 dch-glab Skill

用户：导出这个飞书文档
→ 触发 dch-feishu Skill
```

## Skills 列表

| Skill | 触发关键词 | 说明 |
|-------|-----------|------|
| `dch` | DCH, 上下文, context | 入口 Skill，路由到子 Skill |
| `dch/context` | context, 上下文, 同步 | Context 管理 |
| `dch/search` | 搜索, 查找, search | 文档搜索 |
| `dch/glab` | GitLab, MR, 提交 | GitLab 操作 |
| `dch/feishu` | 飞书, feishu, 导出 | 飞书文档操作 |
| `dch/index` | 索引, index | 索引管理 |

## Commands 列表

显式调用的快捷命令：

| Command | 用法 | 说明 |
|---------|------|------|
| `/git-commit` | `/git-commit [message]` | 规范化 Git 提交 |
| `/git-summary` | `/git-summary [time range]` | Git 变更总结 |
| `/dch-index` | `/dch-index [operation]` | DCH 索引管理 |

## 版本信息

- Plugin 版本：1.0.6
- 最低 dchapp 版本：0.1.0

## 相关文档

- [Plugin 安装指南](docs/guides/users/plugin-install.md)
- [Plugin 发布指南](docs/guides/developers/plugin-publish.md)
- [dchapp 文档](http://10.10.2.124/dch/dch-tools) (内网地址)
