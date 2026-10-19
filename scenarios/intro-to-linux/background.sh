#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda
# Runs silently on instance boot before foreground terminal is exposed.
# ==============================================================================

# Update packages and install dependencies
apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq curl jq tree sudo >/dev/null 2>&1

# Install Jarvis Club scripts into global PATH
mkdir -p /usr/local/bin /root/.jarvis

# Ensure permissions on Jarvis Club tools
chmod +x /usr/local/bin/club-gate /usr/local/bin/club-submit 2>/dev/null || true

# Signal ready
touch /tmp/.background_finished

