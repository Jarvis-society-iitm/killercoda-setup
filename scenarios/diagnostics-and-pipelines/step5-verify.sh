#!/usr/bin/env bash
# Step 5 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

TARGET_FILE="$HOME/system_specs.txt"
if [ ! -f "$TARGET_FILE" ] && [ -f "/root/system_specs.txt" ]; then
    TARGET_FILE="/root/system_specs.txt"
fi

if [ ! -f "$TARGET_FILE" ]; then
    echo "File system_specs.txt not found in your home directory ($HOME). Did you generate it using redirection and appending?"
    exit 1
fi

if ! grep -qi "Architecture:" "$TARGET_FILE" && ! grep -qi "CPU(s):" "$TARGET_FILE"; then
    echo "system_specs.txt is missing lscpu information."
    exit 1
fi

if ! grep -qi "Mem:" "$TARGET_FILE"; then
    echo "system_specs.txt is missing free -h information."
    exit 1
fi

SNAPSHOT_FILE="$HOME/system_snapshot.txt"
if [ ! -f "$SNAPSHOT_FILE" ] && [ -f "/root/system_snapshot.txt" ]; then
    SNAPSHOT_FILE="/root/system_snapshot.txt"
fi

if [ ! -f "$SNAPSHOT_FILE" ]; then
    echo "File system_snapshot.txt not found in your home directory. Please build the hardware snapshot (Task 7) using sequential appending."
    exit 1
fi

echo "=========================================================="
echo "  Week 1 Session II Lab Verified Successfully!            "
echo "  Run 'club-submit' in your terminal to claim your XP!    "
echo "=========================================================="
exit 0

