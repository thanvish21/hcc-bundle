---
name: e2e-testing
description: "Playwright, Cypress, testcontainers, contract testing — Hermes-native patterns adapted from ECC for Claude Code"
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [hermes, e2e,testing]
    related_skills: [hcc-bundle]
---

# e2e-testing

Playwright, Cypress, testcontainers, contract testing

## Prerequisites

- Hermes with relevant toolsets enabled (`terminal`, `file`, `code_execution`, `web`)
- Project-specific dependencies (see examples below)

## Core Patterns

This skill provides Hermes-native patterns for **e2e-testing**, adapted from the ECC (Everything Claude Code) ecosystem.

### Quick Reference

| Task | Command |
|------|---------|
| Get started | `hermes -s e2e-testing "your task"` |
| With TDD | `hermes -s tdd,e2e-testing "build feature with tests"` |
| Security review | `hermes -s security-review,e2e-testing "audit implementation"` |

### Common Patterns

```bash
# Example: Load skill and run task
hermes -s e2e-testing "Implement user authentication with JWT"

# Multi-skill: Combine with engineering practices
hermes -s e2e-testing,agentic-engineering,git-workflow "Build feature end-to-end"
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
