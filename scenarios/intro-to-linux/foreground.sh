#!/usr/bin/env bash
# ==============================================================================
# Foreground script for Killercoda
# Runs immediately when the student's interactive terminal opens.
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

# Run the authentication gate immediately
LAB_SLUG="linux-basics-101"
club-gate "$LAB_SLUG"

