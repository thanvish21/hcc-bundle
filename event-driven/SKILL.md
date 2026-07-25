---
name: event-driven
description: "Kafka, NATS, Redis Streams, outbox pattern — Hermes-native patterns adapted from ECC for Claude Code"
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [hermes, event,driven]
    related_skills: [hcc-bundle]
---

# event-driven

Kafka, NATS, Redis Streams, outbox pattern

## Prerequisites

- Hermes with relevant toolsets enabled (`terminal`, `file`, `code_execution`, `web`)
- Project-specific dependencies (see examples below)

## Core Patterns

This skill provides Hermes-native patterns for **event-driven**, adapted from the ECC (Everything Claude Code) ecosystem.

### Quick Reference

| Task | Command |
|------|---------|
| Get started | `hermes -s event-driven "your task"` |
| With TDD | `hermes -s tdd,event-driven "build feature with tests"` |
| Security review | `hermes -s security-review,event-driven "audit implementation"` |

### Common Patterns

```bash
# Example: Load skill and run task
hermes -s event-driven "Implement user authentication with JWT"

# Multi-skill: Combine with engineering practices
hermes -s event-driven,agentic-engineering,git-workflow "Build feature end-to-end"
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
