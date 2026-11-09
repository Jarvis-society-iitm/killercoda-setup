#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

KEY_FILE="/root/permissions_lab/id_rsa_mock"
if [ ! -f "$KEY_FILE" ]; then
    echo "$KEY_FILE not found."
    exit 1
fi

KEY_PERMS=$(stat -c "%a" "$KEY_FILE" 2>/dev/null || stat -f "%Lp" "$KEY_FILE" 2>/dev/null)
if [ "$KEY_PERMS" != "600" ]; then
    echo "id_rsa_mock permissions are $KEY_PERMS, expected 600. Run: chmod 600 id_rsa_mock"
    exit 1
fi

HC_FILE="/root/permissions_lab/healthcheck.sh"
if [ ! -f "$HC_FILE" ]; then
    echo "$HC_FILE not found."
    exit 1
fi

HC_PERMS=$(stat -c "%a" "$HC_FILE" 2>/dev/null || stat -f "%Lp" "$HC_FILE" 2>/dev/null)
if [ "$HC_PERMS" != "755" ]; then
    echo "healthcheck.sh permissions are $HC_PERMS, expected 755. Run: chmod 755 healthcheck.sh"
    exit 1
fi

PORTAL="/root/permissions_lab/shared_portal"
if [ ! -d "$PORTAL" ]; then
    echo "Directory $PORTAL not found."
    exit 1
fi

PORTAL_PERMS=$(stat -c "%a" "$PORTAL" 2>/dev/null || stat -f "%Lp" "$PORTAL" 2>/dev/null)
if [ "$PORTAL_PERMS" != "755" ]; then
    echo "shared_portal permissions are $PORTAL_PERMS, expected 755. Run: chmod 755 shared_portal"
    exit 1
fi

VAULT="/root/permissions_lab/vault_secure"
if [ ! -d "$VAULT" ]; then
    echo "Directory $VAULT not found."
    exit 1
fi

VAULT_PERMS=$(stat -c "%a" "$VAULT" 2>/dev/null || stat -f "%Lp" "$VAULT" 2>/dev/null)
if [ "$VAULT_PERMS" != "700" ]; then
    echo "vault_secure permissions are $VAULT_PERMS, expected 700. Run: chmod 700 vault_secure"
    exit 1
fi

echo "=========================================================="
echo "  Week 2 Session I Lab Verified Successfully!             "
echo "  Run 'club-submit' in your terminal to claim your XP!    "
echo "=========================================================="
exit 0
