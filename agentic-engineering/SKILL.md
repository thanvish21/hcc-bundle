---
name: agentic-engineering
description: "Core agentic software engineering patterns for Hermes Agent — autonomous development, multi-agent coordination, test-driven loops, and self-improving workflows."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [agentic, engineering, autonomous, multi-agent, tdd, self-improving]
    related_skills: [autonomous-loops, continuous-agent-loop, agent-eval, ai-first-engineering, git-workflow, deployment-patterns]
---

# Agentic Engineering for Hermes

Core patterns for autonomous software engineering with Hermes Agent.

## Philosophy

Agentic engineering means the agent **drives** the development loop:
1. **Understand** → Read code, specs, requirements
2. **Plan** → Break into tasks, create tickets
3. **Execute** → Write code, run tests, iterate
4. **Verify** → Test, lint, security scan, review
5. **Learn** → Save patterns as skills, update memory

## Core Loops

### 1. TDD Loop (Red-Green-Refactor)

```markdown
/hermes
> Goal: Implement user authentication with JWT

## Phase 1: Red - Write failing test
Write test for JWT token generation with expiry

## Phase 2: Green - Make it pass
Implement minimal JWT service

## Phase 3: Refactor - Improve design
Extract token config, add refresh logic, add tests

## Phase 4: Verify
Run full test suite, lint, security scan
```

### 2. Autonomous Feature Loop

```
delegate_task(
    goal="Build complete user authentication feature",
    context="
    Requirements:
    - User registration with email/password
    - JWT access + refresh tokens
    - Password reset flow
    - Rate limiting on auth endpoints
    - Tests: unit + integration
    
    Stack: FastAPI, PostgreSQL, Redis
    Existing: User model, database config
    "
)
```

### 3. Self-Improvement Loop

```python
# After each task completion:
1. Save successful patterns as skills
2. Update project CLAUDE.md / .hermes.md
3. Record lessons in memory
4. Add test cases for regressions
```

## Multi-Agent Coordination

### Role Definitions

| Agent | Responsibility | Tools |
|-------|---------------|-------|
| **Architect** | Design, ADRs, API contracts | file, web, code_execution |
| **Backend** | API, DB, business logic | terminal, file, code_execution |
| **Frontend** | UI, state, integration | terminal, file, browser |
| **QA** | Tests, security, performance | terminal, code_execution, web |
| **DevOps** | CI/CD, infra, monitoring | terminal, file, cronjob |

### Coordination Protocol

```markdown
# Shared context file: .hermes/coordination.md

## Active Tasks
- [ ] Architect: Design auth API (in progress)
- [ ] Backend: Implement user model (blocked)
- [ ] Frontend: Design login UI (waiting)

## Decisions
- JWT over sessions (stateless)
- PostgreSQL for users, Redis for tokens
- bcrypt for password hashing

## Blockers
- Need DB migration reviewed
```

### Handoff Pattern

```python
# Agent A completes task, creates handoff
handoff = {
    "completed": "User model + migration",
    "files_changed": ["models/user.py", "migrations/001_user.py"],
    "tests": "tests/test_user_model.py (12 passing)",
    "next_steps": [
        "Implement JWT service",
        "Add auth middleware",
        "Create login endpoint"
    ],
    "context_for_next": "Use existing db session pattern in database.py"
}

# Agent B reads handoff, continues
```

## Skill-Driven Development

### When to Create a Skill

- Pattern used 3+ times
- Complex multi-step workflow
- Domain-specific knowledge
- Reusable across projects

### Skill Template

```markdown
---
name: my-pattern
description: "Reusable pattern for X"
---

# Pattern: X

## When to Use
- Condition A
- Condition B

## Steps
1. Step one
2. Step two

## Example
\`\`\`bash
hermes -s my-pattern "task description"
\`\`\`

## Gotchas
- Gotcha 1
- Gotcha 2
```

## Project Structure for Agentic Projects

```
my-project/
├── .hermes/                 # Hermes config & skills
│   ├── config.yaml
│   ├── skills/              # Project-specific skills
│   ├── coordination.md      # Multi-agent state
│   └── memory/              # Persistent memory
├── specs/                   # Feature specs (markdown)
│   ├── 001-auth-api.md
│   └── 002-user-profile.md
├── src/
│   ├── domain/              # Pure business logic
│   ├── application/         # Use cases, services
│   ├── infrastructure/      # DB, external APIs
│   └── presentation/        # API, CLI, UI
├── tests/
│   ├── unit/
│   ├── integration/
│   └── contract/            # API contract tests
├── skills/                  # Shared skills (git submodule?)
├── CLAUDE.md                # Project instructions
├── Makefile                 # Common commands
└── pyproject.toml
```

## Quality Gates (Automated)

```yaml
# .github/workflows/quality.yml
name: Quality Gates
on: [push, pull_request]
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: pytest --cov=src --cov-fail-under=80
      - name: Lint
        run: ruff check src tests
      - name: Type check
        run: mypy src
      - name: Security scan
        run: bandit -r src
      - name: Dependency check
        run: pip-audit
```

## Metrics to Track

| Metric | Target | Tool |
|--------|--------|------|
| Test coverage | >80% | pytest-cov |
| Type coverage | >90% | mypy |
| Security issues | 0 high | bandit, pip-audit |
| Cycle time | <30 min | Hermes insights |
| Skill reuse rate | >50% | Curator stats |

## Anti-Patterns to Avoid

| Anti-Pattern | Better Approach |
|--------------|-----------------|
| One giant prompt | Delegate subtasks |
| No verification | Always test after changes |
| Hardcoded config | Use config files + env vars |
| Skipping skills | Create skill after 2nd use |
| No memory | Use `memory` tool for context |

## Quick Commands

```bash
# Start feature with TDD
hermes -s tdd "Add password reset endpoint"

# Multi-agent feature
hermes -w -s agentic-engineering "Build payment integration"

# Refactor with safety
hermes -s refactor "Extract service layer from controllers"

# Security audit
hermes -s security-review "Audit auth module"
```

## Skill Composition

- `tdd` — Test-driven development enforcement
- `autonomous-loops` — Self-running agent loops
- `continuous-agent-loop` — CI-integrated agents
- `git-workflow` — Branch/commit/release automation
- `deployment-patterns` — Deploy what you build
- `security-review` — Built-in security gates

---

*Adapted from ECC agentic-engineering for Hermes Agent. Original: affaan-m/ECC*