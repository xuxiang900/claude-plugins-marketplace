---
title: "Plugin 发布与管理指南"
version: "1.1.0"
created: "2026-01-08"
updated: "2026-01-08"
---

# Plugin 发布与管理指南

本指南介绍如何创建、发布、更新 Claude Code Plugin，以及如何管理集中式 Plugin 仓库。

---

## 1. 架构概览

我们采用**集中模式**管理 Plugin：

```
Projects/
├── agentic-dev/                    # 源仓库 A
│   ├── scripts/build_plugin.py     # 构建脚本（支持 --publish）
│   ├── schema/skills-manifest.yaml # 源配置
│   └── build/plugin/               # 构建产物（临时）
│
├── project-b/                      # 源仓库 B（未来）
│   ├── scripts/build_plugin.py
│   └── build/plugin/
│
└── claude-code-plugins/            # 集中分发仓库（Marketplace）
    ├── .claude-plugin/
    │   └── marketplace.json        # Marketplace 配置
    ├── plugins/
    │   ├── agentic-dev/            # ← 从 agentic-dev 发布
    │   ├── project-b/              # ← 从 project-b 发布
    │   └── ...
    └── README.md
```

**工作流程**：
1. 各项目在自己的仓库中开发 Plugin
2. 执行构建脚本生成 Plugin 产物
3. 使用 `--publish` 参数自动发布到集中仓库
4. 集中仓库统一管理分发

---

## 2. agentic-dev Plugin 发布流程

### 2.1 首次发布

已完成，Plugin 已在集中仓库中。

### 2.2 更新发布

当修改了 agentic-dev 的源文件后：

```bash
cd /path/to/agentic-dev

# 方式 1: 构建并自动发布（推荐）
python scripts/build_plugin.py --publish

# 方式 2: 分步执行
python scripts/build_plugin.py          # 仅构建
# 手动复制 build/plugin/ 到 claude-code-plugins/plugins/agentic-dev/
```

### 2.3 提交到集中仓库

```bash
cd /path/to/claude-code-plugins
git add .
git commit -m "chore: update agentic-dev to v1.x.x"
git push origin main
```

### 2.4 版本管理

更新版本时，需要修改两处：

1. `schema/skills-manifest.yaml` 中的 `version`
2. `scripts/build_plugin.py` 中的 `PLUGIN_VERSION`

---

## 3. 其他项目发布 Plugin

### 3.1 创建 Plugin 结构

每个项目需要创建符合规范的 Plugin 结构：

```
my-project/
├── scripts/
│   └── build_plugin.py     # 可参考 agentic-dev 的脚本
└── build/
    └── plugin/             # 构建产物
        ├── .claude-plugin/
        │   └── plugin.json
        ├── skills/
        ├── commands/
        └── README.md
```

### 3.2 plugin.json 规范

```json
{
  "name": "my-plugin",           // 必须：kebab-case 格式
  "version": "1.0.0",            // 推荐：语义化版本
  "description": "Plugin 描述",   // 推荐：简短描述
  "author": {
    "name": "Author Name"
  },
  "license": "MIT",
  "keywords": ["keyword1", "keyword2"]
}
```

### 3.3 发布到集中仓库

```bash
# 1. 构建 Plugin
cd /path/to/my-project
python scripts/build_plugin.py

# 2. 复制到集中仓库
cp -r build/plugin /path/to/claude-code-plugins/plugins/my-plugin

# 3. 更新 Marketplace
# 编辑 claude-code-plugins/.claude-plugin/marketplace.json，添加新条目

# 4. 提交
cd /path/to/claude-code-plugins
git add .
git commit -m "feat: add my-plugin"
git push origin main
```

### 3.4 更新 Marketplace

在 `.claude-plugin/marketplace.json` 的 `plugins` 数组中添加：

```json
{
  "name": "my-plugin",
  "description": "My plugin description",
  "version": "1.0.0",
  "author": {
    "name": "Author Name"
  },
  "source": "./plugins/my-plugin",
  "category": "development"
}
```

---

## 4. Plugin Marketplace 管理

### 4.1 Marketplace 格式

Marketplace 配置文件位于 `.claude-plugin/marketplace.json`：

```json
{
  "name": "agent-lab",
  "owner": {
    "name": "Agent Lab",
    "email": "yanding.zhang@goland.cn"
  },
  "metadata": {
    "description": "Agent Lab Plugin Marketplace for team plugins",
    "version": "1.0.0",
    "pluginRoot": "../plugins"
  },
  "plugins": [
    {
      "name": "agentic-dev",
      "source": "../plugins/agentic-dev",
      "description": "Agent-driven project lifecycle methodology",
      "version": "1.0.0",
      "author": { "name": "agentic-dev Team" },
      "category": "methodology",
      "tags": ["methodology", "agile"]
    },
    {
      "name": "another-plugin",
      "source": "../plugins/another-plugin",
      "description": "Another plugin description",
      "version": "1.0.0",
      "author": { "name": "Author Name" },
      "category": "development"
    }
  ]
}
```

