---
name: rust-patterns
description: "Rust async, Axum, Tokio, error handling, traits — Hermes-native patterns adapted from ECC for Claude Code"
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [hermes, rust,patterns]
    related_skills: [hcc-bundle]
---

# rust-patterns

Rust async, Axum, Tokio, error handling, traits

## Prerequisites

- Hermes with relevant toolsets enabled (`terminal`, `file`, `code_execution`, `web`)
- Project-specific dependencies (see examples below)

## Core Patterns

This skill provides Hermes-native patterns for **rust-patterns**, adapted from the ECC (Everything Claude Code) ecosystem.

### Quick Reference

| Task | Command |
|------|---------|
| Get started | `hermes -s rust-patterns "your task"` |
| With TDD | `hermes -s tdd,rust-patterns "build feature with tests"` |
| Security review | `hermes -s security-review,rust-patterns "audit implementation"` |

### Common Patterns

```bash
# Example: Load skill and run task
hermes -s rust-patterns "Implement user authentication with JWT"

# Multi-skill: Combine with engineering practices
hermes -s rust-patterns,agentic-engineering,git-workflow "Build feature end-to-end"
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
