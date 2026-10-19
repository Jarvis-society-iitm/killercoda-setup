#!/usr/bin/env bash
# Step 1 Verification: Checks if student has authenticated through the gate
if [ -f /tmp/.jarvis_unlocked ] && [ -f /root/.jarvis/session.json ]; then
    echo "Authentication verified."
    exit 0
else
    echo "Terminal is not authenticated. Please complete the login prompt in your terminal."
    exit 1
fi

