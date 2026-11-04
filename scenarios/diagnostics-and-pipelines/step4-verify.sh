#!/usr/bin/env bash
# Step 4 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /tmp/bottom_etc.txt ]; then
    echo "File /tmp/bottom_etc.txt not found. Did you run 'ls /etc | sort | tail -n 5 > /tmp/bottom_etc.txt'?"
    exit 1
fi

LINE_COUNT=$(wc -l < /tmp/bottom_etc.txt 2>/dev/null | tr -d '[:space:]')
if [ "$LINE_COUNT" -ne 5 ]; then
    echo "Expected exactly 5 lines in /tmp/bottom_etc.txt, but got $LINE_COUNT."
    exit 1
fi

echo "Hands-On Practice 3: Pipelines & Help Utilities successfully verified!"
exit 0

