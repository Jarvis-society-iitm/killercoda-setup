#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w4s1_lab/all_logs.txt ]; then
    echo "Missing /root/w4s1_lab/all_logs.txt"
    exit 1
fi

LOG_COUNT=$(wc -l < /root/w4s1_lab/all_logs.txt | tr -d '[:space:]')
if [ "$LOG_COUNT" != "5" ]; then
    echo "Expected all_logs.txt to list all 5 .log files (found $LOG_COUNT)."
    exit 1
fi

if [ ! -f /root/w4s1_lab/large_files.txt ] || ! grep -q 'big_dump\.bin' /root/w4s1_lab/large_files.txt; then
    echo "Expected large_files.txt to contain big_dump.bin."
    exit 1
fi

if [ ! -f /root/w4s1_lab/top_dirs.txt ]; then
    echo "Missing /root/w4s1_lab/top_dirs.txt"
    exit 1
fi

if grep -q 'archive' /root/w4s1_lab/top_dirs.txt || ! grep -q '/root/w4s1_lab/logs' /root/w4s1_lab/top_dirs.txt; then
    echo "Expected top_dirs.txt to include /root/w4s1_lab/logs and /root/w4s1_lab/notes, but NOT archive (depth 2)."
    exit 1
fi

echo "Task 3 (Locating files with find) verified successfully!"
exit 0
