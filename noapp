#!/bin/bash
# NoApp Development Helper - Simplified Version
# Only essential commands for the 3 main workflows

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

case "$1" in
  init)
    echo "🚀 Initializing NoApp for first time..."
    
    # Check for .env
    if [ ! -f .env ]; then
        if [ -f .env.template ]; then
            cp .env.template .env
            echo "❗ Created .env from template. Please add your Anthropic API key!"
            exit 1
        else
            echo "❌ No .env.template found!"
            exit 1
        fi
    fi
    
    # Check API key
    if grep -q "your_anthropic_api_key_here" .env 2>/dev/null; then
        echo "❌ Please update .env with your actual Anthropic API key!"
        exit 1
    fi
    
    # Create directories
    echo "📁 Creating project structure..."
    mkdir -p specs agents devdoc
    
    # Build and start container
    echo "🐳 Building Docker container..."
    docker-compose up -d --build
    
    # Deploy agents and configuration
    echo "📦 Deploying agents and configuration..."
    $0 deploy
    
    # Initialize git if needed
    if [ ! -d .git ]; then
        echo "📝 Initializing git repository..."
        docker exec noapp-step1 bash -c "
          cd /workspace
          git init
          git config user.name 'NoApp System'
          git config user.email 'noapp@siglochconsulting.com'
        " 2>/dev/null || true
    fi
    
    echo -e "${GREEN}✅ NoApp initialized successfully!${NC}"
    echo ""
    echo "Next step: Run './dev.sh start' to begin working"
    ;;
  
  start)
    echo "🚀 Starting NoApp work session..."
    
    # Check if .env exists
    if [ ! -f .env ]; then
        echo "❌ .env file not found. Run './dev.sh init' first"
        exit 1
    fi
    
    # Start container if not running
    if ! docker ps | grep -q noapp-step1; then
        echo "🐳 Starting container..."
        docker-compose up -d
        sleep 2
    fi
    
    # Show agent reminder
    echo -e "${YELLOW}💡 Available agents:${NC}"
    echo "   - discovery-agent (stakeholder & requirements analysis)"
    echo "   - test-agent (validation & testing strategy)"
    echo "   - system-architect-agent (logical structure & interfaces)"
    echo "   - safety-agent (risk assessment & safety analysis)"
    echo ""
    echo -e "${YELLOW}💡 Remember: Use explicit invocation:${NC}"
    echo "   'Use discovery-agent to analyze...'"
    echo ""
    echo "🚀 Starting Claude Code..."
    
    # Start Claude session
    docker-compose exec noapp-dev claude
    ;;
  
  stop)
    echo "🛑 Stopping NoApp..."
    docker-compose down
    echo -e "${GREEN}✅ NoApp stopped${NC}"
    ;;
  
  deploy)
    echo "📦 Deploying updates to container..."
    
    # Check if container is running
    if ! docker ps | grep -q noapp-step1; then
        echo "⚠️  Container not running. Starting it..."
        docker-compose up -d
        sleep 2
    fi
    
    # Deploy agents
    if [ -d "agents" ] && [ "$(ls -A agents/*.md 2>/dev/null)" ]; then
        echo "📦 Deploying agents..."
        docker exec noapp-step1 mkdir -p /workspace/agents /home/appuser/.claude/agents
        for agent in agents/*.md; do
            if [ -f "$agent" ]; then
                name=$(basename "$agent")
                echo "   → $name"
                docker cp "$agent" noapp-step1:/workspace/agents/
                docker cp "$agent" noapp-step1:/home/appuser/.claude/agents/
            fi
        done
    fi
    
    # Deploy git hooks
    if [ -d "git-hooks" ]; then
        echo "📦 Deploying git hooks..."
        docker exec noapp-step1 mkdir -p /workspace/.git/hooks
        for hook in git-hooks/*; do
            if [ -f "$hook" ]; then
                docker cp "$hook" noapp-step1:/workspace/.git/hooks/
                docker exec noapp-step1 chmod +x "/workspace/.git/hooks/$(basename "$hook")" 2>/dev/null || true
            fi
        done
    fi
    
    # Deploy Claude configuration
    echo "📦 Updating Claude configuration..."
    docker exec noapp-step1 mkdir -p /home/appuser/.claude/output-styles
    
    if [ -f ".claude/permissions.json" ]; then
        docker cp .claude/permissions.json noapp-step1:/home/appuser/.claude/
    fi
    
    # Create output style
    docker exec noapp-step1 bash -c 'cat > /home/appuser/.claude/output-styles/noapp-systems-engineering.md << "EOF"
---
name: NoApp Systems Engineering
description: Systems engineering specialist for industrial, mechanical, electrical systems
---

You are a Systems Engineering specialist working on general systems (industrial, mechanical, electrical, etc.) - NOT exclusively software systems.

## Context
- **Domain:** General Systems Engineering (coffee machines, cars, industrial equipment, etc.)
- **Focus:** Requirements analysis, system architecture, stakeholder management
- **Output:** Structured system specifications implementable by engineers

## Key Principles
1. Always consider physical, mechanical, electrical, and software aspects
2. Think about safety, reliability, and maintainability
3. Consider manufacturing and production constraints
4. Include operational and maintenance requirements

## Important Notes
- Save all specifications to /workspace/specs/ directory
- Use .md extension for all specification files
EOF'
    
    echo -e "${GREEN}✅ Deployment complete!${NC}"
    echo "   Agents: $(ls agents/*.md 2>/dev/null | wc -l)"
    echo "   Git hooks: $(ls git-hooks/* 2>/dev/null | wc -l)"
    ;;
  
  clean)
    echo "🧹 This will remove all containers and volumes"
    read -p "Are you sure? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker-compose down -v
        echo -e "${GREEN}✅ Cleanup complete${NC}"
    else
        echo "❌ Cleanup cancelled"
    fi
    ;;
  
  *)
    echo "NoApp Development Helper"
    echo ""
    echo "Usage: $0 {init|start|stop|deploy|clean}"
    echo ""
    echo "Commands:"
    echo "  init   - First-time setup (create directories, build container, deploy)"
    echo "  start  - Start container and Claude session (daily work)"
    echo "  stop   - Stop container"
    echo "  deploy - Deploy agents and config to running container"
    echo "  clean  - Remove containers and volumes (complete reset)"
    echo ""
    echo "Typical workflows:"
    echo "  First time:  ./dev.sh init && ./dev.sh start"
    echo "  Daily work:  ./dev.sh start"
    echo "  Updates:     ./dev.sh deploy"
    echo ""
    echo "See WORKFLOW.md for detailed usage instructions"
    ;;
esac