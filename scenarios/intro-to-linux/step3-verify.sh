#!/usr/bin/env bash
# Step 3 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

SCRIPT="/root/workspace/run.sh"
if [ ! -f "$SCRIPT" ]; then
    echo "Script $SCRIPT does not exist."
    exit 1
fi

if [ ! -x "$SCRIPT" ]; then
    echo "Script $SCRIPT is not executable."
    exit 1
fi

if ! grep -q "JARVIS_ENV=CYBERPUNK" /root/.bashrc 2>/dev/null && [ "$JARVIS_ENV" != "CYBERPUNK" ]; then
    echo "JARVIS_ENV is not configured to CYBERPUNK."
    exit 1
fi

echo "Step 3 validated successfully! Run 'club-submit' to record your completion."
exit 0

