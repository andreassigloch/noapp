#!/bin/bash
# NoApp Git Auto-Commit Script
# Watches specs directory and auto-commits changes

WORKSPACE="/workspace"
SPECS_DIR="$WORKSPACE/specs"
WATCH_DIRS="$SPECS_DIR $WORKSPACE/agents"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_message() {
    echo -e "${BLUE}[$(date '+%H:%M:%S')] [GIT-WATCHER]${NC} $1"
}

# Function to commit changes
auto_commit() {
    local file_path=$1
    local change_type=$2
    
    cd "$WORKSPACE"
    
    # Check if there are any changes
    if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
        
        # Add all changes in specs and agents
        git add specs/ agents/ 2>/dev/null
        
        # Generate commit message
        local filename=$(basename "$file_path")
        local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        
        # Detect type of change
        if git diff --cached --name-only | grep -q "$filename"; then
            if git ls-files --error-unmatch "$file_path" >/dev/null 2>&1; then
                change_type="Updated"
            else
                change_type="Created"
            fi
        fi
        
        # Create meaningful commit message
        local commit_msg="$change_type: $filename

Auto-commit triggered by file change
Timestamp: $timestamp
Path: $file_path

🤖 Generated with NoApp System
Author: andreas@siglochconsulting"

        # Commit the changes
        if git commit -m "$commit_msg"; then
            log_message "✅ Auto-committed changes to $filename"
            
            # Show summary
            echo -e "${GREEN}📊 Commit Summary:${NC}"
            git log --oneline -1
            git diff --stat HEAD~1 HEAD
        else
            log_message "❌ Failed to commit changes to $filename"
        fi
    fi
}

# Function to monitor file changes
watch_files() {
    log_message "🔍 Starting file watcher for specs/ and agents/ directories..."
    log_message "📁 Monitoring: $WATCH_DIRS"
    
    # Initial commit of existing files
    if [ "$(ls -A $SPECS_DIR 2>/dev/null)" ]; then
        log_message "📝 Creating initial commit for existing files..."
        auto_commit "$SPECS_DIR" "Initial"
    fi
    
    # Use inotifywait if available, otherwise fall back to polling
    if command -v inotifywait >/dev/null 2>&1; then
        log_message "✅ Using inotify for real-time monitoring"
        
        inotifywait -m -r -e modify,create,delete,move \
            --format '%w%f %e' \
            $WATCH_DIRS 2>/dev/null | \
        while read file event; do
            # Filter for relevant file types
            if [[ "$file" =~ \.(md|txt|json)$ ]]; then
                log_message "📝 Detected $event: $(basename $file)"
                sleep 1  # Small delay to ensure file is fully written
                auto_commit "$file" "$event"
            fi
        done
    else
        log_message "⚠️  inotifywait not available, using polling mode"
        log_message "💡 Install inotify-tools for better performance"
        
        # Polling fallback
        local last_hash=""
        while true do
            current_hash=$(find $WATCH_DIRS -type f \( -name "*.md" -o -name "*.txt" -o -name "*.json" \) -exec md5sum {} \; 2>/dev/null | md5sum)
            
            if [ "$current_hash" != "$last_hash" ]; then
                if [ -n "$last_hash" ]; then
                    log_message "📝 Changes detected, checking for commits..."
                    auto_commit "$SPECS_DIR" "Modified"
                fi
                last_hash="$current_hash"
            fi
            
            sleep 5  # Check every 5 seconds
        done
    fi
}

# Function to show git status and history
show_status() {
    cd "$WORKSPACE"
    echo -e "${BLUE}📊 Git Repository Status:${NC}"
    echo
    
    echo -e "${YELLOW}Working Directory:${NC}"
    git status --short
    echo
    
    echo -e "${YELLOW}Recent Commits:${NC}"
    git log --oneline -10
    echo
    
    echo -e "${YELLOW}Repository Statistics:${NC}"
    echo "Total commits: $(git rev-list --all --count)"
    echo "Tracked files: $(git ls-files | wc -l)"
    echo "Repository size: $(du -sh .git | cut -f1)"
}

# Main execution
case "${1:-watch}" in
    watch)
        echo -e "${BLUE}═══════════════════════════════════════${NC}"
        echo -e "${BLUE}  NoApp Git Auto-Commit Watcher${NC}"
        echo -e "${BLUE}═══════════════════════════════════════${NC}"
        echo
        watch_files
        ;;
    
    status)
        show_status
        ;;
    
    commit)
        shift
        auto_commit "${1:-$SPECS_DIR}" "Manual"
        ;;
    
    log)
        cd "$WORKSPACE"
        git log --oneline --graph --decorate --all
        ;;
    
    *)
        echo "NoApp Git Auto-Commit Watcher"
        echo
        echo "Usage: $0 {watch|status|commit|log}"
        echo
        echo "Commands:"
        echo "  watch   - Start file watcher (default)"
        echo "  status  - Show git status and statistics"
        echo "  commit  - Manual commit trigger"
        echo "  log     - Show git history"
        ;;
esac