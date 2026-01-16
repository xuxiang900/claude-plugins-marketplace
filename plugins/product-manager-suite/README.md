# Product Manager Suite

**v1.2.0** - The Ultimate Product Management and Growth Operations Toolkit for Claude Code

## 🎯 Overview

Product Manager Suite is a comprehensive collection of intelligent agents and specialized skills designed to transform the way Product Managers, Marketing Operations, and Growth teams work. From market research to strategic planning, from PRD writing to sprint planning, from campaign design to conversion optimization - this suite provides end-to-end support for the entire product and growth lifecycle.

## 📦 What's Included

### 🎭 Intelligent Agent (1)
- **pm-lead**: Senior Product Manager orchestrating the entire product lifecycle

### 🛠️ Specialized Skills (19 Skills)

#### 📊 Research & Intelligence (3 skills)
- **competitor-research**: Deep competitor analysis and market scanning
- **user-insight-miner**: Extract insights from unstructured feedback
- **data-analysis**: Analyze data and generate visualizations

#### 📝 Planning & Documentation (5 skills)
- **solution-architect**: Design product solutions before detailing
- **prd-writer**: Generate comprehensive PRD documents
- **user-story-generator**: Create Agile user stories from requirements
- **api-spec-writer**: Generate API specifications
- **roadmap-visualizer**: Create visual roadmaps

#### 🎨 Design & Optimization (5 skills)
- **growth-web-architect**: Design high-converting web pages and newsletters
- **form-designer**: Optimize forms for conversion rates **[NEW]**
- **search-experience-designer**: Design intelligent search experiences **[NEW]**
- **performance-optimizer**: Optimize Core Web Vitals and page performance **[NEW]**
- **user-journey-mapper**: Visualize user journeys and identify pain points

#### ✅ Quality & Verification (4 skills)
- **prd-auditor**: Audit PRDs for logic gaps and edge cases
- **bdd-spec-analyzer**: Analyze acceptance criteria
- **bdd-feature-writer**: Generate BDD feature files
- **ab-test-designer**: Design scientific A/B test plans **[NEW]**

#### 💡 Strategy & Growth (2 skills)
- **rice-scorer**: Score requirements using RICE framework
- **campaign-strategist**: Plan marketing campaigns and promotions

### 📚 Workflow Guides (3 NEW)
- **Website PM Workflow**: Complete guide for website product management
- **Desktop PM Workflow**: Complete guide for desktop application management
- **Marketing Operations Workflow**: Complete guide for marketing operations

### ⚡ Quick Commands (5)
- `/research-market` - Quick market research
- `/write-prd` - Generate PRD documents
- `/analyze-competitor` - Analyze competitors
- `/score-requirements` - RICE prioritization
- `/plan-sprint` - Agile sprint planning

## 🚀 Quick Start

### Installation

#### Method 1: From Git Repository (Recommended for Teams)
```bash
# Clone the plugin
# Option A: If you have a Git repo for this plugin
/plugin install dvdfab/product-manager-suite

# Option B: Install from local path for testing
/plugin install ./product-manager-suite
```

#### Method 2: Add to Team Configuration
Add to your project's `.claude/settings.json`:
```json
{
  "marketplaces": ["dvdfab/pm-plugin-marketplace"],
  "plugins": {
    "product-manager-suite": {
      "enabled": true,
      "version": "1.2.0"
    }
  }
}
```

#### Method 3: Repository-level Configuration
```bash
# Navigate to your project
cd your-project

# Create .claude directory if it doesn't exist
mkdir -p .claude

# Add the plugin to settings.json
cat > .claude/settings.json << 'EOF'
{
  "plugins": {
    "product-manager-suite": {
      "path": "/path/to/product-manager-suite",
      "enabled": true,
      "config": {
        "auto_activate": ["pm-lead"],
        "default_model": "sonnet"
      }
    }
  }
}
EOF
```

## 💡 Usage Guide

### Getting Started Based on Your Role

#### For Product Managers

**1. Research Phase**
```bash
# Analyze competitors
/analyze-competitor https://competitor-product.com

# Research market trends
/research-market 电商 "社区团购 即时零售"

# Analyze user feedback
# Upload feedback data and call user-insight-miner skill
```

**2. Planning Phase**
```bash
# Generate PRD
/write-prd "微信一键登录" "research/wechat-login.md"

# Create solution architecture
# Use solution-architect skill for complex features

# Audit the PRD
# prd-auditor will automatically check for logic gaps
```

**3. Prioritization**
```bash
# Score requirements
/score-requirements backlog/requirements.md
```

**4. Delivery**
```bash
# Plan sprint
/plan-sprint

# Generate API specs
# api-spec-writer will create API documentation

# Create BDD specs
# bdd-spec-analyzer -> bdd-feature-writer workflow
```

#### For Marketing Operations

**1. Campaign Planning**
```bash
# Design promotional campaign
/campaign-strategist "设计618大促活动，提升客单价30%，预算10万"
```

