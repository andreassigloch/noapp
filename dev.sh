#!/bin/bash
# NoApp Development Helper Script - Step 1

set -e

case "$1" in
  start)
    echo "🚀 Starting NoApp Step 1 development container..."
    if [ ! -f .env ]; then
        echo "❌ .env file not found. Copy .env.template to .env and add your API key."
        exit 1
    fi
    docker-compose up -d
    echo "✅ Container started. Opening shell..."
    docker-compose exec noapp-dev bash
    ;;
  
  stop)
    echo "🛑 Stopping NoApp development container..."
    docker-compose down
    ;;
  
  restart)
    echo "🔄 Restarting NoApp development container..."
    docker-compose down
    docker-compose up -d
    docker-compose exec noapp-dev bash
    ;;
  
  claude)
    echo "🤖 Starting Claude Code session..."
    
    # Ensure latest configuration is deployed
    echo "📦 Ensuring latest configuration..."
    $0 deploy > /dev/null 2>&1
    
    echo "💡 Available agents:"
    echo "   - discovery-agent (stakeholder & requirements analysis)"
    echo "   - test-agent (validation & testing strategy)" 
    echo "   - system-architect-agent (logical structure & interfaces)"
    echo "   - safety-agent (risk assessment & safety analysis)"
    echo ""
    echo "💡 Available output-style:"
    echo "   - NoApp Systems Engineering (select in Claude interface)"
    echo ""
    echo "💡 Quick commands to try:"
    echo "   - 'Use discovery-agent to analyze a [system name] system'"
    echo "   - 'Use test-agent to challenge and validate these requirements'"
    echo "   - 'Use system-architect-agent to design the logical architecture'"  
    echo "   - 'Use safety-agent to perform a risk assessment'"
    echo "   - './agent-orchestrator.sh' (for multi-agent collaboration demo)"
    echo ""
    echo "⚠️  IMPORTANT: You MUST explicitly say 'Use [agent-name] to...' to trigger agents!"
    echo "   Claude will NOT automatically use agents - you must request them explicitly."
    echo ""
    echo "🚀 Starting Claude..."
    
    docker-compose exec noapp-dev claude
    ;;
  
  claude-agents)
    echo "🤖 Starting Claude with agent demonstration..."
    echo ""
    echo "This will show you how to use the multi-agent system:"
    
    docker-compose exec noapp-dev bash -c '
      echo "=== Multi-Agent System Demo ==="
      echo "1. Running orchestrator to show agent collaboration..."
      echo ""
      ./agent-orchestrator.sh
      echo ""
      echo "2. Now starting Claude for interactive session..."
      echo "   Try: \"Use discovery-agent to analyze a new system\""
      echo ""
      claude
    '
    ;;
  
  claude-debug)
    echo "🤖 Starting Claude Code with debug information..."
    echo ""
    echo "📊 Container status:"
    docker-compose ps
    echo ""
    echo "📁 Available agents:"
    docker exec noapp-step1 ls -la /home/appuser/.claude/agents/ 2>/dev/null || echo "   No agents found!"
    echo ""
    echo "📁 Available output-styles:"
    docker exec noapp-step1 ls -la /home/appuser/.claude/output-styles/ 2>/dev/null || echo "   No output-styles found!"
    echo ""
    echo "⚙️  Claude config:"
    docker exec noapp-step1 claude config list
    echo ""
    echo "📝 Git status:"
    docker exec noapp-step1 bash -c "cd /workspace && git status --short" 2>/dev/null || echo "   Git not initialized"
    echo ""
    
    docker-compose exec noapp-dev claude
    ;;

  git-init)
    echo "📝 Initializing Git repository with auto-commit..."
    
    # Check if container is running
    if ! docker ps | grep -q noapp-step1; then
        echo "❌ Container not running. Start with './dev.sh start' first"
        exit 1
    fi
    
    # Initialize git in container
    docker exec noapp-step1 bash -c "
      cd /workspace
      if [ ! -d .git ]; then
        git init
        git config user.name 'NoApp System'
        git config user.email 'noapp@siglochconsulting.com'
        echo '✅ Git repository initialized'
      else
        echo 'ℹ️  Git repository already exists'
      fi
    "
    
    # Deploy hooks
    echo "📦 Installing git hooks..."
    $0 deploy > /dev/null 2>&1
    
    # Create initial commit
    docker exec noapp-step1 bash -c "
      cd /workspace
      git add .gitignore agents/ specs/ 2>/dev/null
      if ! git diff --cached --quiet; then
        git commit -m 'Initial commit: NoApp system setup

