---
name: docker-patterns
description: "Docker best practices for Hermes Agent — multi-stage builds, security hardening, compose patterns, and container optimization."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [docker, containers, multi-stage, security, compose]
    related_skills: [deployment-patterns, security-review, cost-aware-llm-pipeline]
---

# Docker Patterns for Hermes

Production-ready Docker patterns optimized for Hermes Agent workloads.

## Prerequisites

- Docker 24+ with BuildKit enabled
- Hermes with `terminal`, `file`, `code_execution` toolsets

## Core Patterns

### 1. Multi-Stage Build (Python/Hermes)

```dockerfile
# syntax = docker/dockerfile:1.7

# Build stage
FROM python:3.13-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Runtime stage
FROM python:3.13-slim AS runtime
WORKDIR /app

# Non-root user
RUN groupadd -r hermes && useradd -r -g hermes hermes

# Copy only installed packages
COPY --from=builder /root/.local /home/hermes/.local
ENV PATH=/home/hermes/.local/bin:$PATH

# Copy application
COPY --chown=hermes:hermes . .

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD python -c "import hermes_cli; print('OK')" || exit 1

USER hermes
ENTRYPOINT ["hermes"]
CMD ["gateway", "run"]
```

### 2. Hermes Gateway Image

```dockerfile
# Dockerfile.gateway
FROM nousresearch/hermes-agent:latest AS base

# Add custom skills/plugins
COPY --chown=hermes:hermes skills/ /home/hermes/.hermes/skills/
COPY --chown=hermes:hermes plugins/ /home/hermes/.hermes/plugins/

# Config (non-secrets only)
COPY --chown=hermes:hermes config.yaml /home/hermes/.hermes/config.yaml

# Secrets mounted at runtime via .env or Docker secrets
# docker run --env-file .env.production ...

USER hermes
```

### 3. Docker Compose for Development

```yaml
# docker-compose.dev.yml
version: '3.8'
services:
  hermes:
    build:
      context: .
      dockerfile: Dockerfile.dev
    volumes:
      - .:/app
      - ~/.hermes:/home/hermes/.hermes
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - HERMES_HOME=/home/hermes/.hermes
      - PYTHONPATH=/app
    ports:
      - "8080:8080"
    command: hermes --dev
    profiles: ["dev"]

  # Supporting services
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: hermes
      POSTGRES_USER: hermes
      POSTGRES_PASSWORD_FILE: /run/secrets/postgres_password
    secrets:
      - postgres_password
    volumes:
      - postgres-data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    volumes:
      - redis-data:/data

secrets:
  postgres_password:
    file: ./secrets/postgres_password.txt

volumes:
  postgres-data:
  redis-data:
```

### 4. Production Compose

```yaml
# docker-compose.prod.yml
version: '3.8'
services:
  hermes-gateway:
    image: ${REGISTRY}/hermes-gateway:${VERSION}
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: '1'
          memory: 1G
        reservations:
          cpus: '0.25'
          memory: 256M
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3
    ports:
      - "8080:8080"
    environment:
      - HERMES_HOME=/data/.hermes
    volumes:
      - hermes-data:/data
    secrets:
      - hermes_env
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 10s

secrets:
  hermes_env:
    external: true

volumes:
  hermes-data:
    external: true
```

## Security Hardening

### 1. Non-Root User (Required)

```dockerfile
RUN groupadd -r appuser && useradd -r -g appuser appuser
USER appuser
```

### 2. Read-Only Root Filesystem

```yaml
# In compose
services:
  hermes:
    read_only: true
    tmpfs:
      - /tmp
      - /var/run
```

### 3. Drop Capabilities

```yaml
services:
  hermes:
    cap_drop:
      - ALL
    cap_add:
      - NET_BIND_SERVICE  # Only if binding <1024
    security_opt:
      - no-new-privileges:true
```

### 4. Scan Images

```bash
# Trivy scan
terminal(command="trivy image --severity HIGH,CRITICAL hermes-gateway:latest")

# Hadolint for Dockerfile
terminal(command="hadolint Dockerfile")
```

## Build Optimization

### 1. Layer Caching

```dockerfile
# Copy dependency files first
COPY requirements.txt pyproject.toml ./
RUN pip install --no-cache-dir --user -r requirements.txt

# Then copy source (changes frequently)
COPY . .
```

### 2. .dockerignore

```
# .dockerignore
.git
.gitignore
__pycache__
*.pyc
.pytest_cache
.coverage
htmlcov
.tox
.venv
venv
.env
.env.*
!.env.example
*.log
.DS_Store
*.swp
*.swo
.vscode
.idea
*.md
!README.md
docs/
tests/
scripts/
```

### 3. BuildKit Features

```dockerfile
# syntax = docker/dockerfile:1.7
# Cache mount for pip
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt
```

## Hermes-Specific Patterns

### 1. Skill/Plugin Mounting

```yaml
# For development - mount skills for live reload
volumes:
  - ./skills:/home/hermes/.hermes/skills:ro
  - ./plugins:/home/hermes/.hermes/plugins:ro
```

### 2. Config Management

```yaml
# Config as code, secrets at runtime
volumes:
  - ./config.yaml:/home/hermes/.hermes/config.yaml:ro
secrets:
  - hermes_secrets
```

### 3. Gateway with Persistent Sessions

```yaml
services:
  hermes-gateway:
    volumes:
      - hermes-sessions:/home/hermes/.hermes/sessions
      - hermes-state:/home/hermes/.hermes/state.db
```

## Commands Quick Reference

| Task | Command |
|------|---------|
| Build dev | `docker compose -f docker-compose.dev.yml build` |
| Run dev | `docker compose -f docker-compose.dev.yml up` |
| Build prod | `docker compose -f docker-compose.prod.yml build` |
| Deploy prod | `docker compose -f docker-compose.prod.yml up -d` |
| View logs | `docker compose logs -f hermes-gateway` |
| Shell access | `docker compose exec hermes-gateway bash` |
| Scan image | `trivy image hermes-gateway:latest` |
| Prune | `docker system prune -af` |

## Skill Composition

- `deployment-patterns` — Full deployment pipelines
- `security-review` — Container security scanning
- `cost-aware-llm-pipeline` — Optimize LLM API costs in containers

---

*Adapted from ECC docker-patterns for Hermes Agent. Original: affaan-m/ECC*