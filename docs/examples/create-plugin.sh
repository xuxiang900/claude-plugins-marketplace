#!/bin/bash
# create-plugin.sh - 快速创建 Plugin 骨架
#
# 用法:
#   ./create-plugin.sh <plugin-name>
#
# 示例:
#   ./create-plugin.sh my-awesome-plugin

set -e

PLUGIN_NAME=$1

if [ -z "$PLUGIN_NAME" ]; then
  echo "Usage: ./create-plugin.sh <plugin-name>"
  echo ""
  echo "Example:"
  echo "  ./create-plugin.sh my-awesome-plugin"
  exit 1
fi

# 验证名称格式 (kebab-case)
if [[ ! "$PLUGIN_NAME" =~ ^[a-z][a-z0-9]*(-[a-z0-9]+)*$ ]]; then
  echo "Error: Plugin name must be kebab-case (e.g., my-plugin, code-review)"
  exit 1
fi

echo "Creating plugin: $PLUGIN_NAME"
echo ""

# 创建目录结构
mkdir -p "$PLUGIN_NAME"/{.claude-plugin,skills,commands,agents}

# 创建 plugin.json
cat > "$PLUGIN_NAME/.claude-plugin/plugin.json" << EOF
{
  "name": "$PLUGIN_NAME",
  "version": "0.1.0",
  "description": "TODO: Add description",
  "author": {
    "name": "TODO: Author Name"
  },
  "license": "MIT"
}
EOF

# 创建示例 Skill
mkdir -p "$PLUGIN_NAME/skills/example-skill"
cat > "$PLUGIN_NAME/skills/example-skill/SKILL.md" << 'EOF'
---
name: example-skill
description: >
  Example skill description.
  Triggered by: "example", "demo"
version: 0.1.0
---

# example-skill

This is an example skill.

## Trigger Keywords

- example
- demo

## Workflow

1. Step one
2. Step two
EOF

# 创建示例 Command
cat > "$PLUGIN_NAME/commands/example.md" << 'EOF'
---
name: example
description: Example command
---

# /example

Example command description.

## Usage

```
/plugin-name:example [args]
```

## Workflow

1. Step one
2. Step two
EOF

# 创建 README
cat > "$PLUGIN_NAME/README.md" << EOF
# $PLUGIN_NAME

TODO: Plugin description

## Installation

\`\`\`bash
/plugin install $PLUGIN_NAME
\`\`\`

## Components

### Skills

- \`example-skill\` - Example skill

### Commands

- \`/example\` - Example command

## Development

\`\`\`bash
# Build (if using build script)
python scripts/build_plugin.py

# Test locally
/plugin install /path/to/$PLUGIN_NAME

# Publish to central repository
python scripts/build_plugin.py --publish
\`\`\`
EOF

# 创建 .gitignore
cat > "$PLUGIN_NAME/.gitignore" << 'EOF'
# Build artifacts
build/
*.pyc
__pycache__/
.DS_Store
EOF

echo "Created plugin skeleton at: $PLUGIN_NAME/"
echo ""
echo "Directory structure:"
find "$PLUGIN_NAME" -type f | sed 's/^/  /'
echo ""
echo "Next steps:"
echo "  1. cd $PLUGIN_NAME"
echo "  2. Edit .claude-plugin/plugin.json"
echo "  3. Add your skills, commands, or agents"
echo "  4. Test: /plugin install /path/to/$PLUGIN_NAME"
echo "  5. Publish to pm-plugin-marketplace"
