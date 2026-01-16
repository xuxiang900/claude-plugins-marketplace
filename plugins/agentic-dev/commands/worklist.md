---
name: worklist
description: Create or update WORKLIST for an Issue
---

# /worklist

Create or update WORKLIST for an Issue

## Usage

```
/agentic-dev:worklist [issue-id]
```

## Workflow

1. Get Issue information (from GitLab or user input)
2. Read worklist-template.md
3. Generate WORKLIST file at docs/worklist/issue-{id}.md
4. Update TRACKING.md with Issue status