**2. Landing Page Design**
```bash
# Create high-converting landing page
/growth-web-architect "设计黑五促销落地页，6折优惠，卖SaaS年度套餐"

# Optimize forms
/form-designer "优化注册表单，当前转化率15%"
```

**3. Newsletter Design**
```bash
# Create promotional email
/growth-web-architect "设计圣诞节促销Newsletter，面向老用户，6折优惠"
```

**4. A/B Testing**
```bash
# Design A/B test for CTA button
/ab-test-designer "测试红色vs绿色CTA，当前点击8%，目标10%，日流量2000"
```

**5. Performance Analysis**
```bash
# Analyze campaign results
/data-analysis "活动投入10万，收入38万，转化率3.2%，分析ROI"
```

#### Direct Agent Usage

**Using pm-lead Agent**
```bash
# Start with pm-lead for strategic discussions
I'm Alex. I'm listening. What's on your mind?

Current task: strategic planning, requirement definition, or problem diagnosis?
Tell me your thoughts, or just throw me a mess.
```

The pm-lead agent will:
- Diagnose the situation (A. fuzzy idea, B. specific feature, C. complex initiative)
- Ask clarifying questions (As-Is, To-Be, Counterfactual)
- Orchestrate appropriate skills automatically

**Direct Skill Calls**
```bash
# Market research
/competitor-research "目标产品关键词"

# Data analysis
/data-analysis "path/to/data.csv"

# User insights
/user-insight-miner "user-feedback.csv"

# PRD generation
/prd-writer "功能需求描述"

# RICE scoring
/rice-scorer "需求列表文件.md"

# Form optimization
/form-designer "优化结账表单，当前弃购率70%"

# A/B test design
/ab-test-designer "测试搜索排序算法，基线转化率12%"

# Performance optimization
/performance-optimizer "优化商品详情页，LCP 3.5s"
```

## 📚 Workflow Guides (NEW)

### Website Product Management
See [website-pm-workflow.md](./website-pm-workflow.md) for:
- 6-stage workflow from research to delivery
- 19 skill application guides
- 6 typical scenarios (landing pages, website redesign, search optimization, etc.)
- Best practices for conversion optimization

### Desktop Application Product Management
See [desktop-pm-workflow.md](./desktop-pm-workflow.md) for:
- 6-stage workflow for desktop apps
- Cross-platform compatibility strategies
- Offline capability design
- System integration best practices

### Marketing Operations
See [marketing-ops-workflow.md](./marketing-ops-workflow.md) for:
- 5-stage workflow from campaign planning to optimization
- High-converting landing page design
- Newsletter design best practices
- A/B testing strategies
- ROI analysis and attribution

## 🔗 Typical Workflows

### 🔄 Workflow A: From Insight to Pitch
```
user-insight-miner → user-journey-mapper → competitor-research → rice-scorer
```

### 🔄 Workflow B: From Spec to Ship
```
prd-writer → api-spec-writer → user-story-generator → bdd-spec-analyzer
```

### 🔄 Workflow C: Agile Sprint
```
rice-scorer → roadmap-visualizer → user-story-generator
```

### 🔄 Workflow D: Write & Audit Loop
```
prd-writer → prd-auditor → prd-writer (iterate) → Delivery
```

### 🔄 Workflow E: Growth Experiment (NEW)
```
data-analysis → form-designer/growth-web-architect → ab-test-designer →
performance-optimizer → data-analysis (ROI quantification)
```

### 🔄 Workflow F: Conversion Optimization (NEW)
```
user-journey-mapper → form-designer → ab-test-designer →
data-analysis → prd-writer (post-mortem)
```

### 🔄 Workflow G: E-commerce Search Optimization (NEW)
```
data-analysis → search-experience-designer → ab-test-designer →
performance-optimizer → data-analysis
```

## 🎭 Role-Specific Workflows

### For Website Product Managers
```
competitor-research → growth-web-architect → form-designer →
ab-test-designer → performance-optimizer → prd-writer → user-story-generator
```

### For Desktop Application PMs
```
competitor-research → solution-architect → user-journey-mapper →
prd-writer → api-spec-writer
```

### For Marketing Operations
```
campaign-strategist → growth-web-architect → form-designer →
ab-test-designer → data-analysis → user-journey-mapper
```

## 🎛️ Configuration

### Plugin Configuration
Edit `.claude-plugin/plugin.json` to customize:
- Agent names and descriptions
- Included skills
- Command shortcuts

### Team Configuration
Create `.claude/settings.json` in your project:
```json
{
  "marketplaces": ["dvdfab/pm-plugin-marketplace"],
  "plugins": {
    "product-manager-suite": {
      "enabled": true,
      "version": "1.2.0",
      "config": {
        "auto_activate": ["pm-lead"],
        "default_model": "sonnet",
        "auto_update": true
      }
    }
  }
}
```

## 📚 Documentation

### Workflow Guides
Each workflow guide includes:
- Role-specific best practices
- Step-by-step skill applications
- Real-world scenarios and examples
- Key metrics and benchmarks
- Quick start templates

