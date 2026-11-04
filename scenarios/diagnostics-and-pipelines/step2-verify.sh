#!/usr/bin/env bash
# Step 2 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /tmp/diag_summary.txt ]; then
    echo "Diagnostic summary /tmp/diag_summary.txt not found. Did you redirect df and free output to /tmp/diag_summary.txt?"
    exit 1
fi

if ! grep -qi "Filesystem" /tmp/diag_summary.txt || ! grep -qi "Mem:" /tmp/diag_summary.txt; then
    echo "/tmp/diag_summary.txt is missing expected 'df -h' or 'free -h' headers. Make sure you used '>' for the first and '>>' to append the second."
    exit 1
fi

echo "Hands-On Practice 1: System Diagnostics successfully verified!"
exit 0

