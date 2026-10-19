#!/usr/bin/env bash
# Step 2 Verification: Check apt package installation

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "[✖] Terminal is not authenticated."
    exit 1
fi

if ! command -v htop >/dev/null 2>&1; then
    echo "[✖] 'htop' is not installed. Run 'apt-get install -y htop tree'."
    exit 1
fi

if ! command -v tree >/dev/null 2>&1; then
    echo "[✖] 'tree' is not installed. Run 'apt-get install -y htop tree'."
    exit 1
fi

echo "[✔] Both htop and tree are installed and functional!"
exit 0

