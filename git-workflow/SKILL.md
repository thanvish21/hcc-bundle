---
name: git-workflow
description: "Git workflow patterns for Hermes Agent — branching strategy, commit conventions, worktree coordination, and automation using Hermes tooling."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [git, workflow, branching, commits, worktree, automation]
    related_skills: [agentic-engineering, deployment-patterns, codebase-onboarding]
---

# Git Workflow for Hermes

Git patterns optimized for Hermes Agent multi-agent development.

## Prerequisites

- Hermes with `terminal`, `file`, `delegation` toolsets
- Git 2.30+
- Optional: `gh` CLI for GitHub integration

## Branching Strategy

### Trunk-Based Development (Recommended)

```
main ────────────────────────────────────────►
  │    │    │    │    │    │
  ▼    ▼    ▼    ▼    ▼    ▼
feat feat feat fix  feat feat  (short-lived branches, <1 day)
```

```bash
# Create feature branch
terminal(command="git checkout -b feat/user-auth main")

# Work in worktree (isolated)
terminal(command="git worktree add ../worktree-auth feat/user-auth")
hermes -w  # In worktree directory
```

### Release Branches (For Versioned Releases)

```
main ──┬── release/v1.0 ──┬── release/v1.1 ──►
       │                 │
       ▼                 ▼
    hotfix/1.0.1      hotfix/1.1.1
```

## Commit Convention

### Conventional Commits

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`, `build`, `ci`, `revert`

### Examples

```bash
# Feature
git commit -m "feat(auth): add JWT refresh token rotation"

# Fix
git commit -m "fix(api): handle rate limit 429 response"

# Refactor
git commit -m "refactor(db): extract query builder to separate module"

# Breaking change
git commit -m "feat(api)!: change auth header format

BREAKING CHANGE: Authorization header now uses 'Bearer' prefix"
```

## Hermes Worktree Coordination

### Multi-Agent Setup

```bash
# Terminal 1: Backend agent
git worktree add ../wt-backend feat/backend-api
cd ../wt-backend
hermes -w

# Terminal 2: Frontend agent  
git worktree add ../wt-frontend feat/frontend-ui
cd ../wt-frontend
hermes -w

# Terminal 3: Integration agent
git worktree add ../wt-integration main
cd ../wt-integration
hermes -w
```

### Shared Configuration

```bash
# Global git config (run once per machine)
terminal(command="git config --global init.defaultBranch main")
terminal(command="git config --global pull.rebase true")
terminal(command="git config --global push.default current")
terminal(command="git config --global merge.conflictstyle zdiff3")

# Per-repo hooks
terminal(command="cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Run Hermes security scan
hermes skills run security-scan --staged
EOF
chmod +x .git/hooks/pre-commit")
```

## Automation with Hermes

### Pre-Push Hook

```bash
# .git/hooks/pre-push
#!/bin/bash
branch=$(git rev-parse --abbrev-ref HEAD)

# Run tests
echo "Running tests..."
terminal(command="pytest -x --tb=short")

# Check for secrets
echo "Scanning for secrets..."
terminal(command="gitleaks protect --staged -v")

# Validate commit messages
echo "Validating commits..."
terminal(command="commitlint --from=main --to=HEAD")
```

### Auto-Sync with Main

```bash
# Cron job via Hermes
hermes cron create "every 30m" "
  git fetch origin main
  git rebase origin/main
  git push --force-with-lease
"
```

### PR Creation

```bash
# Via Hermes delegation
delegate_task(
    goal="Create PR for current branch",
    context="Branch: feat/user-auth. Run tests, generate changelog, create PR with description."
)
```

## Conflict Resolution

### Hermes-Assisted Merge

```markdown
/hermes
> Resolve merge conflicts in src/auth/middleware.py:
> 1. Show conflict markers
> 2. Explain both sides
> 3. Suggest resolution preserving both features
> 4. Run tests after merge
```

### Rebase Workflow

```bash
# Interactive rebase for clean history
terminal(command="git rebase -i main")

# Squash fixup commits
# pick abc123 feat: add login
# fixup def456 fix: typo in login
# fixup ghi789 fix: add test
```

## Release Process

### Semantic Versioning

```bash
# Major: breaking changes
# Minor: new features (backward compatible)
# Patch: bug fixes (backward compatible)

# Tag release
terminal(command="git tag -a v1.2.0 -m 'Release v1.2.0'")
terminal(command="git push origin v1.2.0")
```

### Changelog Generation

```bash
# Auto-generate from conventional commits
terminal(command="git cliff --output CHANGELOG.md")
```

## Useful Aliases

```bash
# Add to ~/.gitconfig
[alias]
  co = checkout
  cb = checkout -b
  st = status -sb
  lg = log --oneline --graph --decorate -20
  amend = commit --amend --no-edit
  wip = commit -m "WIP"
  unwip = reset HEAD~1
  sync = !git fetch origin && git rebase origin/main
  clean = !git branch --merged | grep -v main | xargs -r git branch -d
```

## Skill Composition

- `agentic-engineering` — Multi-agent git coordination
- `deployment-patterns` — GitOps deployment
- `codebase-onboarding` — Repo exploration for new agents

---

*Adapted from ECC git-workflow for Hermes Agent. Original: affaan-m/ECC*