#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/history_sample.txt ]; then
    echo "File /root/w3s1_lab/history_sample.txt not found. Please run: history | tail -n 15 > /root/w3s1_lab/history_sample.txt"
    exit 1
fi

if [ ! -f /root/w3s1_lab/hard_link.txt ] || [ ! -L /root/w3s1_lab/soft_link.txt ]; then
    echo "Links in /root/w3s1_lab are missing or incomplete."
    exit 1
fi

echo "Task 4 (Fast Navigation & Readline Shortcuts) verified successfully!"
exit 0
