#!/usr/bin/env bash
# Step 2 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /tmp/nav_done.txt ]; then
    echo "Navigation marker /tmp/nav_done.txt not found. Did you run 'pwd > /tmp/nav_done.txt' in your home folder?"
    exit 1
fi

RECORDED_PATH=$(cat /tmp/nav_done.txt 2>/dev/null | tr -d '[:space:]')
if [ "$RECORDED_PATH" != "/root" ] && [ "$RECORDED_PATH" != "$HOME" ]; then
    echo "Expected /tmp/nav_done.txt to contain home directory path (/root or $HOME), but found '$RECORDED_PATH'."
    exit 1
fi

echo "Hands-On Practice 1: Navigation successfully verified!"
exit 0
