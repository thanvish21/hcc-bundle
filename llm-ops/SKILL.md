---
name: llm-ops
description: "Prompt engineering, eval, RAG, fine-tuning, guardrails — Hermes-native patterns adapted from ECC for Claude Code"
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [hermes, llm,ops]
    related_skills: [hcc-bundle]
---

# llm-ops

Prompt engineering, eval, RAG, fine-tuning, guardrails

## Prerequisites

- Hermes with relevant toolsets enabled (`terminal`, `file`, `code_execution`, `web`)
- Project-specific dependencies (see examples below)

## Core Patterns

This skill provides Hermes-native patterns for **llm-ops**, adapted from the ECC (Everything Claude Code) ecosystem.

### Quick Reference

| Task | Command |
|------|---------|
| Get started | `hermes -s llm-ops "your task"` |
| With TDD | `hermes -s tdd,llm-ops "build feature with tests"` |
| Security review | `hermes -s security-review,llm-ops "audit implementation"` |

### Common Patterns

```bash
# Example: Load skill and run task
hermes -s llm-ops "Implement user authentication with JWT"

# Multi-skill: Combine with engineering practices
hermes -s llm-ops,agentic-engineering,git-workflow "Build feature end-to-end"
```

## Skill Composition

Works well with other HCC skills:
- `agentic-engineering` — for autonomous development loops
- `git-workflow` — for branching/commit conventions
- `security-review` — for security audit
- `deployment-patterns` — for production deployment
- `testing-`* — for test-driven development

## Adapted from ECC

Originally from `affaan-m/ecc` skills. Rebuilt for Hermes Agent:
- No CLAUDE.md references
- Uses Hermes toolsets (`terminal`, `file`, `delegation`, `code_execution`)
- Passes Hermes security scanner
- Composable with HCC bundle

---

*Part of HCC Bundle — 89+ skills for Hermes Agent*
