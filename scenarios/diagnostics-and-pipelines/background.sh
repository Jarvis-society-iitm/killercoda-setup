#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda
# Scenario: diagnostics-and-pipelines (Week 1, Session II)
# ==============================================================================
set -e

# Update packages and install dependencies
apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq gcc curl jq tree sudo tldr man-db >/dev/null 2>&1

# Compile the secure stripped CLI binary
if [ -f "/tmp/club-cli.c" ]; then
    gcc -O2 -s /tmp/club-cli.c -o /usr/local/bin/club-cli
    rm -f /tmp/club-cli.c
else
    curl -fsSL https://jarvis-linux-club.vercel.app/killercoda/setup.sh | bash
fi

# Point club-gate and club-submit to the compiled binary
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-gate
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-submit
chmod 755 /usr/local/bin/club-cli

# Secure session directory and clean any leftover plaintext scripts
mkdir -p /root/.jarvis
chmod 700 /root/.jarvis
rm -f /root/.jarvis/*.sh 2>/dev/null || true

# Signal ready for foreground.sh
touch /tmp/.background_finished
