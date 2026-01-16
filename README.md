# Claude Code Plugins Marketplace

A curated collection of Claude Code plugins for enhancing productivity and enabling specialized workflows. This marketplace provides easy access to tested and documented plugins for various use cases including product management, development methodologies, and context management.

## 🚀 Quick Start

### Install from Git Repository (Recommended)

```bash
# 1. Add Marketplace (one-time setup)
/plugin marketplace add https://github.com/dvdfab/pm-plugin-marketplace

# 2. Install plugins
/plugin install product-manager-suite
/plugin install agentic-dev
/plugin install dch
```

### Install from Local Path

```bash
# 1. Clone the repository
git clone https://github.com/dvdfab/pm-plugin-marketplace.git

# 2. Add local marketplace
/plugin marketplace add /path/to/pm-plugin-marketplace

# 3. Install plugins
/plugin install product-manager-suite
/plugin install agentic-dev
/plugin install dch
```

## 📦 Available Plugins

| Plugin | Version | Description | Target Users |
|--------|---------|-------------|--------------|
| [product-manager-suite](./plugins/product-manager-suite/) | 1.2.0 | Comprehensive product management toolkit with 19 skills including PRD writing, competitor research, A/B testing, and growth optimization | Product Managers, Marketing Ops, Growth Teams |
| [agentic-dev](./plugins/agentic-dev/) | 1.0.5 | Agent-driven project lifecycle methodology supporting requirements analysis, architecture design, and development execution | Engineering Teams, Project Managers |
| [dch](./plugins/dch/) | 1.0.6 | Dev Context Hub for document search, GitLab integration, and Feishu document management | Developers, DevOps |

### Plugin Details

#### Product Manager Suite
- **19 Specialized Skills**: Competitor research, user insights, PRD writing, A/B testing, form optimization, performance optimization, and more
- **1 Intelligent Agent**: `pm-lead` orchestrates complete product lifecycle
- **5 Quick Commands**: `/research-market`, `/write-prd`, `/analyze-competitor`, `/score-requirements`, `/plan-sprint`
- **3 Workflow Guides**: Website PM, Desktop PM, and Marketing Operations workflows

#### Agentic Dev
- **8 Skills**: Requirements analysis, architecture design, task splitting, development execution, weekly reports, and NotebookLM optimization
- **3 Commands**: Worklist creation, tracking updates, and MR descriptions
- **3-Phase Model**: Requirements → Design → Development execution
- **Template Library**: Standardized templates for issues, worklists, and tracking

#### DCH (Dev Context Hub)
- **6 Skills**: Context management, document search, GitLab operations, Feishu integration, and indexing
- **3 Commands**: Git commit formatting, change summaries, and index management
- **CLI Integration**: Native integration with dch CLI tool

## 📖 Plugin Categories

### 🎯 Product Management
- `product-manager-suite` - End-to-end product management

### 💻 Development & Engineering
- `agentic-dev` - AI-driven development methodology
- `dch` - Development context and documentation management

### 📊 Analytics & Optimization
- Built into `product-manager-suite`: A/B testing, performance optimization, data analysis

## 🔧 Plugin Management Commands

```bash
# List installed plugins
/plugin list

# List available plugins in marketplace
/plugin marketplace list

# Install a plugin
/plugin install <plugin-name>

# Update a plugin
/plugin update <plugin-name>

# Remove a plugin
/plugin remove <plugin-name>

# Reload plugin configuration
/plugin reload

# Get plugin help
/plugin help <plugin-name>
```

## 📁 Repository Structure

```
pm-plugin-marketplace/
├── .claude-plugin/
│   └── marketplace.json    # Marketplace metadata and plugin index
├── plugins/                # Plugin directories
│   ├── product-manager-suite/
│   │   ├── .claude-plugin/plugin.json
│   │   ├── agents/
│   │   ├── commands/
│   │   └── skills/
│   ├── agentic-dev/
│   └── dch/
├── docs/                   # Documentation
│   ├── README.md
│   ├── guides/
│   └── examples/
└── README.md              # This file
```

## 🛠️ For Plugin Developers

### Creating a New Plugin

See [docs/guides/plugin-publish.md](./docs/guides/plugin-publish.md) for detailed instructions.

Quick start:
```bash
# 1. Create plugin structure
mkdir -p my-plugin/.claude-plugin
mkdir -p my-plugin/skills
mkdir -p my-plugin/commands

# 2. Create plugin manifest
cat > my-plugin/.claude-plugin/plugin.json << 'EOF'
{
  "name": "my-plugin",
  "version": "0.1.0",
  "description": "My plugin description"
}
EOF

# 3. Add skills and commands
# See existing plugins for examples

# 4. Test locally
/plugin install ./my-plugin

# 5. Add to marketplace
# - Copy to plugins/ directory
# - Update marketplace.json
# - Submit PR
```

### Plugin Requirements

Each plugin must:
1. Have a valid `plugin.json` manifest
2. Include a `README.md` with usage instructions
3. Follow the standard directory structure
4. Be tested with Claude Code
5. Include examples in documentation

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [Plugin Installation Guide](./docs/guides/plugin-install.md) | Detailed installation instructions |
| [Plugin Publishing Guide](./docs/guides/plugin-publish.md) | How to create and publish plugins |
| [Plugin Examples](./docs/examples/) | Sample code and templates |
| [API Reference](https://docs.claude.com/en/docs/claude-code/plugins) | Official Claude Code plugin API |

## 🆘 Troubleshooting

### Plugin Installation Issues
- Verify Claude Code version (requires v1.0.33+)
- Check plugin.json syntax is valid JSON
- Ensure all file paths are correct
- Check file permissions (755 for directories, 644 for files)

### Plugin Not Loading
- Run `/plugin reload` to refresh
- Check plugin dependencies are installed
- Review Claude Code logs for errors

### Marketplace Access Issues
- For private repositories, ensure authentication is configured
- Verify HTTPS URL is accessible
- Try local path installation as alternative

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-plugin`
3. Add your plugin to the `plugins/` directory
4. Update `marketplace.json` with plugin metadata
5. Update this README with plugin information
6. Submit a pull request with detailed description

### Contribution Guidelines
- All plugins must be tested with Claude Code
- Include comprehensive documentation
- Follow existing code style and structure
- Update version numbers appropriately
- Add examples and usage instructions

## 📋 Plugin Submission Checklist

Before submitting a new plugin, ensure:
- [ ] Plugin has unique name
- [ ] Version follows semantic versioning
- [ ] All skills/commands have descriptions
- [ ] README includes usage examples
- [ ] Tested with Claude Code
- [ ] Added to marketplace.json
- [ ] Updated main README.md
- [ ] Follows plugin best practices

## 📄 License

This marketplace collection is provided as-is. Individual plugins may have their own licenses - see each plugin's README for details.

## 🔗 External Resources

- [Claude Code Official Documentation](https://docs.claude.com/en/docs/claude-code/overview)
- [Claude Code Plugin System](https://docs.claude.com/en/docs/claude-code/plugins)
- [Anthropic Plugin Examples](https://github.com/anthropics/claude-code/tree/main/plugins)

## 💬 Support

For issues specific to:
- **Marketplace**: Open issue in this repository
- **Individual plugins**: Check plugin's README for support information
- **Claude Code**: Contact Anthropic support or check [docs.claude.com](https://docs.claude.com)

