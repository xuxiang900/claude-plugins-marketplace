# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Product Manager Suite - a Claude Code plugin that provides product management tools including intelligent agents and specialized skills for the complete product lifecycle from research to delivery.

## Repository Structure

```
product-manager-suite/
├── .claude-plugin/
│   └── plugin.json              # Main plugin manifest
├── agents/                      # Agent definitions
│   └── pm-lead/AGENT.md        # Primary PM agent configuration
├── commands/                    # Slash commands (5 total)
│   ├── research-market.md
│   ├── write-prd.md
│   ├── analyze-competitor.md
│   ├── score-requirements.md
│   └── plan-sprint.md
└── skills/                      # Specialized skills (15 total)
    ├── competitor-research/
    ├── user-insight-miner/
    ├── data-analysis/
    ├── solution-architect/
    ├── prd-writer/
    ├── user-story-generator/
    ├── api-spec-writer/
    ├── prd-auditor/
    ├── bdd-spec-analyzer/
    ├── bdd-feature-writer/
    ├── rice-scorer/
    ├── user-journey-mapper/
    ├── roadmap-visualizer/
    ├── campaign-strategist/
    └── growth-web-architect/
```

## Development Commands

### Testing Plugin Installation
```bash
# List available plugins
/plugin list

# Reload plugin configuration
/plugin reload

# Install from local path (for testing)
/plugin install ./product-manager-suite
```

### Testing Commands
```bash
# Test market research
/research-market 电商 "社区团购"

# Test competitor analysis
/analyze-competitor https://example.com

# Test PRD generation
/write-prd "微信一键登录"

# Test requirement scoring
/score-requirements backlog.md

# Test sprint planning
/plan-sprint
```

### Testing Skills
```bash
# Test skills directly
/competitor-research "SaaS项目管理"
/user-insight-miner feedback.csv
/data-analysis data.csv
/prd-writer "需求描述"
/rice-scorer requirements.md
```

### Testing Agent
```bash
# Activate PM lead agent
/Act as pm-lead
```

## Architecture & Design Patterns

### Plugin System
- The plugin uses Claude Code's plugin architecture defined in `.claude-plugin/plugin.json`
- Commands are defined in `/commands/` as markdown files with YAML frontmatter
- Skills are defined in `/skills/[skill-name]/SKILL.md` with YAML frontmatter
- Agent is defined in `/agents/pm-lead/AGENT.md` with YAML frontmatter

### Skill Protocols
Each skill follows a consistent structure:
1. YAML frontmatter with `name`, `description`, `args`, and `tags`
2. Usage instructions in markdown
3. Execution workflow description
4. Example calls

### Agent Orchestration (pm-lead)
The pm-lead agent acts as orchestrator with three core modes:
- **Strategist Mode**: For ambiguous goals and business hypotheses
- **Executor Mode**: For confirmed requirements ready for implementation
- **Analyst Mode**: For data analysis and optimization feedback

The agent uses "skill chaining" - calling multiple skills in sequence to complete complex workflows:
- Intelligence flow: `competitor-research` → `user-insight-miner` → `data-analysis`
- Documentation flow: `solution-architect` → `prd-writer` → `prd-auditor`
- Delivery flow: `user-story-generator` → `bdd-spec-analyzer` → `bdd-feature-writer`

### Command Pattern
Commands are convenience shortcuts that:
1. Validate input parameters
2. Call appropriate skill(s)
3. Format and present results

For example, `/research-market` internally calls `competitor-research` with proper parameters.

## Key Configuration Files

### `.claude-plugin/plugin.json`
- Central manifest listing all agents, skills, and commands
- Version tracking and plugin metadata
- Paths to all components

### Agent Configuration
- Located in `agents/[agent-name]/AGENT.md`
- YAML frontmatter defines name, model, and allowed tools/skills
- Markdown content defines agent behavior and orchestration logic

### Skill Configuration
- Located in `skills/[skill-name]/SKILL.md`
- YAML frontmatter defines interface and capabilities
- Markdown content defines skill behavior and usage

## Adding New Components

### Adding a New Skill
1. Create directory: `skills/new-skill-name/`
2. Create `SKILL.md` with YAML frontmatter
3. Add skill logic in markdown content
4. Register in `.claude-plugin/plugin.json` skills array
5. Test with `/new-skill-name`

### Adding a New Command
1. Create file: `commands/command-name.md`
2. Add YAML frontmatter with name, description, args
3. Document usage and workflow
4. Register in `.claude-plugin/plugin.json` commands array
5. Test with `/command-name`

### Modifying the Agent
1. Edit `agents/pm-lead/AGENT.md`
2. Update YAML frontmatter for tools/skills access
3. Modify orchestration logic in markdown content
4. Test with `/Act as pm-lead`

## Important Notes

- All paths in plugin.json are relative to repository root
- Skills and commands are invoked by filename (without extension)
- Agent is invoked by name defined in AGENT.md YAML frontmatter
- Plugin uses semantic versioning (currently 1.0.2)
- Chinese language content is intentional for target user base
- The suite emphasizes workflow orchestration over individual tool usage
