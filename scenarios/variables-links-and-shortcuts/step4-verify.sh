#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/hard_link.txt ]; then
    echo "File /root/w3s1_lab/hard_link.txt not found."
    exit 1
fi

if [ ! -L /root/w3s1_lab/soft_link.txt ]; then
    echo "/root/w3s1_lab/soft_link.txt is not a symbolic link. Did you create it with: ln -s original.txt soft_link.txt ?"
    exit 1
fi

TARGET=$(readlink /root/w3s1_lab/soft_link.txt)
if [ "$TARGET" != "original.txt" ] && [ "$TARGET" != "/root/w3s1_lab/original.txt" ]; then
    echo "Expected soft_link.txt to point to 'original.txt', but points to '$TARGET'."
    exit 1
fi

if [ ! -f /root/w3s1_lab/original.txt ]; then
    echo "File /root/w3s1_lab/original.txt not found."
    exit 1
fi

ORIG_INODE=$(stat -c '%i' /root/w3s1_lab/original.txt 2>/dev/null)
HARD_INODE=$(stat -c '%i' /root/w3s1_lab/hard_link.txt 2>/dev/null)
SOFT_INODE=$(stat -c '%i' /root/w3s1_lab/soft_link.txt 2>/dev/null)

if [ "$ORIG_INODE" != "$HARD_INODE" ]; then
    echo "Hard link verification failed: original.txt and hard_link.txt must share the same inode number."
    exit 1
fi

if [ "$ORIG_INODE" == "$SOFT_INODE" ]; then
    echo "Soft link verification failed: symbolic links must have a distinct inode number."
    exit 1
fi

if [ ! -f /root/w3s1_lab/links_status.txt ]; then
    echo "/root/w3s1_lab/links_status.txt not found. Please run: ls -li /root/w3s1_lab/ > /root/w3s1_lab/links_status.txt"
    exit 1
fi

echo "Task 3 (Inodes, Hard Links & Symbolic Links) verified successfully!"
exit 0
