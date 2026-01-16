# Getting Started with PM Plugin Marketplace

Complete guide for users and developers to start using and contributing to this plugin marketplace.

## 🚀 Quick Start for Users

### Prerequisites

- Claude Code CLI installed (v1.0.33 or higher)
- Git installed (for local installation)

### Installation Methods

#### Method 1: Direct from GitHub (Recommended)

```bash
# Add the marketplace (one-time setup)
/plugin marketplace add https://github.com/dvdfab/pm-plugin-marketplace

# Install individual plugins
/plugin install product-manager-suite
/plugin install agentic-dev
/plugin install dch
```

#### Method 2: From Local Clone

```bash
# Clone the repository
git clone https://github.com/dvdfab/pm-plugin-marketplace.git

# Add as local marketplace
/plugin marketplace add /path/to/pm-plugin-marketplace

# Install plugins
/plugin install product-manager-suite
/plugin install agentic-dev
/plugin install dch
```

#### Method 3: Add to Team Configuration

Create `.claude/settings.json` in your project:

```json
{
  "marketplaces": ["dvdfab/claudeaude-plsugins-marketplace"],
  "plugins": {
    "product-manager-suite": {
      "enabled": true,
      "version": "^1.2.0"
    },
    "agentic-dev": {
      "enabled": true,
      "version": "^1.0.5"
    },
    "dch": {
      "enabled": true,
      "version": "^1.0.6"
    }
  }
}
```

### Verifying Installation

```bash
# List installed plugins
/plugin list

# Check plugin details
/plugin help product-manager-suite
/plugin help agentic-dev
/plugin help dch

# Test a plugin command
/research-market "AI assistants" "team productivity"
/write-prd "User authentication feature"
```

## 🎯 By Role: Getting Started

### For Product Managers

```bash
# Install the product management suite
/plugin install product-manager-suite

# Try these workflows:

# 1. Market Research
/research-market SaaS "AI-powered features"

# 2. Competitor Analysis
/analyze-competitor https://competitor-product.com

# 3. Write PRD
/write-prd "Feature: In-app messaging system"

# 4. Prioritize Requirements
/score-requirements backlog.md

# 5. Sprint Planning
/plan-sprint
```

#### Core Skills to Explore:
- `/competitor-research` - Deep competitor analysis
- `/user-insight-miner` - Extract insights from feedback
- `/growth-web-architect` - Design high-converting pages
- `/ab-test-designer` - Design A/B tests
- `/form-designer` - Optimize forms for conversion

### For Developers

```bash
# Install development tools
/plugin install agentic-dev
/plugin install dch

# Try agentic-dev workflows:

# 1. Requirements Analysis (just describe what you need)
"I need to add authentication to our API"

# 2. Architecture Design
"Design the system architecture for this feature"

# 3. Task Splitting
"Break down this feature into GitHub issues"

# 4. Development Execution
"Implement the user registration endpoint"

# Try DCH for context management:

# 1. Search Documentation
"Search for API authentication patterns in our docs"

# 2. GitLab Operations
"Show me recent MRs in dch-tools repository"

# 3. Export Documents
"Export this Feishu doc to markdown"
```

### For Marketing Operations

```bash
# Install growth and marketing tools
/plugin install product-manager-suite

# Try these workflows:

# 1. Campaign Strategy
/campaign-strategist "Design holiday promotion to increase AOV by 30%, budget $50K"

# 2. Landing Page Design
/growth-web-architect "Create Black Friday landing page for SaaS annual plan, 40% off"

# 3. Form Optimization
/form-designer "Optimize checkout form, current abandonment 65%"

# 4. Newsletter Design
/growth-web-architect "Design Christmas newsletter for existing users, 6-month discount"

# 5. A/B Testing
/ab-test-designer "Test email subject lines, baseline 18% open rate, goal 25%"

# 6. Performance Analysis
/data-analysis "Campaign results: $50K spend, $180K revenue, 3.6% conversion"
```

## 🔧 Development Quick Start

### Setting Up Development Environment

```bash
# Clone the marketplace repository
git clone https://github.com/dvdfab/pm-plugin-marketplace.git
cd pm-plugin-marketplace

# Install Claude Code if not already installed
# (Follow instructions from https://claude.ai/code)
```

### Creating a New Plugin

Use the provided script:

```bash
# From the marketplace root
./docs/examples/create-plugin.sh my-awesome-plugin
```

Or manually create the structure:

```bash
mkdir -p my-plugin/.claude-plugin
mkdir -p my-plugin/skills
mkdir -p my-plugin/commands

# Create basic plugin.json
cat > my-plugin/.claude-plugin/plugin.json << 'EOF'
{
  "name": "my-plugin",
  "version": "0.1.0",
  "description": "My awesome plugin description",
  "author": {
    "name": "Your Name",
    "email": "your@email.com"
  },
  "license": "MIT"
}
EOF

# Create README
cat > my-plugin/README.md << 'EOF'
# My Plugin

Description of what this plugin does.

## Installation

/plugin install my-plugin

## Usage

Describe how to use the plugin...
EOF
```

