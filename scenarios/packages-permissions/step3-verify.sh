#!/usr/bin/env bash
# Step 3 Verification: Multi-tier permission audit

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "[✖] Terminal is not authenticated."
    exit 1
fi

BASE="/root/permission-audit"
if [ ! -d "$BASE" ]; then
    echo "[✖] Directory $BASE does not exist."
    exit 1
fi

check_perm() {
    local path="$1"
    local expected="$2"
    if [ ! -e "$path" ]; then
        echo "[✖] Target $path does not exist."
        return 1
    fi
    local actual
    actual=$(stat -c "%a" "$path" 2>/dev/null)
    if [ "$actual" != "$expected" ]; then
        echo "[✖] $path has permissions $actual, expected $expected."
        return 1
    fi
    return 0
}

check_perm "$BASE/public" "755" || exit 1
check_perm "$BASE/private" "700" || exit 1
check_perm "$BASE/shared" "775" || exit 1
check_perm "$BASE/scripts" "750" || exit 1

AUDIT_SCRIPT="$BASE/scripts/audit.sh"
if [ ! -f "$AUDIT_SCRIPT" ]; then
    echo "[✖] $AUDIT_SCRIPT does not exist."
    exit 1
fi

check_perm "$AUDIT_SCRIPT" "700" || exit 1

if ! bash "$AUDIT_SCRIPT" >/dev/null 2>&1; then
    echo "[✖] $AUDIT_SCRIPT failed to execute."
    exit 1
fi

echo "[✔] Permission audit tree and audit.sh validated successfully!"
exit 0

