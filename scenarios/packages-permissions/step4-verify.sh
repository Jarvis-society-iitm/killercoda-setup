#!/usr/bin/env bash
# Step 4 Verification: Check PATH persistence and custom script

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "[✖] Terminal is not authenticated."
    exit 1
fi

SCRIPT="/root/scripts/sysping"
if [ ! -f "$SCRIPT" ]; then
    echo "[✖] $SCRIPT does not exist."
    exit 1
fi

if [ ! -x "$SCRIPT" ]; then
    echo "[✖] $SCRIPT is not executable."
    exit 1
fi

# Check ~/.bashrc persistence
if ! grep -q "/root/scripts" /root/.bashrc 2>/dev/null && ! grep -q "\$HOME/scripts" /root/.bashrc 2>/dev/null && ! grep -q "~/scripts" /root/.bashrc 2>/dev/null; then
    echo "[✖] /root/scripts was not added to /root/.bashrc for PATH persistence."
    exit 1
fi

echo "[✔] PATH persistence and sysping script verified! Now run 'club-submit' to record your completion."
exit 0

