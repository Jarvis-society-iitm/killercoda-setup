#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda
# Scenario: packages-and-permissions (Week 2, Session I)
# ==============================================================================
set -e

# Update packages and install dependencies
apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq gcc curl jq sudo >/dev/null 2>&1

# Compile the secure stripped CLI binary
if [ -f "/tmp/club-cli.c" ]; then
    gcc -O2 -s /tmp/club-cli.c -o /usr/local/bin/club-cli
    rm -f /tmp/club-cli.c
else
    curl -fsSL https://jarvis-linux-club.vercel.app/killercoda/setup.sh | bash
fi

# Point club-gate, club-submit, and club-login to the compiled binary
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-gate
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-submit
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-login
chmod 755 /usr/local/bin/club-cli

# Secure session directory and store the scenario slug
mkdir -p /root/.jarvis
chmod 700 /root/.jarvis
echo "packages-and-permissions" > /root/.jarvis/lab_slug
chmod 600 /root/.jarvis/lab_slug
rm -f /root/.jarvis/*.sh 2>/dev/null || true

# Signal ready for foreground.sh
touch /tmp/.background_finished
