# 安装指南

## 方法 1: 从本地路径安装（测试用）

在Claude Code会话中运行：
```bash
/plugin install ./product-manager-suite
```

## 方法 2: 添加到团队配置（推荐）

在您的项目根目录创建 `.claude/settings.json`：

```bash
mkdir -p .claude
cat > .claude/settings.json << 'EOF'
{
  "plugins": {
    "product-manager-suite": {
      "path": "./product-manager-suite",
      "enabled": true
    }
  }
}
EOF
```

然后重启Claude Code或运行：
```bash
/plugin reload
```

## 方法 3: Git仓库方式（团队协作）

1. 将此插件推送到Git仓库
2. 团队成员安装：
```bash
/plugin install dvdfab/product-manager-suite
```

## 验证安装

安装后运行：
```bash
/plugin list
```

应该会看到 `product-manager-suite` 已启用。

## 快速测试

1. 启动PM助手：
```bash
/Act as pm-lead
```

2. 测试命令：
```bash
/research-market 电商 "社区团购"
```

## 卸载

如果需要卸载：
```bash
/plugin remove product-manager-suite
```