### 4.2 Category 分类

| Category | 说明 |
|----------|------|
| `methodology` | 方法论和流程 |
| `development` | 开发工具 |
| `productivity` | 效率工具 |
| `security` | 安全相关 |
| `learning` | 学习辅助 |
| `utilities` | 通用工具 |

### 4.3 部署 Marketplace

Marketplace 仓库需要部署到可访问的位置。添加方式：

```bash
# 1. Clone Marketplace 仓库
git clone http://10.10.2.124/agent/claude-code-plugins.git

# 2. 从本地路径添加（推荐）
/plugin marketplace add /path/to/claude-code-plugins
```

> **Note**: Claude Code `/plugin marketplace add` 支持的格式：
> - HTTPS URL: `https://github.com/owner/repo.git`
> - GitHub 简写: `owner/repo`
> - 本地路径: `./path/to/marketplace` 或 `/absolute/path`
>
> 由于内部 Git 服务使用 HTTP（非 HTTPS），建议先 clone 到本地再添加。

---

## 5. Plugin 组件开发

### 5.1 Skills

Skills 自动触发，基于用户意图识别。

**文件位置**: `skills/<skill-name>/SKILL.md`

```markdown
---
name: my-skill
description: >
  Skill 描述，用于触发匹配。
  Triggered by: "关键词1", "关键词2"
version: 1.0.0
---

# my-skill

详细说明...

## Trigger Keywords

- 关键词1
- 关键词2

## Workflow

1. 步骤一
2. 步骤二
```

### 5.2 Commands

Commands 显式调用，需要用户输入 `/plugin-name:command-name`。

**文件位置**: `commands/<command-name>.md`

```markdown
---
name: my-command
description: Command 描述
---

# /my-command

Command 说明...

## Usage

```
/plugin-name:my-command [args]
```

## Workflow

1. 步骤一
2. 步骤二
```

### 5.3 Agents

Agents 是专业化的子代理，用于复杂任务。

**文件位置**: `agents/<agent-name>.md`

```markdown
---
description: Agent 角色和专长
capabilities:
  - 能力1
  - 能力2
---

Agent 详细指令...
```

---

## 6. 发布检查清单

发布前检查：

- [ ] `.claude-plugin/plugin.json` 存在且有效
- [ ] `name` 字段使用 kebab-case
- [ ] `version` 遵循语义化版本
- [ ] 至少有一个组件 (skills/commands/agents)
- [ ] 组件文件格式正确 (YAML frontmatter + Markdown)
- [ ] README.md 包含安装和使用说明
- [ ] 本地测试通过 (`/plugin marketplace add ./local/path`)
- [ ] Marketplace 已更新

---

## 7. 目录结构参考

### 集中仓库结构（Marketplace）

```
claude-code-plugins/
├── .claude-plugin/
│   └── marketplace.json        # Marketplace 配置
├── plugins/
│   ├── agentic-dev/
│   │   ├── .claude-plugin/
│   │   │   └── plugin.json
│   │   ├── skills/
│   │   ├── commands/
│   │   ├── resources/
│   │   └── README.md
│   └── other-plugin/
│       └── ...
├── docs/                       # 开发文档
└── README.md
```

### 单个 Plugin 结构

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json             # 必须
├── skills/                     # 可选
│   └── skill-name/
│       └── SKILL.md
├── commands/                   # 可选
│   └── command-name.md
├── agents/                     # 可选
│   └── agent-name.md
├── hooks/                      # 可选
│   └── hooks.json
├── resources/                  # 可选
│   ├── templates/
│   └── prompts/
└── README.md                   # 推荐
```

---

## 相关文档

- [Plugin 安装指南](./plugin-install.md)
- [开发文档索引](../README.md) - Plugin 开发文档和示例
- [脚本示例](../examples/) - 构建脚本模板和快速创建脚本

## 参考资源

### 官方文档

- [Claude Code Plugin 官方文档](https://docs.claude.com/en/docs/claude-code/plugins)
- [Claude Code 概览](https://docs.claude.com/en/docs/claude-code/overview)

### 官方 Plugin 示例

- [claude-code/plugins](https://github.com/anthropics/claude-code/tree/main/plugins) - Anthropic 官方 Plugin 示例
- 推荐参考: `plugin-dev`, `commit-commands`, `feature-dev`

### 源仓库

- `agentic-dev` - 方法论源仓库
  - `scripts/build_plugin.py` - 完整的构建脚本参考实现
  - `schema/skills-manifest.yaml` - Skills 配置示例
  - `docs/design/plugin-architecture.md` - Plugin 架构设计文档
