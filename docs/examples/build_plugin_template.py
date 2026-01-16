#!/usr/bin/env python3
"""
build_plugin_template.py - Plugin 构建脚本模板

这是一个简化的 Plugin 构建脚本模板，其他项目可以参考此模板创建自己的构建脚本。
完整示例参考: agentic-dev/scripts/build_plugin.py

用法:
    python scripts/build_plugin.py [--dry-run] [--output DIR] [--publish]

选项:
    --dry-run       仅显示将要执行的操作，不实际生成文件
    --output DIR    指定输出目录 (默认: build/plugin)
    --publish       构建后发布到集中 Plugin 仓库
"""

import os
import sys
import json
import argparse
import shutil
from pathlib import Path
from datetime import datetime

# 配置
PLUGIN_NAME = "my-plugin"           # 修改为你的 plugin 名称
PLUGIN_VERSION = "1.0.0"
PLUGIN_DESCRIPTION = "My plugin description"
AUTHOR_NAME = "Your Name"

# 项目根目录
PROJECT_ROOT = Path(__file__).parent.parent

# 集中仓库路径（与项目同级）
CENTRAL_REPO = PROJECT_ROOT.parent / "pm-plugin-marketplace"


def generate_plugin_json():
    """生成 plugin.json"""
    return {
        "name": PLUGIN_NAME,
        "version": PLUGIN_VERSION,
        "description": PLUGIN_DESCRIPTION,
        "author": {
            "name": AUTHOR_NAME
        },
        "license": "MIT"
    }


def build_plugin(output_dir: Path, dry_run: bool = False):
    """构建 Plugin"""
    print(f"Building {PLUGIN_NAME} Plugin v{PLUGIN_VERSION}")
    print(f"Output: {output_dir}")

    if dry_run:
        print("[DRY-RUN MODE]")
        return

    # 创建目录结构
    dirs = [
        output_dir / ".claude-plugin",
        output_dir / "skills",
        output_dir / "commands",
        output_dir / "agents",
    ]
    for d in dirs:
        d.mkdir(parents=True, exist_ok=True)

    # 生成 plugin.json
    plugin_json = generate_plugin_json()
    with open(output_dir / ".claude-plugin" / "plugin.json", "w") as f:
        json.dump(plugin_json, f, indent=2)
    print(f"Generated: .claude-plugin/plugin.json")

    # TODO: 在这里添加你的 Skills/Commands/Agents 生成逻辑
    # 示例:
    # - 复制 skills 文件
    # - 生成 commands
    # - 复制资源文件

    # 生成 README.md
    readme = f"""# {PLUGIN_NAME}

{PLUGIN_DESCRIPTION}

## Installation

```bash
/plugin install {PLUGIN_NAME}
```

## Version

{PLUGIN_VERSION}
"""
    with open(output_dir / "README.md", "w") as f:
        f.write(readme)
    print(f"Generated: README.md")

    print(f"\nBuild complete!")


def publish_plugin(source_dir: Path, dry_run: bool = False):
    """发布到集中仓库"""
    target_dir = CENTRAL_REPO / "plugins" / PLUGIN_NAME

    if not CENTRAL_REPO.exists():
        print(f"Error: Central repository not found: {CENTRAL_REPO}")
        return False

    print(f"\nPublishing to: {target_dir}")

    if dry_run:
        print("[DRY-RUN] Would copy plugin to central repository")
        return True

    # 删除旧版本
    if target_dir.exists():
        shutil.rmtree(target_dir)

    # 复制新版本
    shutil.copytree(source_dir, target_dir)
    print(f"Published successfully!")

    print(f"\nNext steps:")
    print(f"  cd {CENTRAL_REPO}")
    print(f"  # Update plugin-registry.json if this is a new plugin")
    print(f"  git add . && git commit -m 'chore: update {PLUGIN_NAME}'")
    print(f"  git push origin main")

    return True


def main():
    parser = argparse.ArgumentParser(description=f"构建 {PLUGIN_NAME} Plugin")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--output", default="build/plugin")
    parser.add_argument("--publish", action="store_true")
    args = parser.parse_args()

    output_dir = PROJECT_ROOT / args.output

    # 构建
    build_plugin(output_dir, args.dry_run)

    # 发布
    if args.publish:
        publish_plugin(output_dir, args.dry_run)


if __name__ == "__main__":
    main()
