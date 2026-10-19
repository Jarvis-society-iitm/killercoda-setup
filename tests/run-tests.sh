#!/usr/bin/env bash
# ==============================================================================
# Test Suite for Jarvis Killercoda Gate & Submission CLI
# ==============================================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export API_URL="http://127.0.0.1:4040"
export MOCK_API="false"

echo "=== Starting Test Mock Server ==="
PORT=4040 node "$DIR/mock-server/server.js" > /tmp/mock_server.log 2>&1 &
SERVER_PID=$!

cleanup() {
    echo "=== Cleaning up Test Environment ==="
    kill -9 "$SERVER_PID" 2>/dev/null || true
    rm -rf /tmp/test_jarvis /tmp/.jarvis_unlocked /tmp/.jarvis_locked /tmp/mock_server.log
}
trap cleanup EXIT

sleep 1

# Health check
curl -s http://127.0.0.1:4040/health | grep -q "Jarvis Linux Club Mock API"
echo "[✔] Mock server online."

# Override session dir for unprivileged / isolated test
export SESSION_DIR="/tmp/test_jarvis"
sed -i 's|SESSION_DIR="/root/.jarvis"|SESSION_DIR="/tmp/test_jarvis"|g' "$DIR/scripts/gate.sh" "$DIR/scripts/club-submit.sh"

echo "=== Test 1: Invalid Credentials Gate ==="
# Input invalid roll & token
printf "unknown_roll\ninvalid_token\n" | bash "$DIR/scripts/gate.sh" test-lab > /tmp/test1.log 2>&1 || true
if grep -q "ACCESS DENIED" /tmp/test1.log; then
    echo "[✔] Test 1 Passed: Unauthorized credentials correctly rejected."
else
    cat /tmp/test1.log
    exit 1
fi

echo "=== Test 2: Valid Active Student Authentication ==="
# Input valid roll & token for Aditya (active)
printf "21f1001230\nvalid-token-123\n" | bash "$DIR/scripts/gate.sh" test-lab > /tmp/test2.log 2>&1
if grep -q "SUCCESS" /tmp/test2.log && [ -f /tmp/.jarvis_unlocked ]; then
    echo "[✔] Test 2 Passed: Student authenticated and lab unlocked."
else
    cat /tmp/test2.log
    exit 1
fi

echo "=== Test 3: Session Status Query ==="
bash "$DIR/scripts/gate.sh" status > /tmp/test3.log 2>&1
if grep -q "21f1001230" /tmp/test3.log; then
    echo "[✔] Test 3 Passed: Session status reports valid user."
else
    cat /tmp/test3.log
    exit 1
fi

echo "=== Test 4: Completion Submission ==="
bash "$DIR/scripts/club-submit.sh" > /tmp/test4.log 2>&1
if grep -q "LAB OFFICIALLY COMPLETED" /tmp/test4.log; then
    echo "[✔] Test 4 Passed: Completion payload accepted and XP awarded."
else
    cat /tmp/test4.log
    exit 1
fi

echo "=== Test 5: Re-authentication in Practice Mode ==="
# Re-login with Priya (who already completed linux-basics-101 in mock DB)
printf "22f2000456\nvalid-token-456\n" | bash "$DIR/scripts/gate.sh" linux-basics-101 > /tmp/test5.log 2>&1
if grep -q "PRACTICE MODE" /tmp/test5.log; then
    echo "[✔] Test 5 Passed: Previously completed lab enters Practice Mode."
else
    cat /tmp/test5.log
    exit 1
fi

# Reset modified files back
sed -i 's|SESSION_DIR="/tmp/test_jarvis"|SESSION_DIR="/root/.jarvis"|g' "$DIR/scripts/gate.sh" "$DIR/scripts/club-submit.sh"

echo ""
echo "============================================="
echo "  All 5 Verification Test Suites Passed!     "
echo "============================================="

