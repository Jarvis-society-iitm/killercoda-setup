#!/usr/bin/env bash
# ==============================================================================
# Foreground script for Killercoda
# Scenario: packages-and-permissions (Week 2, Session I)
# ==============================================================================

# Wait for background initialization to settle
echo "Initializing Jarvis Club secure sandbox..."
while [ ! -f /tmp/.background_finished ]; do
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
club-gate login
