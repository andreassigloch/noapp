# NoApp - AI Systems Engineering

An AI-powered system for structured specification development using specialized agents.

## Three Simple Workflows

### 1. First Time Setup
```bash
cp .env.template .env    # Add your API key
./noapp.sh init         # Initialize everything
./noapp.sh start        # Begin working
```

### 2. Daily Work
```bash
./noapp.sh start        # Start working session
# ... do your work in Claude ...
./noapp.sh stop         # End session
```

### 3. Update Configuration
```bash
# Edit agents locally
vim agents/new-agent.md
./noapp.sh deploy       # Deploy changes
# Continue working - no restart needed
```

## Available Commands
- `./noapp.sh init` - First-time setup (once only)
- `./noapp.sh start` - Start work session
- `./noapp.sh stop` - End work session  
- `./noapp.sh deploy` - Deploy agent changes
- `./noapp.sh clean` - Complete reset

## What You Get
- **4 Specialized AI Agents**: discovery, test, system-architect, safety
- **Systems Engineering Focus**: Industrial, mechanical, electrical systems
- **Version Control**: Git integration with auto-commit
- **Sandboxed Environment**: Docker-based security
- **File Persistence**: Your specs saved to `specs/` directory

## Requirements
- Docker and docker-compose
- API key for Claude

## Getting Started
1. Clone this repository
2. Copy `.env.template` to `.env` and add your API key
3. Run `./noapp.sh init` to initialize the system
4. Run `./noapp.sh start` to begin working

See `WORKFLOW.md` for detailed usage instructions.