### Adding Your First Skill

```bash
mkdir -p my-plugin/skills/hello-world

cat > my-plugin/skills/hello-world/SKILL.md << 'EOF'
---
name: hello-world
description: >
  A simple greeting skill that responds to hello messages.
  Triggered by: "hello", "hi", "greeting"
version: 0.1.0
---

# Hello World Skill

This skill provides friendly greetings.

## Trigger Keywords

- hello
- hi
- greeting
- hey there

## Workflow

1. User says hello or similar greeting
2. Skill responds with a friendly message
3. Offers assistance for available commands

## Example

```
User: Hello
Skill: Hello! I'm Claude with my-plugin enabled. How can I help you today?
```
EOF
```

### Adding Your First Command

```bash
cat > my-plugin/commands/hello.md << 'EOF'
---
name: hello
type: command
description: Display a greeting message
usage: |
  /hello [name]

  Arguments:
    name - Optional name to include in greeting
---

# /hello Command

Display a friendly greeting message.

## Usage

```bash
# Basic greeting
/hello

# Personalized greeting
/hello Alice
```

## Workflow

1. Command receives optional name parameter
2. Generates appropriate greeting message
3. Displays greeting to user
EOF
```

### Testing Your Plugin

```bash
# Install locally for testing
/plugin install ./my-plugin

# Test the skill
"Hello there!"  # Should trigger hello-world skill

# Test the command
/hello
/hello Alice

# Check plugin is loaded
/plugin list
/plugin help my-plugin
```

### Publishing to Marketplace

```bash
# 1. Copy plugin to plugins directory
cp -r my-plugin plugins/

# 2. Update marketplace.json
# Add entry to .claude-plugin/marketplace.json

# 3. Update main README.md
# Add plugin to available plugins table

# 4. Test marketplace installation
/plugin marketplace add /path/to/pm-plugin-marketplace
/plugin install my-plugin

# 5. Commit and push
git add plugins/my-plugin .claude-plugin/marketplace.json README.md

git commit -m "feat: add my-plugin v0.1.0"
git push origin main
```

## 📚 Plugin Development Best Practices

### 1. Skill Design

- **Clear triggers**: Use descriptive keywords that users naturally say
- **Single responsibility**: Each skill should do one thing well
- **Error handling**: Provide helpful messages when inputs are invalid
- **Documentation**: Include examples in skill documentation

### 2. Command Design

- **Consistent naming**: Use kebab-case for command names
- **Helpful usage**: Show usage examples in command help
- **Parameter validation**: Validate and document all parameters
- **Idempotency**: Commands should be safe to run multiple times

### 3. Agent Design

- **Clear persona**: Define the agent's role and expertise
- **Orchestration**: Use appropriate skills for tasks
- **Communication**: Be clear about capabilities and limitations

### 4. Documentation

- **README**: Include clear installation and usage instructions
- **Examples**: Provide real-world usage examples
- **Troubleshooting**: Include common issues and solutions

### 5. Testing

- **Local testing**: Test thoroughly before publishing
- **Integration testing**: Test with other plugins if applicable
- **Version testing**: Test upgrades from previous versions

## 🔍 Troubleshooting

### Plugin Not Loading

```bash
# Check plugin.json syntax
python3 -m json.tool plugin.json

# Reload plugins
/plugin reload

# Check Claude Code logs
# (See ~/.claude/logs/ for detailed logs)
```

### Commands Not Working

```bash
# Verify command file format
# Should have YAML frontmatter + Markdown content

# Check command name matches file name
# Command: /hello should be in commands/hello.md

# Verify plugin is installed
/plugin list
```

### Skills Not Triggering

```bash
# Check skill triggers are clear and specific
# Review skill documentation for trigger keywords

# Test with exact trigger phrases
# Check for conflicts with other plugins
```

## 📞 Getting Help

### For Users

- Check plugin-specific README files in `plugins/[plugin-name]/`
- Review usage examples in each plugin's documentation
- Try `/plugin help [plugin-name]` for plugin-specific help

### For Developers

- Review existing plugin implementations in `plugins/`
- Check the [plugin development guide](./docs/guides/plugin-publish.md)
- Look at [plugin examples](./docs/examples/)
- Refer to [official Claude Code plugin docs](https://docs.claude.com/en/docs/claude-code/plugins)

### Issues and Support

- **Plugin bugs**: Open issue in plugin's source repository
- **Marketplace issues**: Open issue in this repository
- **Claude Code issues**: Contact Anthropic support

## 🎉 Next Steps

- Start using the plugins that match your workflow
- Explore each plugin's capabilities
- Consider contributing your own plugins
- Share feedback and suggestions

Happy coding with Claude Code plugins!