- Initialized agents and specs directories
- Added git hooks for auto-versioning
- System ready for specification development

🤖 Generated with NoApp System'
        echo '✅ Initial commit created'
      else
        echo 'ℹ️  Nothing to commit'
      fi
    "
    ;;
  
  git-status)
    echo "📝 Git Repository Status..."
    
    docker exec noapp-step1 bash -c "
      cd /workspace
      echo '📊 Working Directory Status:'
      git status
      echo ''
      echo '📚 Recent Commits (last 5):'
      git log --oneline -5
      echo ''
      echo '📈 Repository Statistics:'
      echo \"   Total commits: \$(git rev-list --all --count)\"
      echo \"   Tracked files: \$(git ls-files | wc -l)\"
    " 2>/dev/null || echo "❌ Git repository not initialized. Run './dev.sh git-init' first"
    ;;
  
  git-watch)
    echo "👁️  Starting Git auto-commit watcher..."
    
    # Check if container is running
    if ! docker ps | grep -q noapp-step1; then
        echo "❌ Container not running. Start with './dev.sh start' first"
        exit 1
    fi
    
    echo "🔍 Monitoring specs/ and agents/ directories for changes..."
    echo "💡 Any .md, .txt, .json file changes will be auto-committed"
    echo "📝 Press Ctrl+C to stop watching"
    echo ""
    
    docker exec -it noapp-step1 /workspace/.git/hooks/specs-watcher.sh
    ;;
  
  shell)
    echo "🐚 Opening container shell..."
    docker-compose exec noapp-dev bash
    ;;
  
  logs)
    echo "📋 Showing container logs..."
    docker-compose logs -f noapp-dev
    ;;
  
  status)
    echo "📊 Container status:"
    docker-compose ps
    echo ""
    echo "📁 Volume mounts:"
    echo "  - ./specs -> /workspace/specs (Generated specifications)"
    echo "  - ./agents -> /workspace/agents (Agent development)"
    echo "  - Docker volume: noapp-claude (Claude configuration)"
    ;;
  
  deploy)
    echo "🚀 Deploying updates to container..."
    
    # Check if container is running
    if ! docker ps | grep -q noapp-step1; then
        echo "❌ Container not running. Start with './dev.sh start' first"
        exit 1
    fi
    
    echo "📦 Syncing agents..."
    # Copy agents to both locations - workspace for development and .claude for Claude Code
    docker exec noapp-step1 mkdir -p /workspace/agents
    docker exec noapp-step1 mkdir -p /home/appuser/.claude/agents
    for agent in agents/*.md; do
        if [ -f "$agent" ]; then
            echo "   → $(basename $agent) (to both locations)"
            docker cp "$agent" noapp-step1:/workspace/agents/
            docker cp "$agent" noapp-step1:/home/appuser/.claude/agents/
        fi
    done
    
    echo "📦 Syncing scripts..."
    # Copy orchestrator and other scripts
    if [ -f "agent-orchestrator.sh" ]; then
        echo "   → agent-orchestrator.sh"
        docker cp agent-orchestrator.sh noapp-step1:/workspace/
        # chmod might fail due to permissions, but script should still be executable
        docker exec noapp-step1 chmod +x /workspace/agent-orchestrator.sh 2>/dev/null || echo "   (chmod failed, but script should work)"
    fi
    
    # Copy git hooks
    if [ -d "git-hooks" ]; then
        echo "   → git hooks"
        docker exec noapp-step1 mkdir -p /workspace/.git/hooks
        for hook in git-hooks/*; do
            if [ -f "$hook" ]; then
                hookname=$(basename "$hook")
                echo "     → $hookname"
                docker cp "$hook" noapp-step1:/workspace/.git/hooks/
                docker exec noapp-step1 chmod +x "/workspace/.git/hooks/$hookname" 2>/dev/null
            fi
        done
    fi
    
    echo "📦 Syncing specs..."
    # Ensure specs directory exists
    docker exec noapp-step1 mkdir -p /workspace/specs
    
    echo "📦 Updating Claude configuration..."
    # Create directories
    docker exec noapp-step1 bash -c 'mkdir -p /home/appuser/.claude/output-styles'
    
    # Copy permissions configuration
    if [ -f ".claude/permissions.json" ]; then
        echo "   → permissions.json"
        docker cp .claude/permissions.json noapp-step1:/home/appuser/.claude/
    fi
    docker exec noapp-step1 bash -c 'cat > /home/appuser/.claude/output-styles/noapp-systems-engineering.md << "EOF"
---
name: NoApp Systems Engineering
description: Systems engineering specialist for industrial, mechanical, electrical systems - NOT just software
---

You are a Systems Engineering specialist working on general systems (industrial, mechanical, electrical, etc.) - NOT exclusively software systems.

## Context
- **Domain:** General Systems Engineering (coffee machines, cars, industrial equipment, etc.)
- **Focus:** Requirements analysis, system architecture, stakeholder management
- **Output:** Structured system specifications implementable by engineers

## Communication Style
- Think like a systems architect and business analyst
- Use precise, unambiguous language
- Generate specifications that mechanical/electrical/software engineers can implement
- Follow INCOSE principles but keep it readable for implementation teams

## Key Principles
1. Always consider physical, mechanical, electrical, and software aspects
2. Think about safety, reliability, and maintainability
3. Consider manufacturing and production constraints
4. Include operational and maintenance requirements

## Important Notes
- Save all specifications to /workspace/specs/ directory
- Use .md extension for all specification files
- Ensure files are accessible from host system via volume mount
EOF'
    
    # Also create the old format as backup
    docker exec noapp-step1 bash -c 'cat > /home/appuser/.claude/output-style.md << "EOF"
---
name: NoApp Systems Engineering
description: Systems engineering specialist for industrial, mechanical, electrical systems
---

You are a Systems Engineering specialist working on general systems (industrial, mechanical, electrical, etc.) - NOT exclusively software systems.

Focus on requirements analysis, system architecture, and stakeholder management for physical systems like coffee machines, cars, industrial equipment, etc.
EOF'
    
    echo "✅ Deployment complete!"
    echo ""
    echo "💡 Changes deployed:"
    echo "   - $(ls agents/*.md 2>/dev/null | wc -l) agents"
    echo "   - Orchestrator script updated"
    echo "   - Claude configuration updated"
    ;;
  
  update)
    echo "🔄 Hot-reloading changes to running container..."
    
    # Check if container is running
    if ! docker ps | grep -q noapp-step1; then
        echo "❌ Container not running. Start with './dev.sh start' first"
        exit 1
    fi
    
    # Watch for changes and sync
    echo "👁️  Watching for changes (Ctrl+C to stop)..."
    echo "   Monitoring: agents/*.md, *.sh"
    
    # Simple file watcher (for macOS with fswatch, fallback to manual)
    if command -v fswatch >/dev/null 2>&1; then
        fswatch -o agents/ *.sh | while read f; do
            echo "🔄 Change detected, syncing..."
            $0 deploy
        done
    else
        echo "ℹ️  Install fswatch for auto-sync: brew install fswatch"
        echo "   Manual mode: Run './dev.sh deploy' after changes"
        
        # Manual watch loop
        while true; do
            read -p "Press Enter to deploy changes (or Ctrl+C to exit)..."
            $0 deploy
        done
    fi
    ;;
  
  clean)
    echo "🧹 Cleaning up containers and volumes..."
    read -p "This will delete all development state. Continue? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker-compose down -v
        docker system prune -f
        echo "✅ Cleanup complete."
    else
        echo "❌ Cleanup cancelled."
    fi
    ;;
  
  setup)
    echo "🔧 Setting up NoApp Step 1..."
    
    # Create directory structure
    mkdir -p specs agents
    
    # Check for .env
    if [ ! -f .env ]; then
        echo "📋 Creating .env from template..."
        cp .env.template .env
        echo "❗ Please edit .env and add your Anthropic API key!"
    fi
    
    # Create initial Claude configuration
    cat > claude-config.md << 'EOF'
# NoApp Claude Code Configuration

## System Context
- **Domain:** Systems Engineering (not Software Engineering)
- **Focus:** Requirements analysis, system architecture, stakeholder management
- **Output:** Structured system specifications for implementation by others

## Output Style Configuration
- **Approach:** Business analyst and systems architect perspective
- **Language:** Structured, precise, implementable requirements
- **Format:** INCOSE-inspired but readable by Java/C programmers

## Agent Coordination
- Use discovery-agent for stakeholder and requirements analysis
- Maintain systems engineering mindset throughout conversation
- Focus on system-level concerns, not implementation details

## Important Notes
- Save all specifications to /workspace/specs/ directory
- Use .md extension for all specification files
- Ensure files are accessible from host system via volume mount
EOF
    
    # Create initial agent template
    if [ ! -f agents/discovery-agent.md ]; then
        cat > agents/discovery-agent.md << 'EOF'
---
name: discovery-agent
description: Business requirements discovery specialist. Use proactively for stakeholder analysis, use case identification, and requirement elicitation.
tools: Read, Write, Git
model: sonnet
---

You are a senior Business Analyst specializing in system requirements discovery for NoApp.

Your role is to guide users through structured requirements elicitation:

## Methodology
1. **Stakeholder Identification:** Who are all the people/systems involved?
2. **Use Case Discovery:** What are the main workflows and scenarios?
3. **Requirement Elicitation:** What are the explicit and implicit needs?
4. **Constraint Discovery:** What limits or restrictions exist?

## Key Questions to Ask
- Who will use this system and in what context?
- What problems does this system solve?
- What does success look like?
- What should this system NOT do?
- What are the dependencies and integrations needed?

## Output Format
Generate structured requirements in a format that other agents can process:
- Clear stakeholder definitions
- Use case scenarios with actors, triggers, flows
- Functional and non-functional requirements
- Identified constraints and dependencies

Always ask clarifying questions to uncover implicit requirements.
EOF
        echo "✅ Created example discovery-agent.md"
    fi
    
    echo ""
    echo "🎉 Setup complete!"
    echo ""
    echo "📋 Created files:"
    echo "   ✅ claude-config.md (Systems Engineering context)"
    echo "   ✅ discovery-agent.md (Example agent)"
    echo "   ✅ Project structure"
    echo ""
    echo "🚀 Next Steps:"
    echo "   1. Edit .env and add your Anthropic API key"
    echo "   2. Run './dev.sh start' to begin development"
    echo "   3. In container: Tell Claude to read claude-config.md for context"
    echo "   4. Start your first systems engineering conversation!"
    echo ""
    echo "💡 Key Point: This is SYSTEMS ENGINEERING, not software engineering!"
    ;;
  
  *)
    echo "NoApp Development Helper - Step 1"
    echo ""
    echo "Usage: $0 {setup|start|stop|restart|deploy|update|claude|claude-agents|claude-debug|git-init|git-status|git-watch|shell|logs|status|clean}"
    echo ""
    echo "Commands:"
    echo "  setup        - Initial project setup (run first)"
    echo "  start        - Start development container and shell"
    echo "  stop         - Stop development container"
    echo "  restart      - Restart development container"
    echo "  deploy       - Deploy agents and scripts to running container"
    echo "  update       - Watch and auto-deploy changes (hot-reload)"
    echo "  claude       - Start Claude Code session with usage guide"
    echo "  claude-agents - Demo multi-agent system then start Claude"
    echo "  claude-debug - Start Claude with debug info and agent status"
    echo "  git-init     - Initialize git repository with auto-commit hooks"
    echo "  git-status   - Show git repository status and history"  
    echo "  git-watch    - Start automatic git commit watcher"
    echo "  shell        - Open container shell"
    echo "  logs         - Show container logs"
    echo "  status       - Show container and mount status"
    echo "  clean        - Remove containers and volumes (destructive!)"
    echo ""
    echo "Workflow:"
    echo "  1. './dev.sh start' - Start container"
    echo "  2. Edit agents locally"
    echo "  3. './dev.sh deploy' - Push changes to container"
    echo "  4. './dev.sh claude' - Test with Claude"
    echo ""
    echo "Step 1 Goal: Proof of Concept - Generate a system spec through AI conversation"
    ;;
esac