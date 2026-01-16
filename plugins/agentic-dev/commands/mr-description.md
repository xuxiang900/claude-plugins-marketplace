---
name: mr-description
description: Generate Merge Request description from changes
---

# /mr-description

Generate Merge Request description from changes

## Usage

```
/agentic-dev:mr-description
```

## Workflow

1. Analyze git diff and commit history
2. Extract change summary and test plan
3. Generate MR description with related Issue links
4. Output formatted MR description for review