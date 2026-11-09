#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

if [ ! -f /root/my_identity.txt ]; then
    echo "/root/my_identity.txt not found. Run: id > /root/my_identity.txt"
    exit 1
fi

if ! grep -qi "uid=" /root/my_identity.txt || ! grep -qi "gid=" /root/my_identity.txt; then
    echo "/root/my_identity.txt is missing expected 'id' command output."
    exit 1
fi

if [ ! -f /root/installed_bins.txt ]; then
    echo "/root/installed_bins.txt not found. Run: ls -l \$(which tree) \$(which htop) > /root/installed_bins.txt"
    exit 1
fi

if ! grep -q "tree" /root/installed_bins.txt || ! grep -q "htop" /root/installed_bins.txt; then
    echo "/root/installed_bins.txt does not contain long listings for both tree and htop."
    exit 1
fi

if [ ! -f /root/dir_modes.txt ]; then
    echo "/root/dir_modes.txt not found. Run: ls -ld /etc /tmp > /root/dir_modes.txt"
    exit 1
fi

echo "Task 2 (Decoding ls -l & Identity Inspection) verified successfully!"
exit 0
