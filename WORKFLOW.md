# NoApp Workflow Guide

## Scenario 1: First Time Setup
**"I want to create the docker with claude etc first time"**

```bash
# 1. Clone/setup project
cd /Users/andreas/Documents/Projekte/dev/aise/noapp

# 2. Copy and configure API key
cp .env.template .env
# Edit .env and add your Anthropic API key

# 3. Initialize and start
./noapp init   # Creates directories, builds container, deploys agents
./noapp start  # Start container and Claude
```

## Scenario 2: Update Configuration
**"It's installed, I want to change something, like adding agents"**

```bash
# 1. Edit your agents locally
vim agents/new-agent.md

# 2. Deploy changes to running container
./noapp deploy

# 3. Continue working in Claude
# (Claude session continues with new agents available)
```

## Scenario 3: Daily Work
**"Just want to jump into Docker and start working"**

```bash
# One command to start working
./noapp start

# When done
./noapp stop
```

## Essential Commands (only 5!)

| Command | Purpose | When to use |
|---------|---------|-------------|
| `init` | First-time setup | Once, when starting fresh |
| `start` | Start container & Claude | Daily, begin work session |
| `stop` | Stop container | Daily, end work session |
| `deploy` | Update agents/config | When you modify agents |
| `clean` | Remove everything | Complete reset needed |

## Quick Reference

```bash
./noapp         # Shows available commands
./noapp init    # First time only
./noapp start   # Daily work
./noapp deploy  # After changes
./noapp stop    # End session
./noapp clean   # Nuclear option
```

## What Happens Under the Hood

### `init` (First time)
1. Creates specs/ and agents/ directories
2. Builds Docker container
3. Deploys all agents and configuration
4. Sets up git hooks if needed
5. Ready to work!

### `start` (Daily)
1. Starts Docker container if not running
2. Opens Claude Code session
3. Shows available agents reminder
4. You're working!

### `deploy` (Updates)
1. Copies agents/*.md to container
2. Updates Claude configuration
3. Updates git hooks
4. No restart needed!

### `stop` (End work)
1. Saves any work
2. Stops container cleanly
3. Preserves state for next session

### `clean` (Reset)
1. Asks for confirmation
2. Removes containers
3. Removes volumes
4. Fresh start possible