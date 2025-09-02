# NoApp Cleanup Plan

## Files to Remove
```bash
# Development/demo files no longer needed
rm agent-orchestrator.sh       # Demo only  
rm git-auto-commit.sh          # Redundant - functionality in git-hooks
rm setup.sh                    # One-time setup, not needed after initial setup
```

## Files to Keep/Move
```bash
mkdir -p devdoc                         # Development documentation
mv conversation.txt devdoc/             # Keep for reference
echo "devdoc/" >> .gitignore           # Don't track in git
```

## dev.sh Simplification

### From 16 commands to 6 core commands:

| Keep | Purpose |
|------|---------|
| start | Start container and open shell |
| stop | Stop container |
| claude | Start Claude Code session |
| deploy | Deploy agents to container |
| status | Show container and config status |
| clean | Remove containers and volumes |

### Removed Commands:
- **restart** - Unnecessary (stop + start)
- **claude-agents** - Demo only (with orchestrator)
- **claude-debug** - Merged into status
- **git-init/status/watch** - Over-engineering for MVP
- **shell** - Redundant with start
- **logs** - Rarely used
- **update** - Complex watch, manual deploy sufficient
- **setup** - One-time, document in README

## Benefits:
1. **Cleaner codebase** - Remove 4 files (~25KB)
2. **Simpler dev.sh** - From 477 to ~200 lines
3. **Focused functionality** - Essential operations only
4. **Easier maintenance** - Less code to maintain
5. **Clear purpose** - Production-ready, not demo-heavy

## Implementation:
1. Backup current state
2. Remove demo/development files
3. Simplify dev.sh to core commands
4. Update README with setup instructions
5. Test all remaining functionality