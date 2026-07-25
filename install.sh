#!/bin/bash
# install.sh — One-line HCC (Hermes Core Capabilities) installer
# Usage: curl -fsSL https://raw.githubusercontent.com/thanvish21/hcc-bundle/main/install.sh | bash
# Or:    bash <(curl -fsSL https://raw.githubusercontent.com/thanvish21/hcc-bundle/main/install.sh)

set -euo pipefail

REPO="thanvish21/hcc-bundle"
BRANCH="main"
INSTALL_DIR="${HERMES_HOME:-$HOME/.hermes}/skills/hcc-bundle"
GITHUB_RAW="https://raw.githubusercontent.com/$REPO/$BRANCH"

echo "🚀 Installing HCC Bundle for Hermes Agent..."

# Check if hermes is installed
if ! command -v hermes &> /dev/null; then
    echo "⚠️  Hermes not found. Install it first:"
    echo "   curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash"
    exit 1
fi

# Create skills directory
mkdir -p "$INSTALL_DIR"

# Download all skill files
echo "📦 Downloading HCC skills..."

SKILLS=(
    "agentic-engineering"
    "ai-first-engineering"
    "autonomous-loops"
    "continuous-agent-loop"
    "agent-eval"
    "agent-architecture-audit"
    "agent-harness-construction"
    "autonomous-agent-harness"
    "deployment-patterns"
    "docker-patterns"
    "git-workflow"
    "architecture-decision-records"
    "codebase-onboarding"
    "deep-research"
    "cost-aware-llm-pipeline"
    "search-first"
    "safety-guard"
    "security-review"
    "security-scan"
    "security-bounty-hunter"
    "hipaa-compliance"
    "context-budget"
    "token-budget-advisor"
    "prompt-optimizer"
    "rules-distill"
    "product-lens"
    "blueprint"
    "iterative-retrieval"
    "research-ops"
    "benchmark-methodology"
    "benchmark-optimization-loop"
    "eval-harness"
    "coding-standards"
    "codehealth-mcp"
    "error-handling"
    "verification-loop"
    "backend-patterns"
    "api-design"
    "database-migrations"
)

for skill in "${SKILLS[@]}"; do
    SKILL_DIR="$INSTALL_DIR/$skill"
    mkdir -p "$SKILL_DIR"
    echo "  ↓ $skill"
    curl -fsSL "$GITHUB_RAW/$skill/SKILL.md" -o "$SKILL_DIR/SKILL.md" 2>/dev/null || echo "    ⚠️  Failed to download $skill"
done

# Download main bundle SKILL.md
echo "  ↓ hcc-bundle (main)"
curl -fsSL "$GITHUB_RAW/SKILL.md" -o "$INSTALL_DIR/SKILL.md" 2>/dev/null || echo "    ⚠️  Failed to download main bundle"

# Download LICENSE
curl -fsSL "$GITHUB_RAW/LICENSE" -o "$INSTALL_DIR/LICENSE" 2>/dev/null

# Download README
curl -fsSL "$GITHUB_RAW/README.md" -o "$INSTALL_DIR/README.md" 2>/dev/null

# Create skill bundles
echo "🔗 Creating skill bundles..."
hermes bundles create hcc \
    --skill agentic-engineering \
    --skill security-review \
    --skill deployment-patterns \
    --skill docker-patterns \
    --skill git-workflow \
    2>/dev/null || echo "  ⚠️  Could not create /hcc bundle (may already exist)"

hermes bundles create hcc-full \
    --skill agentic-engineering \
    --skill ai-first-engineering \
    --skill autonomous-loops \
    --skill continuous-agent-loop \
    --skill agent-eval \
    --skill agent-architecture-audit \
    --skill agent-harness-construction \
    --skill autonomous-agent-harness \
    --skill deployment-patterns \
    --skill docker-patterns \
    --skill git-workflow \
    --skill architecture-decision-records \
    --skill codebase-onboarding \
    --skill deep-research \
    --skill cost-aware-llm-pipeline \
    --skill search-first \
    --skill safety-guard \
    --skill security-review \
    --skill security-scan \
    --skill security-bounty-hunter \
    --skill hipaa-compliance \
    --skill context-budget \
    --skill token-budget-advisor \
    --skill prompt-optimizer \
    --skill rules-distill \
    --skill product-lens \
    --skill blueprint \
    --skill iterative-retrieval \
    --skill research-ops \
    --skill benchmark-methodology \
    --skill benchmark-optimization-loop \
    --skill eval-harness \
    --skill coding-standards \
    --skill codehealth-mcp \
    --skill error-handling \
    --skill verification-loop \
    --skill backend-patterns \
    --skill api-design \
    --skill database-migrations \
    2>/dev/null || echo "  ⚠️  Could not create /hcc-full bundle (may already exist)"

# Sync skills
echo "🔄 Syncing skills..."
hermes skills check 2>/dev/null || true

echo ""
echo "✅ HCC Bundle installed successfully!"
echo ""
echo "🎯 Usage:"
echo "   /hcc          # Load 5 core skills"
echo "   /hcc-full     # Load all 39 skills"
echo "   hermes -s agentic-engineering \"Build a feature\""
echo "   hermes -s security-review \"Audit this code\""
echo ""
echo "📍 Installed to: $INSTALL_DIR"
echo "🔄 Run 'hermes skills list | grep hcc-bundle' to verify"