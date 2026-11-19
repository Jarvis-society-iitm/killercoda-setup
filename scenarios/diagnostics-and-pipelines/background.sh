#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda
# Scenario: diagnostics-and-pipelines (Week 1, Session II)
# ==============================================================================
set -e

# Update packages and install dependencies
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq >/dev/null 2>&1 || true
apt-get install -y -qq gcc curl jq tree sudo man-db >/dev/null 2>&1 || true

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

# Provide a lightweight tldr helper for practice if requested
cat << 'TLDR_EOF' > /usr/local/bin/tldr
#!/usr/bin/env bash
if [ "$1" = "df" ]; then
    echo -e "df\n\nGive an overview of the filesystem disk space usage.\nMore information: https://www.gnu.org/software/coreutils/df.\n\n- Display all filesystems and their disk usage in human-readable units:\n    df -h\n\n- Display total disk usage across all filesystems:\n    df -h --total"
    exit 0
fi
man -f "$@" 2>/dev/null || man "$@"
TLDR_EOF
chmod 755 /usr/local/bin/tldr

# Secure session directory and store the scenario slug
mkdir -p /root/.jarvis
chmod 700 /root/.jarvis
echo "diagnostics-and-pipelines" > /root/.jarvis/lab_slug
chmod 600 /root/.jarvis/lab_slug
rm -f /root/.jarvis/*.sh 2>/dev/null || true

# Signal ready for foreground.sh
touch /tmp/.background_finished
