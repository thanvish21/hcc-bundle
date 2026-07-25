---
name: security-review
description: "Security code review patterns for Hermes Agent — SAST, dependency scanning, secrets detection, and threat modeling using Hermes tools."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [security, code-review, sast, secrets, threat-modeling]
    related_skills: [security-scan, search-first, safety-guard, security-bounty-hunter]
---

# Security Review for Hermes

Security-focused code review and analysis patterns using Hermes Agent toolsets.

## Prerequisites

- Hermes with `terminal`, `file`, `web`, `code_execution` toolsets
- Optional: `semgrep`, `bandit`, `trivy`, `gitleaks` installed locally

## Core Patterns

### 1. Automated SAST Scan

```bash
# Run semgrep with security rules
terminal(command="semgrep --config=auto --config=p/security-audit src/")

# Bandit for Python
terminal(command="bandit -r src/ -f json -o bandit-report.json")

# Custom security rules
terminal(command="semgrep --config=.hermes/security-rules.yaml src/")
```

### 2. Dependency Vulnerability Scanning

```bash
# Python
terminal(command="pip-audit -r requirements.txt --format=json")

# Node.js
terminal(command="npm audit --json")

# Go
terminal(command="govulncheck ./...")

# Container images
terminal(command="trivy image myapp:latest --format json")
```

### 3. Secrets Detection

```bash
# Gitleaks for git history
terminal(command="gitleaks detect --source . --verbose --report-format json")

# TruffleHog for real-time
terminal(command="trufflehog filesystem . --json")

# Hermes-native: scan before commit
hermes config set approvals.mode smart  # Blocks commits with secrets
```

### 4. Threat Modeling Session

```markdown
/hermes
> Perform threat model for the payment API:
> 1. Identify assets (user data, payment tokens, API keys)
> 2. Identify threat actors (external attacker, malicious insider, compromised dependency)
> 3. Map attack surface (endpoints, data flows, trust boundaries)
> 4. Apply STRIDE per component
> 5. Generate mitigations and test cases
```

## Hermes Workflow Integration

### Pre-Commit Hook

```yaml
# .hermes/pre-commit-security.yaml
hooks:
  - id: secrets-scan
    command: gitleaks protect --staged -v
  - id: semgrep-scan
    command: semgrep --config=p/security-audit --error
  - id: dependency-check
    command: pip-audit --fail-on-vuln
```

### CI/CD Integration

```bash
# Scheduled security scan via Hermes cron
hermes cron create "0 3 * * *" "Run full security scan on main branch"
hermes cron create "every 1h" "Check for new CVEs in dependencies"
```

### Real-Time Review

```markdown
/hermes
> Review this PR for security issues:
> 1. Check for hardcoded secrets
> 2. Validate input sanitization
> 3. Review authentication/authorization logic
> 4. Check for SQL injection vectors
> 5. Verify secure defaults
> 6. Assess dependency risks
```

## Security Checklists

### Code Review Checklist

- [ ] No hardcoded secrets, API keys, passwords
- [ ] Input validation on all user-controlled data
- [ ] Parameterized queries (no string concatenation in SQL)
- [ ] Proper authentication & authorization checks
- [ ] Secure defaults (deny by default)
- [ ] Error messages don't leak sensitive info
- [ ] Dependencies pinned & scanned
- [ ] Logging doesn't capture PII/secrets

### Architecture Review Checklist

- [ ] Trust boundaries identified and enforced
- [ ] Principle of least privilege applied
- [ ] Encryption in transit (TLS 1.3) and at rest
- [ ] Secrets management (not in code/config)
- [ ] Audit logging for security events
- [ ] Rate limiting & DoS protection
- [ ] Secure headers (CSP, HSTS, etc.)

## Tool Commands Quick Reference

| Tool | Command | Use Case |
|------|---------|----------|
| semgrep | `semgrep --config=auto src/` | SAST patterns |
| bandit | `bandit -r src/` | Python security |
| gitleaks | `gitleaks detect` | Git secrets |
| trivy | `trivy fs .` | FS/container vulns |
| pip-audit | `pip-audit` | Python deps |
| npm audit | `npm audit` | Node deps |
| osv-scanner | `osv-scanner .` | All ecosystems |

## Skill Composition

Works with:
- `search-first` — Research vulnerabilities before fixing
- `safety-guard` — Prevent dangerous commands during review
- `security-scan` — Automated scanning skill
- `security-bounty-hunter` — Bug bounty methodology

---

*Adapted from ECC security-review for Hermes Agent. Original: affaan-m/ECC*