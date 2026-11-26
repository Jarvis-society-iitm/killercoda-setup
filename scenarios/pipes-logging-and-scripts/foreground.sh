#!/usr/bin/env bash
# ==============================================================================
# Foreground script for Killercoda
# Scenario: pipes-logging-and-scripts (Week 4, Session II)
# ==============================================================================

echo "Initializing Jarvis Club secure sandbox..."
while [ ! -f /tmp/.background_finished ]; do
    sleep 0.5
done

for i in {1..20}; do
    if command -v club-gate >/dev/null 2>&1; then
        break
    fi
    sleep 0.5
done

clear
club-gate login
