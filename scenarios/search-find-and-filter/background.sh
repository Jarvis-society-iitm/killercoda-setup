#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda
# Scenario: search-find-and-filter (Week 4, Session I)
# ==============================================================================
set -e

# Update packages and install dependencies
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq >/dev/null 2>&1 || true
apt-get install -y -qq gcc curl jq sudo nano vim >/dev/null 2>&1 || true

# Create demo student user for practice
if ! id student >/dev/null 2>&1; then
    useradd -m -s /bin/bash student
fi

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
echo "search-find-and-filter" > /root/.jarvis/lab_slug
chmod 600 /root/.jarvis/lab_slug
rm -f /root/.jarvis/*.sh 2>/dev/null || true

# Provision Week 4 Session I practice workspace
mkdir -p /root/w4s1_lab/logs/archive /root/w4s1_lab/notes

cat << 'LOGEOF' > /root/w4s1_lab/access.log
192.168.1.10 - [23/Nov] "GET /index.html" 200 1024
10.0.0.5 - [23/Nov] "POST /login" 401 512
192.168.1.11 - [23/Nov] "GET /logo.png" 200 4096
172.16.0.2 - [24/Nov] "GET /admin" 403 128
10.0.0.5 - [24/Nov] "GET /missing" 404 256
192.168.1.10 - [24/Nov] "GET /index.html" 200 1024
10.0.0.99 - [24/Nov] "GET /api/data" 500 0
172.16.0.2 - [25/Nov] "GET /styles.css" 200 2048
LOGEOF

cat << 'ERREOF' > /root/w4s1_lab/logs/error.log
[24/Nov] ERROR 500 database connection timeout on /api/data
[24/Nov] WARN 404 asset /favicon.ico not found
[25/Nov] INFO 200 healthcheck ok
ERREOF

cat << 'APPEOF' > /root/w4s1_lab/logs/app.log
[25/Nov] INFO 200 server started on port 8080
[25/Nov] INFO 200 worker pool ready
APPEOF

cat << 'SPACEEOF' > "/root/w4s1_lab/logs/my app.log"
[25/Nov] ERROR 500 unhandled exception in payment service
[25/Nov] INFO 200 retry succeeded
SPACEEOF

cat << 'OLDEOF' > /root/w4s1_lab/logs/archive/old.log
[10/Nov] INFO 200 archived log entry
OLDEOF

cat << 'TXTEOF' > /root/w4s1_lab/notes/readme.txt
Week 4 Lab Notes: Search, Find, and Filter.
TXTEOF

truncate -s 2M /root/w4s1_lab/logs/big_dump.bin

# Signal ready for foreground.sh
touch /tmp/.background_finished
