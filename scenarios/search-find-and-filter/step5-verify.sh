#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w4s1_lab/critical_hits.txt ]; then
    echo "Missing /root/w4s1_lab/critical_hits.txt"
    exit 1
fi

if ! grep -q 'my app\.log' /root/w4s1_lab/critical_hits.txt; then
    echo "Expected critical_hits.txt to include matches from 'my app.log'. Did you use -print0 and xargs -0?"
    exit 1
fi

if ! grep -q 'access\.log' /root/w4s1_lab/critical_hits.txt || ! grep -q 'error\.log' /root/w4s1_lab/critical_hits.txt; then
    echo "Expected critical_hits.txt to include matches from access.log and error.log."
    exit 1
fi

HIT_COUNT=$(wc -l < /root/w4s1_lab/critical_hits.txt | tr -d '[:space:]')
if [ "$HIT_COUNT" != "5" ]; then
    echo "Expected 5 matching lines in critical_hits.txt (found $HIT_COUNT)."
    exit 1
fi

echo "Task 4 (Combining find, xargs, and grep) verified successfully!"
exit 0
