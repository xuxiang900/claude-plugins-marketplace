# Plugin 开发文档

本目录包含 Claude Code Plugin 开发相关的文档和示例。

## 文档索引

| 文档 | 说明 |
|------|------|
| [guides/plugin-install.md](guides/plugin-install.md) | Plugin 安装指南 |
| [guides/plugin-publish.md](guides/plugin-publish.md) | Plugin 发布与管理指南 |
| [examples/](examples/) | 脚本示例和模板 |

## 快速开始

### 创建新 Plugin

```bash
# 使用脚本快速创建
./docs/examples/create-plugin.sh my-plugin

# 或手动创建
mkdir -p my-plugin/.claude-plugin
echo '{"name":"my-plugin","version":"0.1.0"}' > my-plugin/.claude-plugin/plugin.json
```

### 发布到 Marketplace

```bash
# 复制 Plugin 到 plugins/ 目录
cp -r /path/to/my-plugin plugins/

# 更新 .claude-plugin/marketplace.json
# 添加新 plugin 条目

# 提交
git add . && git commit -m "feat: add my-plugin"
git push origin main
```

## 示例文件

| 文件 | 说明 |
|------|------|
| [examples/create-plugin.sh](examples/create-plugin.sh) | 快速创建 Plugin 骨架脚本 |
| [examples/build_plugin_template.py](examples/build_plugin_template.py) | Python 构建脚本模板 |

## 参考资源

### 官方文档

- [Claude Code Plugin 官方文档](https://docs.claude.com/en/docs/claude-code/plugins)
- [Claude Code 概览](https://docs.claude.com/en/docs/claude-code/overview)

### 官方 Plugin 示例

- [claude-code/plugins](https://github.com/anthropics/claude-code/tree/main/plugins) - Anthropic 官方 Plugin 示例

### 本仓库相关项目

| 项目 | 说明 |
|------|------|
| `agentic-dev` | 方法论源仓库，包含完整的构建脚本示例 |
| `agentic-dev/scripts/build_plugin.py` | 完整的构建脚本参考实现 |

## Plugin 结构规范

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json         # 必须：Plugin 元数据
├── skills/                  # 可选：自动触发的能力
│   └── skill-name/
│       └── SKILL.md
├── commands/                # 可选：显式调用的命令
│   └── command-name.md
├── agents/                  # 可选：专业 Agent
│   └── agent-name.md
├── hooks/                   # 可选：事件钩子
│   └── hooks.json
├── resources/               # 可选：内嵌资源
└── README.md                # 推荐：使用说明
```

## plugin.json 规范

```json
{
  "name": "my-plugin",           // 必须：kebab-case 格式
  "version": "1.0.0",            // 推荐：语义化版本
  "description": "Plugin 描述",   // 推荐：简短描述
  "author": {
    "name": "Author Name",
    "email": "author@example.com"
  },
  "license": "MIT",
  "keywords": ["keyword1", "keyword2"]
}
```

## 组件类型

| 类型 | 触发方式 | 文件位置 | 说明 |
|------|----------|----------|------|
| Skills | 自动（意图识别） | `skills/<name>/SKILL.md` | 基于用户意图自动触发 |
| Commands | 显式调用 | `commands/<name>.md` | 用户输入 `/plugin:command` |
| Agents | 任务分配 | `agents/<name>.md` | 专业化子代理 |
| Hooks | 事件触发 | `hooks/hooks.json` | 响应系统事件 |
