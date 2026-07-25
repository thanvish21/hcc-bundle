---
name: deployment-patterns
description: "Hermes-native deployment patterns — systemd services, Docker Compose, Kubernetes, serverless, and CI/CD pipelines using Hermes tooling."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [deployment, devops, systemd, docker, kubernetes, ci-cd]
    related_skills: [docker-patterns, git-workflow, git-workflow]
---

# Deployment Patterns for Hermes

Production deployment patterns using Hermes Agent tooling and automation.

## Prerequisites

- Hermes with `terminal`, `file`, `code_execution` toolsets
- Target environment access (SSH, kubectl, docker, cloud CLIs)

## Core Patterns

### 1. Systemd Service Deployment

```ini
# /etc/systemd/system/hermes-app.service
[Unit]
Description=Hermes Application
After=network.target

[Service]
Type=simple
User=hermes
WorkingDirectory=/opt/hermes-app
Environment=HERMES_HOME=/opt/hermes-app/.hermes
ExecStart=/usr/local/bin/hermes gateway run
Restart=on-failure
RestartSec=10
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```

```bash
# Deploy via Hermes
terminal(command="sudo cp hermes-app.service /etc/systemd/system/")
terminal(command="sudo systemctl daemon-reload")
terminal(command="sudo systemctl enable --now hermes-app")
terminal(command="sudo systemctl status hermes-app")
```

### 2. Docker Compose Stack

```yaml
# docker-compose.yml
version: '3.8'
services:
  hermes-gateway:
    image: nousresearch/hermes-agent:latest
    ports:
      - "8080:8080"
    volumes:
      - ./config:/root/.hermes
      - ./data:/data
    environment:
      - HERMES_HOME=/root/.hermes
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
      interval: 30s
      timeout: 10s
      retries: 3

  redis:
    image: redis:7-alpine
    volumes:
      - redis-data:/data

volumes:
  redis-data:
```

```bash
# Deploy
terminal(command="docker compose up -d --build")
terminal(command="docker compose logs -f hermes-gateway")
```

### 3. Kubernetes Deployment

```yaml
# k8s/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hermes-gateway
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hermes-gateway
  template:
    metadata:
      labels:
        app: hermes-gateway
    spec:
      containers:
      - name: hermes
        image: nousresearch/hermes-agent:latest
        ports:
        - containerPort: 8080
        env:
        - name: HERMES_HOME
          value: /data/.hermes
        volumeMounts:
        - name: config
          mountPath: /data/.hermes
        resources:
          requests:
            memory: "512Mi"
            cpu: "250m"
          limits:
            memory: "1Gi"
            cpu: "1000m"
      volumes:
      - name: config
        persistentVolumeClaim:
          claimName: hermes-config
---
apiVersion: v1
kind: Service
metadata:
  name: hermes-gateway
spec:
  selector:
    app: hermes-gateway
  ports:
  - port: 80
    targetPort: 8080
  type: LoadBalancer
```

```bash
# Deploy
terminal(command="kubectl apply -f k8s/")
terminal(command="kubectl rollout status deployment/hermes-gateway")
```

### 4. CI/CD Pipeline (GitHub Actions)

```yaml
# .github/workflows/deploy.yml
name: Deploy Hermes App

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: |
          pip install -r requirements.txt
          pytest --tb=short

  deploy:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to server
        run: |
          ssh user@server "cd /opt/hermes-app && git pull && docker compose up -d --build"
        env:
          SSH_KEY: ${{ secrets.SSH_KEY }}
```

### 5. Blue-Green Deployment

```bash
#!/bin/bash
# blue-green-deploy.sh

CURRENT=$(docker compose ps --format json | jq -r '.[] | select(.Service=="app-blue") | .State')
TARGET="app-green"

if [[ "$CURRENT" == "running" ]]; then
  TARGET="app-blue"
fi

docker compose up -d --build $TARGET
docker compose exec $TARGET health-check || exit 1
docker compose stop $([ "$TARGET" = "app-blue" ] && echo "app-green" || echo "app-blue")
```

## Hermes Automation

### Cron Jobs for Deployment Health

```bash
# Health check every 5 minutes
hermes cron create "every 5m" "Check deployment health and alert on failure"

# Daily backup
hermes cron create "0 3 * * *" "Backup Hermes config and session data"

# Weekly security update
hermes cron create "0 4 * * 0" "Update base images and redeploy"
```

### Rollback Procedures

```bash
# Quick rollback via Hermes
hermes sessions list --all
hermes --resume <session-id>  # Resume pre-deployment session

# Docker rollback
terminal(command="docker compose down && docker compose up -d --force-recreate")

# K8s rollback
terminal(command="kubectl rollout undo deployment/hermes-gateway")
```

## Environment Management

### Config per Environment

```
config/
├── base.yaml           # Shared config
├── development.yaml    # Dev overrides
├── staging.yaml        # Staging overrides
└── production.yaml     # Prod overrides (secrets in .env)
```

```bash
# Deploy to environment
HERMES_ENV=production hermes deploy
```

## Monitoring & Observability

```yaml
# docker-compose.monitoring.yml
services:
  prometheus:
    image: prom/prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    volumes:
      - grafana-data:/var/lib/grafana
```

## Skill Composition

- `docker-patterns` — Container best practices
- `git-workflow` — GitOps deployment flows
- `security-review` — Secure deployment practices
- `cost-aware-llm-pipeline` — Optimize LLM costs in prod

---

*Adapted from ECC deployment-patterns for Hermes Agent. Original: affaan-m/ECC*