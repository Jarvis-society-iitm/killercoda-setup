#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/deep/folder/notes.txt ]; then
    echo "Target file /root/w3s1_lab/deep/folder/notes.txt not found."
    exit 1
fi

if [ ! -L /root/w3s1_lab/quick_notes.txt ]; then
    echo "/root/w3s1_lab/quick_notes.txt is not a symbolic link."
    exit 1
fi

TARGET=$(readlink /root/w3s1_lab/quick_notes.txt)
if [ "$TARGET" != "/root/w3s1_lab/deep/folder/notes.txt" ]; then
    echo "Expected quick_notes.txt to point to '/root/w3s1_lab/deep/folder/notes.txt', but points to '$TARGET'."
    exit 1
fi

if [ ! -L /root/w3s1_lab/deep_link ]; then
    echo "/root/w3s1_lab/deep_link is not a symbolic link."
    exit 1
fi

if [ ! -f /root/w3s1_lab/link_target.txt ]; then
    echo "/root/w3s1_lab/link_target.txt not found. Please run: readlink /root/w3s1_lab/quick_notes.txt > /root/w3s1_lab/link_target.txt"
    exit 1
fi

echo "Task 3 (Spotting Links & readlink) verified successfully!"
exit 0
