---
name: hcc-bundle
description: "HCC (Hermes Core Capabilities) - One-click installer for 40+ core Hermes skills adapted from ECC. Includes agentic-engineering, security-review, deployment-patterns, docker-patterns, git-workflow, search-first, safety-guard, context-budget, token-budget-advisor, prompt-optimizer, and more. Built for Hermes Agent, not Claude Code."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [hermes, bundle, ecc, agentic-engineering, security, deployment, docker, git, research, productivity]
    homepage: https://github.com/NousResearch/hermes-agent
    related_skills: [hermes-agent, hermes-agent-skill-authoring]
---

# HCC Bundle 2026-07-26

One-click installer for **40+ hand-picked core Hermes skills** adapted from the ECC (Everything Claude Code) ecosystem, rebuilt specifically for Hermes Agent's architecture, toolsets, and security model.

## What's Included

### Agent Design & Engineering (8 skills)
- `agentic-engineering` — Core agentic software engineering patterns for Hermes
- `ai-first-engineering` — AI-first development workflows with Hermes tooling
- `autonomous-loops` — Self-improving agent loops with Hermes delegation
- `continuous-agent-loop` — Continuous integration loops for Hermes agents
- `agent-eval` — Evaluation harnesses for Hermes agent performance
- `agent-architecture-audit` — Architecture review for multi-agent Hermes systems
- `agent-harness-construction` — Building test harnesses for Hermes agents
- `autonomous-agent-harness` — Full autonomous agent testing framework

### Engineering Practices (8 skills)
- `deployment-patterns` — Hermes-native deployment patterns (systemd, docker, k8s)
- `docker-patterns` — Docker best practices for Hermes projects
- `git-workflow` — Git workflows optimized for Hermes worktree mode
- `architecture-decision-records` — ADR templates for Hermes projects
- `codebase-onboarding` — Rapid codebase understanding with Hermes skills
- `deep-research` — Research methodology using Hermes research skill
- `cost-aware-llm-pipeline` — Cost optimization for Hermes LLM calls
- `docker-patterns` — Container patterns for Hermes deployments

### Security & Safety (6 skills)
- `search-first` — Search-first security methodology for Hermes
- `safety-guard` — Safety guardrails for Hermes tool execution
- `security-review` — Security code review patterns for Hermes
- `security-scan` — Automated security scanning in Hermes workflows
- `security-bounty-hunter` — Bug bounty hunting with Hermes agents
- `hipaa-compliance` — HIPAA compliance patterns for Hermes

### Tool Enhancement (6 skills)
- `context-budget` — Context budget management for Hermes sessions
- `token-budget-advisor` — Token optimization advisor for Hermes models
- `prompt-optimizer` — Prompt optimization for Hermes providers
- `rules-distill` — Rule distillation for Hermes skill creation
- `product-lens` — Product-focused development lens for Hermes
- `blueprint` — Blueprint-driven development for Hermes

### Research & Analysis (5 skills)
- `iterative-retrieval` — Iterative retrieval for deep research
- `research-ops` — Research operations workflow for Hermes
- `benchmark-methodology` — Benchmarking methodology for Hermes
- `benchmark-optimization-loop` — Optimization loops for Hermes benchmarks
- `eval-harness` — Evaluation harnesses for Hermes models

### Code Quality & Patterns (7 skills)
- `coding-standards` — Coding standards enforcement in Hermes
- `codehealth-mcp` — Code health monitoring via MCP
- `error-handling` — Error handling patterns for Hermes tools
- `verification-loop` — Verification loops for Hermes agents
- `backend-patterns` — Backend architecture patterns
- `api-design` — API design patterns for Hermes services
- `database-migrations` — Database migration patterns

---

## Installation

```bash
# One-shot install (all 40 skills)
hermes skills install /home/thanvish/.hermes/skills/hcc-bundle

# Or install from the skill directory directly
hermes skills install hcc-bundle
```

## Individual Skill Installation

Each skill can also be installed individually from the bundle:

```bash
hermes skills install hcc-bundle/agentic-engineering
hermes skills install hcc-bundle/security-review
# ... etc
```

## Post-Install

After installation, enable skills for your platform:

```bash
hermes skills config  # Interactive enable/disable per platform
```

Or load explicitly in a session:
```bash
hermes -s agentic-engineering,security-review,deployment-patterns
```

## Design Principles

1. **Hermes-Native** — No CLAUDE.md references, no git config --global, no npm/pip install commands
2. **Toolset-Aware** — Skills reference Hermes toolsets (web, terminal, file, code_execution, delegation, etc.)
3. **Security-First** — Passes Hermes skills-guard scanner (no persistence, no privilege escalation, no supply chain risks)
4. **Composable** — Each skill is independently installable and usable
5. **Bundled** — Single install gets the full ecosystem

## Categories Mapping (ECC → HCC)

| ECC Category | HCC Skills |
|--------------|------------|
| Tool Enhancement (6) | context-budget, token-budget-advisor, prompt-optimizer, rules-distill, product-lens, blueprint |
| Agent Design (5) | agentic-engineering, agent-eval, ai-first-engineering, autonomous-loops, continuous-agent-loop |
| Engineering Practices (7) | deployment-patterns, codebase-onboarding, architecture-decision-records, deep-research, cost-aware-llm-pipeline, docker-patterns, git-workflow |
| Security (5) | search-first, safety-guard, security-review, security-scan, security-bounty-hunter |

## Verification

```bash
# Verify all skills installed
hermes skills list | grep hcc-

# Check security scan status
hermes skills check

# Test a skill
/skill agentic-engineering
```

---

*Built for Hermes Agent by adapting the ECC ecosystem. Original ECC by affaan-m.*