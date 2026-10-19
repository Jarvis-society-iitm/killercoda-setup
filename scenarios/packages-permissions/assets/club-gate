#!/usr/bin/env bash
# ==============================================================================
# IITM Jarvis Linux & Systems Club - Killercoda Interactive Gate & Auth CLI
# ==============================================================================

set -o pipefail

# Configuration defaults
DEFAULT_API_URL="https://jarvis-linux-club.vercel.app"
API_URL="${API_URL:-$DEFAULT_API_URL}"
MOCK_API="${MOCK_API:-false}"
SESSION_DIR="/root/.jarvis"
SESSION_FILE="${SESSION_DIR}/session.json"
GATE_LOCK_FILE="/tmp/.jarvis_locked"
GATE_PASSED_FILE="/tmp/.jarvis_unlocked"

# Colors & Formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

print_banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    cat << "EOF"
     __          ______ _    _ _____  _____   _      _____ _   _ _    ___   __
     \ \        / /  _ \ |  | |  __ \|  __ \ | |    |_   _| \ | | |  | \ \ / /
  ____\ \  /\  / /| |_) | |  | | |__) | |__) || |      | | |  \| | |  | |\ V / 
 |_____\ \/  \/ / |  _ <| |  | |  ___/|  ___/ | |      | | | . ` | |  | | > <  
        \  /\  /  | |_) | |__| | |    | |     | |____ _| |_| |\  | |__| |/ . \ 
         \/  \/   |____/ \____/|_|    |_|     |______|_____|_| \_|\____//_/ \_\
EOF
    echo -e "${PURPLE}  ==============================================================${NC}"
    echo -e "${WHITE}${BOLD}       IITM Jarvis Linux & Systems Club - Killercoda Lab Gateway${NC}"
    echo -e "${PURPLE}  ==============================================================${NC}"
    echo ""
}

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while ps -p "$pid" > /dev/null 2>&1; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

check_dependencies() {
    for cmd in curl jq; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo -e "${YELLOW}[!] Missing dependency '$cmd'. Installing quietly...${NC}"
            apt-get update -qq >/dev/null 2>&1 && apt-get install -y -qq "$cmd" >/dev/null 2>&1
        fi
    done
}

ensure_session_dir() {
    mkdir -p "$SESSION_DIR"
    chmod 700 "$SESSION_DIR"
}

lock_environment() {
    touch "$GATE_LOCK_FILE"
    rm -f "$GATE_PASSED_FILE"
}

unlock_environment() {
    rm -f "$GATE_LOCK_FILE"
    touch "$GATE_PASSED_FILE"
}

# Handles verification against backend API or Mock Mode
verify_credentials() {
    local student_id="$1"
    local lab_slug="$2"
    local auth_token="$3"

    if [ "$MOCK_API" = "true" ]; then
        if [ "$student_id" = "completed_user" ]; then
            echo '{"success": true, "mode": "practice", "message": "Lab previously completed. Entering Practice Mode (no repeat XP).", "session_token": "mock-token-practice-123"}'
            return 0
        fi

        echo '{"success": true, "mode": "active", "message": "Student verified successfully! XP eligible upon completion.", "session_token": "mock-token-active-456"}'
        return 0
    fi

    # Real API call
    local payload
    payload=$(jq -n \
        --arg sid "$student_id" \
        --arg slug "$lab_slug" \
        --arg token "$auth_token" \
        '{student_id: $sid, lab_slug: $slug, auth_token: $token}')

    local response
    response=$(curl -s -w "\n%{http_code}" -X POST \
        -H "Content-Type: application/json" \
        -d "$payload" \
        --connect-timeout 10 \
        --max-time 15 \
        "${API_URL}/api/labs/verify" 2>/dev/null)

    local http_status
    http_status=$(echo "$response" | tail -n1)
    local body
    body=$(echo "$response" | sed '$d')

    if [ "$http_status" -ge 200 ] && [ "$http_status" -lt 300 ]; then
        echo "$body"
        return 0
    else
        if [ -z "$body" ]; then
            echo "{\"success\": false, \"message\": \"Failed to connect to verification server (HTTP ${http_status}).\"}"
        else
            echo "$body"
        fi
        return 1
    fi
}

# Main interactive auth gate function
run_gate() {
    local lab_slug="$1"
    if [ -z "$lab_slug" ]; then
        lab_slug="linux-basics-101"
    fi

    print_banner
    check_dependencies
    ensure_session_dir
    lock_environment

    echo -e "${CYAN}Target Lab:${NC} ${WHITE}${BOLD}${lab_slug}${NC}"
    if [ "$MOCK_API" = "true" ]; then
        echo -e "${YELLOW}>> MOCK_API=true is enabled (Offline/Testing Mode) <<${NC}"
    else
        echo -e "${BLUE}Endpoint:${NC} ${API_URL}/api/labs/verify"
    fi
    echo ""

    echo -e "${WHITE}To unlock your terminal session, please authenticate with your Jarvis Club credentials.${NC}"
    echo -e "${WHITE}You can find your Passkey on your dashboard: ${CYAN}https://jarvis-linux-club.vercel.app/labs${NC}"
    echo ""

    local student_id=""
    local auth_token=""

    while [ -z "$student_id" ]; do
        echo -en "${BOLD}${CYAN}» Enter your Student Roll / ID (e.g., 25f3002130): ${NC}"
        read -r student_id
        student_id=$(echo "$student_id" | tr -d '[:space:]')
        if [ -z "$student_id" ]; then
            echo -e "${RED}[!] Student ID cannot be empty.${NC}"
        fi
    done

    while [ -z "$auth_token" ]; do
        echo -en "${BOLD}${CYAN}» Enter your Lab Passkey (e.g. JRV-A1B2C3D4): ${NC}"
        read -r auth_token
        auth_token=$(echo "$auth_token" | tr -d '[:space:]')
        if [ -z "$auth_token" ]; then
            echo -e "${RED}[!] Passkey cannot be empty.${NC}"
        fi
    done

    echo ""
    echo -en "${YELLOW}[*] Contacting Jarvis Club verification server...${NC}"

    # Perform verification with spinner
    local response_file
    response_file=$(mktemp)
    
    (
        verify_credentials "$student_id" "$lab_slug" "$auth_token" > "$response_file"
    ) &
    local curl_pid=$!
    spinner "$curl_pid"
    wait "$curl_pid"
    local exit_status=$?

    local response_json
    response_json=$(cat "$response_file")
    rm -f "$response_file"

    local is_success
    is_success=$(echo "$response_json" | jq -r '.success // false' 2>/dev/null)
    local msg
    msg=$(echo "$response_json" | jq -r '.message // "Unknown verification response"' 2>/dev/null)
    local mode
    mode=$(echo "$response_json" | jq -r '.mode // "active"' 2>/dev/null)
    local session_token
    session_token=$(echo "$response_json" | jq -r '.session_token // empty' 2>/dev/null)

    if [ "$exit_status" -ne 0 ] || [ "$is_success" != "true" ]; then
        echo -e "\r${RED}${BOLD}[ACCESS DENIED]${NC} ${RED}${msg}${NC}"
        echo ""
        echo -e "${RED}Terminal environment locked.${NC}"
        echo -e "${WHITE}If you believe this is an error, check your credentials on ${CYAN}https://jarvis-linux-club.vercel.app${NC} and reload the lab."
        echo ""
        # Keep environment locked
        return 1
    fi

    # Save session
    jq -n \
        --arg sid "$student_id" \
        --arg slug "$lab_slug" \
        --arg mode "$mode" \
        --arg token "$session_token" \
        --arg ts "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
        '{student_id: $sid, lab_slug: $slug, mode: $mode, session_token: $token, authenticated_at: $ts}' \
        > "$SESSION_FILE"

    chmod 600 "$SESSION_FILE"
    unlock_environment

    echo -e "\r${GREEN}${BOLD}[SUCCESS] Verified!${NC} Welcome, ${WHITE}${BOLD}${student_id}${NC}."

    if [ "$mode" = "practice" ]; then
        echo ""
        echo -e "${YELLOW}${BOLD}[NOTICE: PRACTICE MODE]${NC}"
        echo -e "${YELLOW}You have already completed this lab and claimed your XP.${NC}"
        echo -e "${YELLOW}This session is running in Practice Mode (all tasks accessible, no leaderboard update).${NC}"
    else
        echo -e "${GREEN}Status: Active Session - XP will be credited upon lab completion!${NC}"
    fi

    # Unpack / prepare lab assets if needed
    if [ -f "/root/lab-setup.sh" ]; then
        echo -e "${CYAN}[*] Initializing lab workspace assets...${NC}"
        bash /root/lab-setup.sh >/dev/null 2>&1 || true
    fi

    echo ""
    echo -e "${PURPLE}--------------------------------------------------------------${NC}"
    echo -e "${WHITE}${BOLD}Lab unlocked! Follow the instructions on the left panel.${NC}"
    echo -e "${WHITE}When finished with all tasks, execute: ${GREEN}${BOLD}club-submit${NC}"
    echo -e "${PURPLE}--------------------------------------------------------------${NC}"
    echo ""

    return 0
}

# Entrypoint handling
case "$1" in
    gate)
        shift
        run_gate "$@"
        ;;
    status)
        if [ -f "$GATE_PASSED_FILE" ] && [ -f "$SESSION_FILE" ]; then
            echo -e "${GREEN}Session is active & authenticated.${NC}"
            cat "$SESSION_FILE" | jq .
            exit 0
        else
            echo -e "${RED}Session is locked or unauthenticated.${NC}"
            exit 1
        fi
        ;;
    *)
        run_gate "$@"
        ;;
esac

