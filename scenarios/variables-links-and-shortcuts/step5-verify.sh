#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/readline_done.txt ]; then
    echo "File /root/w3s1_lab/readline_done.txt not found. Please complete the Readline practice and run: echo 'Readline practice completed' > /root/w3s1_lab/readline_done.txt"
    exit 1
fi

echo "Task 4 (Readline Shortcuts) verified successfully!"
exit 0
