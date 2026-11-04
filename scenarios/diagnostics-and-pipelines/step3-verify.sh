#!/usr/bin/env bash
# Step 3 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /tmp/stream_test.txt ]; then
    echo "File /tmp/stream_test.txt not found. Please complete Task 1 & 2."
    exit 1
fi

LINE_COUNT=$(wc -l < /tmp/stream_test.txt 2>/dev/null | tr -d '[:space:]')
if [ "$LINE_COUNT" -lt 2 ]; then
    echo "Expected at least 2 lines in /tmp/stream_test.txt. Did you append with '>>'?"
    exit 1
fi

if [ ! -f /tmp/errors.txt ]; then
    echo "File /tmp/errors.txt not found. Did you redirect stderr with 'ls /fake_directory_jarvis 2> errors.txt'?"
    exit 1
fi

if ! grep -qi "cannot access" /tmp/errors.txt && ! grep -qi "No such file" /tmp/errors.txt; then
    echo "/tmp/errors.txt does not contain the expected error message."
    exit 1
fi

if [ ! -f /tmp/combined.log ]; then
    echo "File /tmp/combined.log not found. Did you test combining streams with '2>&1'?"
    exit 1
fi

echo "Hands-On Practice 2: Streams & Redirection successfully verified!"
exit 0
