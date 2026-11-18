#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/test.txt ]; then
    echo "File /root/w3s1_lab/test.txt not found."
    exit 1
fi

if [ ! -f /root/w3s1_lab/hard.txt ]; then
    echo "File /root/w3s1_lab/hard.txt not found."
    exit 1
fi

if [ ! -L /root/w3s1_lab/soft.txt ]; then
    echo "/root/w3s1_lab/soft.txt is not a symbolic link. Did you create it with: ln -s test.txt soft.txt ?"
    exit 1
fi

TEST_INODE=$(stat -c '%i' /root/w3s1_lab/test.txt 2>/dev/null)
HARD_INODE=$(stat -c '%i' /root/w3s1_lab/hard.txt 2>/dev/null)
SOFT_INODE=$(stat -c '%i' /root/w3s1_lab/soft.txt 2>/dev/null)

if [ "$TEST_INODE" == "$SOFT_INODE" ]; then
    echo "Symbolic link soft.txt should have a distinct inode, but shares the same inode as test.txt."
    exit 1
fi

if [ -z "$HARD_INODE" ] || [ -z "$SOFT_INODE" ]; then
    echo "Failed to retrieve inode information for hard.txt or soft.txt."
    exit 1
fi

echo "Task 2 (Inodes, Hard vs Symbolic Links) verified successfully!"
exit 0