**Available Guides:**
- [Website PM Workflow](./website-pm-workflow.md) - Website product management
- [Desktop PM Workflow](./desktop-pm-workflow.md) - Desktop application management
- [Marketing Operations Workflow](./marketing-ops-workflow.md) - Marketing and growth

### Skill Documentation
Each skill (`skills/[skill-name]/SKILL.md`) includes:
- Detailed description and use cases
- Input parameters and examples
- Output format and templates
- Integration with other skills
- Best practices and tips

### Agent Documentation
The pm-lead agent (`agents/pm-lead/AGENT.md`) includes:
- Role definition and philosophy
- Three interaction modes (Strategist, Executor, Analyst)
- Skill orchestration protocols
- Communication style guide
- Tactical combinations

## 👥 For Teams

### Distribution to Team Members

1. **Setup Git Repository**
```bash
git add .
git commit -m "Release: Product Manager Suite v1.2.0"
git tag v1.2.0
git push origin main --tags
```

2. **Team Installation**
```bash
# Each team member runs:
/plugin install dvdfab/product-manager-suite
```

3. **Repository Integration**
Add to project's `.claude/settings.json` to auto-enable for everyone:
```json
{
  "plugins": {
    "product-manager-suite@dvdfab": {
      "enabled": true,
      "version": "^1.2.0"
    }
  }
}
```

### Best Practices
- Update the plugin regularly to get new features (`/plugin update`)
- Share custom workflows with the team
- Contribute improvements back to the main plugin
- Use version tags for stable releases

## 🔧 Development

### Plugin Structure
```
product-manager-suite/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest (v1.2.0)
├── agents/                  # Agent definitions
│   └── pm-lead/
│       └── AGENT.md         # Agent instructions
├── commands/                # Slash commands (5)
│   ├── research-market.md
│   ├── write-prd.md
│   └── ...
└── skills/                  # Skill definitions (19)
    ├── competitor-research/
    ├── form-designer/       # [NEW] Form optimization
    ├── ab-test-designer/    # [NEW] A/B testing
    ├── search-experience-designer/  # [NEW] Search UX
    ├── performance-optimizer/        # [NEW] Performance
    └── ...
```

### Adding New Skills
1. Create skill directory in `skills/`
2. Add `SKILL.md` with skill definition
3. Update `.claude-plugin/plugin.json` (version bump)
4. Update agent configuration if needed
5. Test with direct call and via agent
6. Update workflow guides

## 📊 Version History

### v1.2.0 (Current)
**Major Update: Expanded for Growth & Marketing Operations**
- ✅ Added 4 new skills:
  - `form-designer` - Form conversion optimization
  - `ab-test-designer` - Scientific A/B testing
  - `search-experience-designer` - Search UX optimization
  - `performance-optimizer` - Core Web Vitals optimization
- ✅ Added 3 workflow guides:
  - Website PM workflow (6 stages, 6 scenarios)
  - Desktop PM workflow (6 stages, 6 scenarios)
  - Marketing Operations workflow (5 stages, 6 scenarios)
- ✅ Enhanced agent orchestration with new tactical combinations
- ✅ Added role-specific quick start guides

### v1.1.0
- Added form optimization capabilities
- Enhanced data analysis workflows

### v1.0.0
- Initial release with 13 core skills
- Basic product management workflows

## 🆘 Troubleshooting

### Plugin Not Loading
- Check Claude Code version (minimum 1.0.33)
- Verify plugin.json syntax (JSON valid)
- Check file permissions (755 for directories, 644 for files)
- Ensure all skill paths exist

### Skills Not Working
- Verify skill files have correct YAML frontmatter
- Check skill names in plugin.json match directory names
- Review skill documentation for prerequisites
- Test with simple input first

### Agent Not Responding
- Check agent.json configuration
- Verify AGENT.md format and tool permissions
- Check model settings (sonnet recommended)
- Review agent logs for errors

### Version Mismatch
- Run `/plugin reload` to refresh
- Check `.claude-plugin/plugin.json` version
- Verify cached files are updated

## 📞 Support

For issues and questions:
- Check this README and version history
- Review workflow guides for your role
- Review skill documentation in `skills/[skill-name]/`
- Review agent documentation in `agents/pm-lead/AGENT.md`
- Check version compatibility

## 📄 License

This plugin is designed for internal team use. Customize the license as needed for your organization.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make changes (update skills, workflows, documentation)
4. Test thoroughly (unit tests + integration tests)
5. Update version in plugin.json
6. Submit a pull request with detailed description
7. Include tests and documentation updates

## 🎯 Roadmap

### Planned for v1.3.0
- **Mobile PM Workflow**: iOS/Android app management
- **API Product Manager**: API design and developer experience
- **Data Product Manager**: Analytics and ML product management
- **Enterprise Sales Enablement**: B2B sales tools and workflows

### Long-term Vision
- Industry-specific templates (SaaS, E-commerce, Fintech, Healthcare)
- Integration with popular tools (Jira, Notion, Linear, Figma)
- Multi-language support
- Community-contributed skills

---

**Happy Product Managing!** 🎉

*Built with ❤️ for product teams who want to move faster and smarter.*
