---
name: feature-store
description: "Feast, Tecton, online/offline, point-in-time — Hermes-native patterns adapted from ECC for Claude Code"
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [hermes, feature,store]
    related_skills: [hcc-bundle]
---

# feature-store

Feast, Tecton, online/offline, point-in-time

## Prerequisites

- Hermes with relevant toolsets enabled (`terminal`, `file`, `code_execution`, `web`)
- Project-specific dependencies (see examples below)

## Core Patterns

This skill provides Hermes-native patterns for **feature-store**, adapted from the ECC (Everything Claude Code) ecosystem.

### Quick Reference

| Task | Command |
|------|---------|
| Get started | `hermes -s feature-store "your task"` |
| With TDD | `hermes -s tdd,feature-store "build feature with tests"` |
| Security review | `hermes -s security-review,feature-store "audit implementation"` |

### Common Patterns

```bash
# Example: Load skill and run task
hermes -s feature-store "Implement user authentication with JWT"

# Multi-skill: Combine with engineering practices
hermes -s feature-store,agentic-engineering,git-workflow "Build feature end-to-end"
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
