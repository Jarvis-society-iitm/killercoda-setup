#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda
# Scenario: pipes-logging-and-scripts (Week 4, Session II)
# ==============================================================================
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq >/dev/null 2>&1 || true
apt-get install -y -qq gcc curl jq sudo nano vim >/dev/null 2>&1 || true

if ! id student >/dev/null 2>&1; then
    useradd -m -s /bin/bash student
fi

if [ -f "/tmp/club-cli.c" ]; then
    gcc -O2 -s /tmp/club-cli.c -o /usr/local/bin/club-cli
    rm -f /tmp/club-cli.c
else
    curl -fsSL https://jarvis-linux-club.vercel.app/killercoda/setup.sh | bash
fi

ln -sf /usr/local/bin/club-cli /usr/local/bin/club-gate
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-submit
ln -sf /usr/local/bin/club-cli /usr/local/bin/club-login
chmod 755 /usr/local/bin/club-cli

mkdir -p /root/.jarvis
chmod 700 /root/.jarvis
echo "pipes-logging-and-scripts" > /root/.jarvis/lab_slug
chmod 600 /root/.jarvis/lab_slug
rm -f /root/.jarvis/*.sh 2>/dev/null || true

# Provision Week 4 Session II practice workspace
mkdir -p /root/w4s2_lab

cat << 'LOGEOF' > /root/w4s2_lab/server.log
192.168.1.10 - [25/Nov:14:00:01] GET /index.html 200 1024
10.0.0.5 - [25/Nov:14:01:15] GET /about.html 200 2048
192.168.1.10 - [25/Nov:14:05:00] GET /index.html 200 1024
172.16.0.2 - [25/Nov:14:07:22] GET /admin 403 512
10.0.0.5 - [25/Nov:14:10:05] GET /login 200 800
192.168.1.12 - [25/Nov:14:11:10] GET /missing 404 256
192.168.1.10 - [25/Nov:14:12:01] GET /index.html 200 1024
172.16.0.2 - [25/Nov:14:15:30] POST /login 401 128
LOGEOF

touch /tmp/.background_finished
