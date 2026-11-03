#!/usr/bin/env bash
# ==============================================================================
# IITM Jarvis Linux Club - Killercoda Secure Lab Provisioner
# Place this in Killercoda scenario's background.sh (runs before student terminal attaches)
# ==============================================================================
set -e

REPO_RAW_URL="https://jarvis-linux-club.vercel.app"

echo "[*] Initializing secure Jarvis Linux Club CLI..."

# 1. Download the C source to a temporary file
curl -fsSL "${REPO_RAW_URL}/killercoda/club-cli.c" -o /tmp/club-cli.c

# 2. Compile to a stripped, optimized native binary
gcc -O2 -s /tmp/club-cli.c -o /usr/local/bin/club-cli

# 3. Immediately delete the C source code so no text remains on disk
rm -f /tmp/club-cli.c

# 4. Create symlinks for both commands
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-gate
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-submit
chmod 755 /usr/local/bin/club-cli

# 5. Clean up any leftover .sh test or verification scripts
rm -f /root/.jarvis/*.sh 2>/dev/null || true
mkdir -p /root/.jarvis
chmod 700 /root/.jarvis

echo "[✔] Secure Jarvis Lab CLI provisioned successfully."
