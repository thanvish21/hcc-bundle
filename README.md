# HCC Bundle - Hermes Core Capabilities

**HCC (Hermes Core Capabilities)** is a one-click installable skill bundle for Hermes Agent, adapted from the ECC (Everything Claude Code) ecosystem. It provides 39 production-ready skills for agentic software engineering, security, deployment, and research — all built natively for Hermes Agent's architecture.

## 🚀 Quick Start

```bash
# Load core bundle (5 skills)
hermes chat -q '/hcc'

# Load full bundle (39 skills)
hermes chat -q '/hcc-full'

# Use individual skills
hermes chat -s agentic-engineering "Build a REST API with auth"
hermes chat -s security-review "Audit this code for vulnerabilities"
hermes chat -s deployment-patterns "Deploy Hermes with systemd"
hermes chat -s docker-patterns "Create hardened Dockerfile for FastAPI"
hermes chat -s git-workflow "Set up trunk-based development with worktrees"
```

## 📦 What's Included

### Agentic Engineering (8 skills)
| Skill | Purpose |
|-------|---------|
| `agentic-engineering` | Core TDD loops, multi-agent coordination, self-improvement |
| `ai-first-engineering` | AI-first development workflows |
| `autonomous-loops` | Self-running agent loops |
| `continuous-agent-loop` | CI-integrated agent pipelines |
| `agent-eval` | Agent benchmarking & evaluation |
| `agent-architecture-audit` | Multi-agent system architecture review |
| `agent-harness-construction` | Test harness building for agents |
| `autonomous-agent-harness` | Full autonomous testing framework |

### Engineering Practices (7 skills)
| Skill | Purpose |
|-------|---------|
| `deployment-patterns` | systemd, Docker, K8s, CI/CD, blue-green |
| `docker-patterns` | Multi-stage builds, security hardening, compose |
| `git-workflow` | Trunk-based dev, worktrees, conventional commits |
| `architecture-decision-records` | ADR templates & process |
| `codebase-onboarding` | Rapid codebase understanding |
| `deep-research` | Research methodology |
| `cost-aware-llm-pipeline` | LLM cost optimization |

### Security & Safety (6 skills)
| Skill | Purpose |
|-------|---------|
| `search-first` | Search-before-code security methodology |
| `safety-guard` | Dangerous command prevention |
| `security-review` | SAST, secrets, threat modeling, checklists |
| `security-scan` | Automated vulnerability scanning |
| `security-bounty-hunter` | Bug bounty methodology |
| `hipaa-compliance` | HIPAA compliance patterns |

### Tool Enhancement (6 skills)
| Skill | Purpose |
|-------|---------|
| `context-budget` | Context/token budget management |
| `token-budget-advisor` | Token optimization recommendations |
| `prompt-optimizer` | Prompt engineering best practices |
| `rules-distill` | Rule extraction from codebases |
| `product-lens` | Product-focused development |
| `blueprint` | Spec-driven development |

### Research & Analysis (5 skills)
| Skill | Purpose |
|-------|---------|
| `iterative-retrieval` | Deep research loops |
| `research-ops` | Research workflow automation |
| `benchmark-methodology` | Benchmarking standards |
| `benchmark-optimization-loop` | Optimization cycles |
| `eval-harness` | Model/agent evaluation |

### Code Quality & Patterns (7 skills)
| Skill | Purpose |
|-------|---------|
| `coding-standards` | Code quality enforcement |
| `codehealth-mcp` | Code health via MCP |
| `error-handling` | Error handling patterns |
| `verification-loop` | Verify-after-change |
| `backend-patterns` | Backend architecture |
| `api-design` | API design patterns |
| `database-migrations` | Migration best practices |

## 🔧 Installation

The bundle is already installed in your Hermes skills directory at:
```
~/.hermes/skills/hcc-bundle/
```

Two skill bundles are available:
- **`/hcc`** — 5 core skills (agentic-engineering, security-review, deployment-patterns, docker-patterns, git-workflow)
- **`/hcc-full`** — All 39 skills

## 🎯 Usage Examples

### Build a Feature with TDD
```bash
hermes -s tdd "Add password reset endpoint with JWT tokens"
```

### Multi-Agent Feature Development
```bash
# Terminal 1: Backend
git worktree add ../wt-backend feat/api
cd ../wt-backend
hermes -w -s agentic-engineering "Build user authentication API"

# Terminal 2: Frontend  
git worktree add ../wt-frontend feat/ui
cd ../wt-frontend
hermes -w -s agentic-engineering "Build login/register UI"

# Terminal 3: Coordinator
hermes -s agentic-engineering "Coordinate backend + frontend auth integration"
```

### Security Audit
```bash
hermes -s security-review "Audit this PR for:
1. Hardcoded secrets
2. SQL injection vectors
3. AuthZ bypasses
4. Dependency vulnerabilities
5. Error info leakage"
```

### Deploy to Production
```bash
hermes -s deployment-patterns "Deploy Hermes gateway with:
- systemd service
- Docker Compose for dev
- K8s deployment for prod
- Blue-green rollout
- Health checks & monitoring"
```

### Containerize Securely
```bash
hermes -s docker-patterns "Create production Dockerfile for FastAPI app:
- Multi-stage build
- Non-root user
- Read-only filesystem
- Dropped capabilities
- Distroless base
- Health checks"
```

### Git Workflow Setup
```bash
hermes -s git-workflow "Set up:
- Trunk-based development
- Worktree coordination for agents
- Conventional commits
- Pre-push hooks (tests, security, lint)
- Auto-sync with main
- Release tagging"
```

## 🏗️ Project Structure for Agentic Projects

```
my-project/
├── .hermes/                 # Hermes config, skills, coordination.md, memory/
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
├── CLAUDE.md                # Project instructions for agents
├── Makefile                 # Common commands
└── pyproject.toml
```

## 🔐 Security Model

All skills pass Hermes' **skills-guard security scanner**:
- ✅ No persistence violations (no CLAUDE.md modification instructions)
- ✅ No privilege escalation (no sudo, chmod 777)
- ✅ No supply chain risks (no unpinned npm/pip/uv installs)
- ✅ No network binding to all interfaces without consent
- ✅ No hardcoded IPs/ports
- ✅ No git config --global modifications

## 📚 Skill Composition

Skills are designed to compose:
```bash
# Security-first feature development
hermes -s agentic-engineering,security-review,git-workflow "Build payment integration"

# Full production pipeline
hermes -s agentic-engineering,deployment-patterns,docker-patterns,security-review "Deploy to prod"

# Research-driven development
hermes -s deep-research,agentic-engineering,eval-harness "Evaluate RAG approaches"
```

## 📖 Documentation

Each skill includes:
- **Prerequisites** — Required toolsets & setup
- **Core Patterns** — Ready-to-use workflows
- **Hermes Integration** — Toolset mappings, delegation patterns
- **Quick Commands** — Copy-paste terminal commands
- **Anti-Patterns** — What to avoid
- **Skill Composition** — Related skills

## 🤝 Contributing

1. Fork the repo
2. Create a skill in a new subdirectory
3. Follow the skill template (see existing skills)
4. Ensure security scanner passes
5. Submit PR with conventional commit

## 📄 License

MIT License — see [LICENSE](LICENSE)

---

**Adapted from** [ECC (Everything Claude Code)](https://github.com/affaan-m/ecc) by affaan-m for **Hermes Agent** by Nous Research.

*HCC skills are rebuilt for Hermes' native architecture: toolsets, delegation, worktrees, cron, MCP, and the security model.*