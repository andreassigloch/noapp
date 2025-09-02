# NoApp - AI Systems Engineering

An AI-powered system for structured specification development using specialized agents.

## Three Simple Workflows

### 1. First Time Setup
```bash
cp .env.template .env    # Add your API key
./noapp init            # Initialize everything
./noapp start           # Begin working
```

### 2. Daily Work
```bash
./noapp start           # Start working session
# ... do your work in Claude ...
./noapp stop            # End session
```

### 3. Update Configuration
```bash
# Edit agents locally
vim agents/new-agent.md
./noapp deploy          # Deploy changes
# Continue working - no restart needed
```

## Available Commands
- `./noapp init` - First-time setup (once only)
- `./noapp start` - Start work session
- `./noapp stop` - End work session  
- `./noapp deploy` - Deploy agent changes
- `./noapp clean` - Complete reset

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
3. Run `./noapp init` to initialize the system
4. Run `./noapp start` to begin working

See `WORKFLOW.md` for detailed usage instructions.
