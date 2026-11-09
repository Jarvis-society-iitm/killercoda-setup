#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

DEPLOY_SH="/root/permissions_lab/deploy.sh"
if [ ! -f "$DEPLOY_SH" ]; then
    echo "$DEPLOY_SH not found. Please create it in /root/permissions_lab."
    exit 1
fi

if [ ! -x "$DEPLOY_SH" ]; then
    echo "$DEPLOY_SH is not executable! Use: chmod u+x deploy.sh"
    exit 1
fi

SECRETS="/root/permissions_lab/secrets.env"
if [ ! -f "$SECRETS" ]; then
    echo "$SECRETS not found."
    exit 1
fi

SECRETS_PERMS=$(stat -c "%a" "$SECRETS" 2>/dev/null || stat -f "%Lp" "$SECRETS" 2>/dev/null)
# Last two digits must be 00 (no group, no others)
if [[ ! "$SECRETS_PERMS" =~ 00$ ]]; then
    echo "secrets.env is accessible to group or others (perms: $SECRETS_PERMS). Run: chmod go-rwx secrets.env"
    exit 1
fi

CONFIG="/root/permissions_lab/cluster.conf"
if [ ! -f "$CONFIG" ]; then
    echo "$CONFIG not found."
    exit 1
fi

CONFIG_PERMS=$(stat -c "%a" "$CONFIG" 2>/dev/null || stat -f "%Lp" "$CONFIG" 2>/dev/null)
if [[ "$CONFIG_PERMS" =~ [2367] ]]; then
    echo "cluster.conf still has write permissions (perms: $CONFIG_PERMS). Run: chmod a-w cluster.conf"
    exit 1
fi

echo "Task 3 (Symbolic Permissions with chmod) verified successfully!"
exit 0
