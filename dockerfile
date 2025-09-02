# NoApp - Minimal Development Environment for Step 1
FROM node:20-alpine

# Install minimal system dependencies
RUN apk add --no-cache \
    git \
    bash \
    curl \
    vim \
    && rm -rf /var/cache/apk/*

# Create app user and directories
RUN addgroup -g 1001 -S appuser && \
    adduser -S appuser -u 1001 -G appuser

# Set up workspace
WORKDIR /workspace
RUN chown appuser:appuser /workspace

# Install Claude Code as root before switching user
RUN npm install -g @anthropic-ai/claude-code

# Switch to non-root user
USER appuser

# Create Claude Code directory structure
RUN mkdir -p /home/appuser/.claude/agents && \
    mkdir -p /home/appuser/.claude/commands

# Set environment
ENV CLAUDE_CONFIG_PATH=/home/appuser/.claude
ENV PROJECT_ROOT=/workspace

# Default command
CMD ["bash"]