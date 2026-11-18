#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/prompt_snapshot.txt ]; then
    echo "File /root/w3s1_lab/prompt_snapshot.txt not found. Please run: echo \"\$PS1\" > /root/w3s1_lab/prompt_snapshot.txt"
    exit 1
fi

CONTENT=$(cat /root/w3s1_lab/prompt_snapshot.txt)
if ! echo "$CONTENT" | grep -q "\\\t" && ! echo "$CONTENT" | grep -q "32m"; then
    echo "Prompt snapshot does not appear to contain custom timestamp or color formatting."
    exit 1
fi

if ! grep -q "PS1=" /root/.bashrc; then
    echo "Custom PS1 entry not found in /root/.bashrc. Did you persist it using: echo 'PS1=...' >> /root/.bashrc ?"
    exit 1
fi

echo "Task 2 (Customizing and Coloring Prompt PS1) verified successfully!"
exit 0
