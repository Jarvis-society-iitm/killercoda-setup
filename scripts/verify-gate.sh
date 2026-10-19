#!/usr/bin/env bash
# ==============================================================================
# Helper to enforce gating in individual Killercoda step verify scripts
# ==============================================================================

GATE_PASSED_FILE="/tmp/.jarvis_unlocked"

if [ ! -f "$GATE_PASSED_FILE" ]; then
    echo "Access Denied: You must first authenticate using your Jarvis Club credentials."
    exit 1
fi

exit 0

