#!/usr/bin/env bash
if [ -f /tmp/.jarvis_unlocked ] && [ -f /root/.jarvis/session.json ]; then
    echo "Authentication verified successfully!"
    exit 0
else
    echo "Terminal is not authenticated. Please run 'club-gate login' in your terminal."
    exit 1
fi
