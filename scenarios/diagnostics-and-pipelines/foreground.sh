#!/usr/bin/env bash
# ==============================================================================
# Foreground script for Killercoda
# Scenario: diagnostics-and-pipelines (Week 1, Session II)
# ==============================================================================

# Wait for background initialization to settle (up to 60s timeout)
echo "Initializing Jarvis Club secure sandbox..."
for i in {1..120}; do
    if [ -f /tmp/.background_finished ]; then
        break
    fi
    sleep 0.5
done

# Wait up to 10 seconds for club-gate if asset injection is settling
for i in {1..20}; do
    if command -v club-gate >/dev/null 2>&1; then
        break
    fi
    sleep 0.5
done

# Clean the terminal screen so the gate starts fresh
clear

# Run the authentication gate immediately with login command
if command -v club-gate >/dev/null 2>&1; then
    club-gate login
else
    echo "Notice: Initialization is finishing in the background."
    echo "When ready, authenticate your session by running: club-gate login"
fi
