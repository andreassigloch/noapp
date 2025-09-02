#!/bin/bash
# NoApp Complete Setup Script
# Run this in ~/Dokumente/Projekte/dev/aise/noapp

set -e

echo "🚀 NoApp Step 1 - Complete Setup"
echo "================================"

# Create project structure
echo "📁 Creating project structure..."
mkdir -p specs agents

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose not found. Please install docker-compose first."
    exit 1
fi

echo "✅ Docker and docker-compose found"

# Create .env if not exists
if [ ! -f .env ]; then
    echo "📋 Creating .env file..."
    cp .env.template .env
    echo "❗ IMPORTANT: Edit .env and add your Anthropic API key!"
    echo "   Get your key from: https://console.anthropic.com/"
    echo ""
    read -p "Press Enter after you've added your API key to .env..."
fi

# Verify API key
if grep -q "your_anthropic_api_key_here" .env; then
    echo "❌ Please update .env with your actual Anthropic API key!"
    echo "   Edit .env and replace 'your_anthropic_api_key_here' with your real key"
    exit 1
fi

echo "✅ API key configured"

# Make scripts executable
chmod +x dev.sh

# Create initial agents if they don't exist
if [ ! -f agents/discovery-agent.md ]; then
    echo "🤖 Creating example agents..."
    
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

    echo "✅ Created discovery-agent.md"
fi

# Create README
cat > README.md << 'EOF'
# NoApp - Step 1 Development

Iterative system specification development through AI agents.

## Quick Start

1. **Setup:** `./setup.sh` (you just ran this!)
2. **Start Development:** `./dev.sh start`  
3. **Begin Conversation:** Inside container, run `claude`

## Goal - Step 1

Generate a complete system specification through structured AI conversation.

## Directory Structure

```
noapp/
├── specs/              # Generated specifications (output)
├── agents/             # Agent definitions (development)
├── dev.sh             # Development helper script
└── .env               # Environment configuration
```

## Development Workflow

```bash
./dev.sh start         # Start container and shell
# In container:
claude                 # Start AI conversation
```

## Success Criteria

- [ ] Container starts successfully
- [ ] Claude uses specialized agents automatically  
- [ ] Complete, implementable specification generated
- [ ] Clear value demonstrated vs. standard Claude
EOF

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "📋 Summary:"
echo "   ✅ Project structure created"
echo "   ✅ Docker configuration ready"
echo "   ✅ Example agents created"
echo "   ✅ Scripts made executable"
echo ""
echo "🚀 Next Steps:"
echo "   1. Run: ./dev.sh start"
echo "   2. Inside container: claude"  
echo "   3. Start your first spec conversation!"
echo ""
echo "💡 Tips:"
echo "   - Use './dev.sh status' to check setup"
echo "   - Use './dev.sh logs' for debugging"
echo "   - Generated specs appear in ./specs/"