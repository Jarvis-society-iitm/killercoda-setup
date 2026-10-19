#!/usr/bin/env bash
# ==============================================================================
# IITM Jarvis Linux & Systems Club - Lab Verification & Submission CLI
# ==============================================================================

set -o pipefail

DEFAULT_API_URL="https://jarvis-linux-club.vercel.app"
API_URL="${API_URL:-$DEFAULT_API_URL}"
MOCK_API="${MOCK_API:-false}"
SESSION_DIR="/root/.jarvis"
SESSION_FILE="${SESSION_DIR}/session.json"
GATE_PASSED_FILE="/tmp/.jarvis_unlocked"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m'

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

check_unlocked() {
    if [ ! -f "$GATE_PASSED_FILE" ] || [ ! -f "$SESSION_FILE" ]; then
        echo -e "${RED}${BOLD}[ERROR] Lab session is not authenticated.${NC}"
        echo -e "Please authenticate by running: ${CYAN}club-gate${NC}"
        exit 1
    fi
}

# Run scenario-specific verification tests
run_local_checks() {
    local lab_slug="$1"
    local verify_script="/root/.jarvis/verify_${lab_slug}.sh"

    # Default to global validator if slug-specific one isn't found
    if [ ! -f "$verify_script" ]; then
        verify_script="/root/.jarvis/verify_current.sh"
    fi

    if [ -f "$verify_script" ]; then
        echo -e "${CYAN}[*] Running local lab validation checks...${NC}"
        if bash "$verify_script"; then
            echo -e "${GREEN}[✔] All local checks passed!${NC}"
            return 0
        else
            echo -e "${RED}[✖] Local verification failed. Fix remaining tasks and try again.${NC}"
            return 1
        fi
    fi

    # If no custom verify script exists, assume ok
    return 0
}

submit_completion() {
    check_unlocked

    local student_id
    local lab_slug
    local mode
    local session_token

    student_id=$(jq -r '.student_id' "$SESSION_FILE")
    lab_slug=$(jq -r '.lab_slug' "$SESSION_FILE")
    mode=$(jq -r '.mode' "$SESSION_FILE")
    session_token=$(jq -r '.session_token' "$SESSION_FILE")

    echo -e "${PURPLE}==============================================================${NC}"
    echo -e "${WHITE}${BOLD}       Jarvis Linux Club - Lab Completion Submission${NC}"
    echo -e "${PURPLE}==============================================================${NC}"
    echo -e "${CYAN}Student:${NC}    ${WHITE}${student_id}${NC}"
    echo -e "${CYAN}Lab Slug:${NC}   ${WHITE}${lab_slug}${NC}"
    echo -e "${CYAN}Mode:${NC}       ${WHITE}${mode}${NC}"
    echo ""

    if ! run_local_checks "$lab_slug"; then
        exit 1
    fi

    if [ "$mode" = "practice" ]; then
        echo ""
        echo -e "${YELLOW}${BOLD}[PRACTICE MODE NOTICE]${NC}"
        echo -e "${YELLOW}You have successfully verified all tasks!${NC}"
        echo -e "${YELLOW}Since this lab was already completed prior, no XP will be awarded.${NC}"
        echo -e "${GREEN}Great job practicing! Feel free to explore or close the lab.${NC}"
        exit 0
    fi

    echo ""
    echo -en "${YELLOW}[*] Submitting completion to Jarvis Club Leaderboard...${NC}"

    local response_file
    response_file=$(mktemp)

    if [ "$MOCK_API" = "true" ]; then
        sleep 1
        echo '{"success": true, "xp_awarded": 5, "total_xp": 450, "rank": 12, "message": "Congratulations! Lab completed successfully."}' > "$response_file"
        exit_code=0
    else
        local payload
        payload=$(jq -n \
            --arg sid "$student_id" \
            --arg slug "$lab_slug" \
            --arg token "$session_token" \
            --arg ts "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
            '{student_id: $sid, lab_slug: $slug, session_token: $token, completed_at: $ts}')

        (
            curl -s -X POST \
                -H "Content-Type: application/json" \
                -d "$payload" \
                --connect-timeout 10 \
                --max-time 15 \
                "${API_URL}/api/labs/complete" > "$response_file"
        ) &
        local curl_pid=$!
        spinner "$curl_pid"
        wait "$curl_pid"
        exit_code=$?
    fi

    local resp_json
    resp_json=$(cat "$response_file")
    rm -f "$response_file"

    local is_success
    is_success=$(echo "$resp_json" | jq -r '.success // false' 2>/dev/null)
    local msg
    msg=$(echo "$resp_json" | jq -r '.message // "Unknown error"' 2>/dev/null)
    local xp_awarded
    xp_awarded=$(echo "$resp_json" | jq -r '.xp_awarded // 0' 2>/dev/null)
    local total_xp
    total_xp=$(echo "$resp_json" | jq -r '.total_xp // 0' 2>/dev/null)
    local rank
    rank=$(echo "$resp_json" | jq -r '.rank // "N/A"' 2>/dev/null)

    echo ""
    if [ "$exit_code" -eq 0 ] && [ "$is_success" = "true" ]; then
        echo -e "${GREEN}${BOLD}==============================================================${NC}"
        echo -e "${GREEN}${BOLD}                 LAB OFFICIALLY COMPLETED!                    ${NC}"
        echo -e "${GREEN}${BOLD}==============================================================${NC}"
        echo -e "${WHITE}${msg}${NC}"
        echo ""
        echo -e "  ${YELLOW}★ XP Earned:${NC}     ${BOLD}+${xp_awarded} XP${NC}"
        echo -e "  ${CYAN}★ Total XP:${NC}      ${BOLD}${total_xp} XP${NC}"
        echo -e "  ${PURPLE}★ Club Rank:${NC}     ${BOLD}#${rank}${NC}"
        echo ""
        echo -e "${WHITE}Check your updated profile at: ${CYAN}https://jarvis-linux-club.vercel.app/leaderboard${NC}"
        echo -e "${PURPLE}==============================================================${NC}"
    else
        echo -e "${RED}${BOLD}[SUBMISSION FAILED]${NC} ${RED}${msg}${NC}"
        echo -e "${WHITE}Please ensure your internet connection is active and try again.${NC}"
        exit 1
    fi
}

submit_completion

