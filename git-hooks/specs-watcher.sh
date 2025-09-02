#!/bin/bash
# NoApp Specs Directory Watcher with Git Auto-Commit
# This runs as a background service and auto-commits changes

WORKSPACE="/workspace"
SPECS_DIR="$WORKSPACE/specs"
AGENTS_DIR="$WORKSPACE/agents"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${BLUE}[$(date '+%H:%M:%S')] [SPECS-WATCHER]${NC} $1"
}

# Auto-commit function
auto_commit() {
    local changed_file="$1"
    cd "$WORKSPACE"
    
    # Only proceed if there are actual changes
    if ! git diff --quiet HEAD -- specs/ agents/ 2>/dev/null; then
        
        # Stage only specs and agents directories  
        git add specs/ agents/ 2>/dev/null
        
        # Check if there's something to commit
        if ! git diff --cached --quiet; then
            
            local filename=$(basename "$changed_file")
            local change_type="Updated"
            
            # Check if it's a new file
            if ! git ls-files --error-unmatch "$changed_file" >/dev/null 2>&1; then
                change_type="Created"
            fi
            
            # Generate commit message
            local commit_msg="$change_type: $filename

Auto-commit from specs watcher
File: $changed_file  
Timestamp: $(date '+%Y-%m-%d %H:%M:%S')

🤖 Generated with NoApp System
🔄 Auto-versioning enabled

Co-Authored-By: NoApp System <noapp@siglochconsulting.com>"

            # Commit with the hooks
            if git commit -m "$commit_msg"; then
                log "✅ Auto-committed: $change_type $filename"
                
                # Show brief summary
                git log --oneline -1 | sed 's/^/   /'
            else
                log "❌ Failed to commit $filename"
            fi
        fi
    fi
}

# Main watcher loop  
log "🔍 Starting specs directory watcher..."
log "📁 Monitoring: $SPECS_DIR and $AGENTS_DIR"

# Install inotify-tools if not available
if ! command -v inotifywait >/dev/null 2>&1; then
    log "📦 Installing inotify-tools..."
    apt-get update && apt-get install -y inotify-tools
fi

# Use inotify for real-time monitoring
inotifywait -m -r -e close_write,moved_to,create \
    --format '%w%f %e' \
    "$SPECS_DIR" "$AGENTS_DIR" 2>/dev/null | \
while read filepath event; do
    
    # Only process markdown and text files
    if [[ "$filepath" =~ \.(md|txt|json)$ ]]; then
        log "📝 Detected $event: $(basename "$filepath")"
        
        # Small delay to ensure file is fully written
        sleep 2
        
        # Auto-commit the changes
        auto_commit "$filepath"
    fi
done