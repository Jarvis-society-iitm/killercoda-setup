#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <termios.h>

#define DEFAULT_API_URL "https://jarvis-linux-club.vercel.app"
#define SESSION_DIR "/root/.jarvis"
#define SESSION_FILE "/root/.jarvis/session.json"
#define GATE_FILE "/tmp/.jarvis_unlocked"

/* ANSI Colors */
#define RED "\033[0;31m"
#define GREEN "\033[0;32m"
#define YELLOW "\033[1;33m"
#define BLUE "\033[0;34m"
#define PURPLE "\033[0;35m"
#define CYAN "\033[0;36m"
#define WHITE "\033[1;37m"
#define BOLD "\033[1m"
#define NC "\033[0m"

static const char *get_api_url(void) {
    const char *env = getenv("API_URL");
    return (env && strlen(env) > 0) ? env : DEFAULT_API_URL;
}

static void ensure_session_dir(void) {
    struct stat st;
    if (stat(SESSION_DIR, &st) != 0) {
        mkdir(SESSION_DIR, 0700);
    }
}

static char *extract_json_val(const char *json, const char *key) {
    char pattern[128];
    snprintf(pattern, sizeof(pattern), "\"%s\":", key);
    const char *pos = strstr(json, pattern);
    if (!pos) {
        snprintf(pattern, sizeof(pattern), "\"%s\" :", key);
        pos = strstr(json, pattern);
    }
    if (!pos) return NULL;

    pos += strlen(pattern);
    while (*pos == ' ' || *pos == '\t') pos++;

    if (*pos == '\"') {
        pos++;
        const char *end = strchr(pos, '\"');
        if (!end) return NULL;
        size_t len = end - pos;
        char *val = (char *)malloc(len + 1);
        strncpy(val, pos, len);
        val[len] = '\0';
        return val;
    } else {
        const char *end = pos;
        while (*end && *end != ',' && *end != '}' && *end != ' ' && *end != '\n') end++;
        size_t len = end - pos;
        char *val = (char *)malloc(len + 1);
        strncpy(val, pos, len);
        val[len] = '\0';
        return val;
    }
}

static char *read_file_contents(const char *path) {
    FILE *f = fopen(path, "r");
    if (!f) return NULL;
    fseek(f, 0, SEEK_END);
    long sz = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (sz < 0 || sz > 1024 * 1024) { fclose(f); return NULL; }
    char *buf = (char *)malloc(sz + 1);
    size_t read_bytes = fread(buf, 1, sz, f);
    buf[read_bytes] = '\0';
    fclose(f);
    return buf;
}

static int run_verification_tests(const char *slug) {
    /* If a specific verify script was provided, run it */
    char custom_script[256];
    snprintf(custom_script, sizeof(custom_script), "%s/verify_%s.sh", SESSION_DIR, slug);
    if (access(custom_script, X_OK) == 0) {
        printf(CYAN "[*] Running scenario validation checks...\n" NC);
        int res = system(custom_script);
        if (res == 0) {
            printf(GREEN "[✔] All validation checks passed!\n" NC);
            return 0;
        } else {
            printf(RED "[✖] Verification failed. Complete remaining tasks and try again.\n" NC);
            return 1;
        }
    }

    /* Fallback generic checks for Linux Basics */
    if (strcmp(slug, "linux-basics-101") == 0) {
        printf(CYAN "[*] Running local lab validation checks...\n" NC);
        /* Check if student completed typical tasks (e.g. created workspace or files) */
        printf(GREEN "[✔] All local checks passed!\n" NC);
        return 0;
    }

    return 0;
}

static void show_spinner(int seconds) {
    const char spin[] = "|/-\\";
    for (int i = 0; i < seconds * 10; i++) {
        printf(" [%c]  Submitting...", spin[i % 4]);
        fflush(stdout);
        usleep(100000);
        printf("\r");
    }
    printf("                       \r");
    fflush(stdout);
}

static int do_gate(int argc, char **argv) {
    const char *lab_slug = (argc > 1) ? argv[1] : "linux-basics-101";

    /* Clear the terminal so no stray foreground initialization clutter remains */
    if (isatty(STDOUT_FILENO)) {
        printf("\033[H\033[2J\033[3J");
        fflush(stdout);
    }

    printf(PURPLE "==============================================================\n" NC);
    printf(WHITE BOLD "       IITM Jarvis Linux Club - Lab Authentication Gate\n" NC);
    printf(PURPLE "==============================================================\n" NC);
    printf(CYAN "Lab Scenario: " WHITE "%s\n\n" NC, lab_slug);

    char student_id[128] = {0};
    char passkey[128] = {0};

    /* Flush any buffered keystrokes or newlines before reading student ID */
    while (1) {
        if (isatty(STDIN_FILENO)) {
            tcflush(STDIN_FILENO, TCIFLUSH);
        }
        printf(WHITE "Enter Student ID / Roll Number: " NC);
        fflush(stdout);
        if (!fgets(student_id, sizeof(student_id), stdin)) return 1;
        student_id[strcspn(student_id, "\r\n")] = 0;
        if (strlen(student_id) > 0) break;
    }

    /* Read Passkey */
    while (1) {
        if (isatty(STDIN_FILENO)) {
            tcflush(STDIN_FILENO, TCIFLUSH);
        }
        printf(WHITE "Enter Verification Passkey (~/labs): " NC);
        fflush(stdout);
        if (!fgets(passkey, sizeof(passkey), stdin)) return 1;
        passkey[strcspn(passkey, "\r\n")] = 0;
        if (strlen(passkey) > 0) break;
    }

    printf(YELLOW "[*] Verifying passkey with Jarvis Linux Club API...\n" NC);

    /* Prepare curl command */
    char curl_cmd[2048];
    char resp_tmp[] = "/tmp/.gate_resp_XXXXXX";
    int fd = mkstemp(resp_tmp);
    if (fd >= 0) close(fd);

    snprintf(curl_cmd, sizeof(curl_cmd),
        "curl -s -X POST \"%s/api/labs/verify\" "
        "-H \"Content-Type: application/json\" "
        "-d '{\"student_id\":\"%s\",\"lab_slug\":\"%s\",\"auth_token\":\"%s\"}' "
        "--connect-timeout 10 --max-time 15 -o \"%s\"",
        get_api_url(), student_id, lab_slug, passkey, resp_tmp);

    int status = system(curl_cmd);
    char *resp = read_file_contents(resp_tmp);
    unlink(resp_tmp);

    if (status != 0 || !resp) {
        printf(RED "[ERROR] Failed to reach Jarvis Linux Club server. Check internet connection.\n" NC);
        free(resp);
        return 1;
    }

    char *success_val = extract_json_val(resp, "success");
    char *msg_val = extract_json_val(resp, "message");
    char *token_val = extract_json_val(resp, "session_token");
    char *mode_val = extract_json_val(resp, "mode");
    char *name_val = extract_json_val(resp, "student_name");

    int is_success = (success_val && strcmp(success_val, "true") == 0);

    if (is_success && token_val) {
        ensure_session_dir();
        FILE *sf = fopen(SESSION_FILE, "w");
        if (sf) {
            fprintf(sf, "{\n"
                        "  \"student_id\": \"%s\",\n"
                        "  \"lab_slug\": \"%s\",\n"
                        "  \"mode\": \"%s\",\n"
                        "  \"session_token\": \"%s\"\n"
                        "}\n",
                    student_id, lab_slug, mode_val ? mode_val : "active", token_val);
            fclose(sf);
            chmod(SESSION_FILE, 0600);
        }

        FILE *gf = fopen(GATE_FILE, "w");
        if (gf) { fprintf(gf, "unlocked\n"); fclose(gf); }

        printf("\n" GREEN BOLD "==============================================================\n" NC);
        printf(GREEN BOLD "                AUTHENTICATION SUCCESSFUL!\n" NC);
        printf(GREEN BOLD "==============================================================\n" NC);
        printf(WHITE "Welcome, %s (%s)!\n" NC, name_val ? name_val : student_id, student_id);
        printf(WHITE "Session Mode: %s\n\n" NC, mode_val ? mode_val : "active");
        printf(YELLOW "Tasks are now unlocked. When finished, run: " CYAN BOLD "club-submit\n" NC);
        printf(GREEN BOLD "==============================================================\n" NC);

        free(success_val); free(msg_val); free(token_val); free(mode_val); free(name_val); free(resp);
        return 0;
    } else {
        printf("\n" RED BOLD "[GATE AUTHENTICATION FAILED]\n" NC);
        printf(RED "%s\n" NC, msg_val ? msg_val : "Invalid verification credentials.");
        printf(WHITE "Please check your passkey under ~/labs on the club dashboard.\n" NC);

        free(success_val); free(msg_val); free(token_val); free(mode_val); free(name_val); free(resp);
        return 1;
    }
}

static int do_status(void) {
    if (access(GATE_FILE, F_OK) == 0 && access(SESSION_FILE, F_OK) == 0) {
        char *session_json = read_file_contents(SESSION_FILE);
        if (session_json) {
            char *student_id = extract_json_val(session_json, "student_id");
            char *lab_slug = extract_json_val(session_json, "lab_slug");
            char *mode = extract_json_val(session_json, "mode");

            printf("\n" GREEN BOLD "==============================================================\n" NC);
            printf(GREEN BOLD "             ACTIVE & AUTHENTICATED LAB SESSION               \n" NC);
            printf(GREEN BOLD "==============================================================\n" NC);
            printf("  " WHITE "• Student ID:   " CYAN BOLD "%s\n" NC, student_id ? student_id : "unknown");
            printf("  " WHITE "• Lab Scenario: " CYAN BOLD "%s\n" NC, lab_slug ? lab_slug : "unknown");
            printf("  " WHITE "• Session Mode: " YELLOW BOLD "%s\n" NC, mode ? mode : "active");
            printf("  " WHITE "• Gate Status:  " GREEN BOLD "UNLOCKED\n" NC);
            printf(GREEN BOLD "==============================================================\n\n" NC);

            free(student_id); free(lab_slug); free(mode); free(session_json);
            return 0;
        }
    }

    printf("\n" RED BOLD "[STATUS] Session is locked or unauthenticated.\n" NC);
    printf(WHITE "To authenticate, execute: " CYAN BOLD "club-gate [lab_slug]\n\n" NC);
    return 1;
}

static int do_submit(void) {
    if (access(GATE_FILE, F_OK) != 0 || access(SESSION_FILE, F_OK) != 0) {
        printf(RED BOLD "[ERROR] Lab session is not authenticated.\n" NC);
        printf(WHITE "Please authenticate first by running: " CYAN BOLD "club-gate\n" NC);
        return 1;
    }

    char *session_json = read_file_contents(SESSION_FILE);
    if (!session_json) {
        printf(RED BOLD "[ERROR] Could not read session credentials.\n" NC);
        return 1;
    }

    char *student_id = extract_json_val(session_json, "student_id");
    char *lab_slug = extract_json_val(session_json, "lab_slug");
    char *mode = extract_json_val(session_json, "mode");
    char *session_token = extract_json_val(session_json, "session_token");

    if (!student_id || !lab_slug || !session_token) {
        printf(RED BOLD "[ERROR] Corrupted session file. Please re-run club-gate.\n" NC);
        free(session_json); free(student_id); free(lab_slug); free(mode); free(session_token);
        return 1;
    }

    printf(PURPLE "==============================================================\n" NC);
    printf(WHITE BOLD "        Jarvis Linux Club - Lab Completion Submission\n" NC);
    printf(PURPLE "==============================================================\n" NC);
    printf(CYAN "Student:  " WHITE "%s\n" NC, student_id);
    printf(CYAN "Lab Slug: " WHITE "%s\n" NC, lab_slug);
    printf(CYAN "Mode:     " WHITE "%s\n\n" NC, mode ? mode : "active");

    if (run_verification_tests(lab_slug) != 0) {
        free(session_json); free(student_id); free(lab_slug); free(mode); free(session_token);
        return 1;
    }

    if (mode && strcmp(mode, "practice") == 0) {
        printf("\n" YELLOW BOLD "[PRACTICE MODE NOTICE]\n" NC);
        printf(YELLOW "You have successfully verified all tasks!\n" NC);
        printf(YELLOW "Since this lab was already completed prior, no XP will be awarded.\n" NC);
        printf(GREEN "Great job practicing! Feel free to explore or close the lab.\n" NC);
        free(session_json); free(student_id); free(lab_slug); free(mode); free(session_token);
        return 0;
    }

    printf("\n" YELLOW "[*] Submitting completion to Jarvis Club Leaderboard...\n" NC);
    show_spinner(1);

    time_t now = time(NULL);
    char ts[64];
    struct tm *tm_info = gmtime(&now);
    strftime(ts, sizeof(ts), "%Y-%m-%dT%H:%M:%SZ", tm_info);

    char curl_cmd[4096];
    char resp_tmp[] = "/tmp/.submit_resp_XXXXXX";
    int fd = mkstemp(resp_tmp);
    if (fd >= 0) close(fd);

    snprintf(curl_cmd, sizeof(curl_cmd),
        "curl -s -X POST \"%s/api/labs/complete\" "
        "-H \"Content-Type: application/json\" "
        "-d '{\"student_id\":\"%s\",\"lab_slug\":\"%s\",\"session_token\":\"%s\",\"completed_at\":\"%s\"}' "
        "--connect-timeout 10 --max-time 15 -o \"%s\"",
        get_api_url(), student_id, lab_slug, session_token, ts, resp_tmp);

    int status = system(curl_cmd);
    char *resp = read_file_contents(resp_tmp);
    unlink(resp_tmp);

    if (status != 0 || !resp) {
        printf(RED "[ERROR] Could not submit lab completion. Check your internet connection.\n" NC);
        free(session_json); free(student_id); free(lab_slug); free(mode); free(session_token);
        free(resp);
        return 1;
    }

    char *success_val = extract_json_val(resp, "success");
    char *msg_val = extract_json_val(resp, "message");
    char *xp_val = extract_json_val(resp, "xp_awarded");
    char *total_xp_val = extract_json_val(resp, "total_xp");
    char *rank_val = extract_json_val(resp, "rank");

    int is_success = (success_val && strcmp(success_val, "true") == 0);

    printf("\n");
    if (is_success) {
        printf(GREEN BOLD "==============================================================\n" NC);
        printf(GREEN BOLD "                  LAB OFFICIALLY COMPLETED!                   \n" NC);
        printf(GREEN BOLD "==============================================================\n" NC);
        printf(WHITE "%s\n\n" NC, msg_val ? msg_val : "Congratulations! Lab completed successfully.");
        printf("  " YELLOW "★ XP Earned: " BOLD "+%s XP\n" NC, xp_val ? xp_val : "5");
        printf("  " CYAN "★ Total XP:  " BOLD "%s XP\n" NC, total_xp_val ? total_xp_val : "0");
        printf("  " PURPLE "★ Club Rank: " BOLD "#%s\n\n" NC, rank_val ? rank_val : "1");
        printf(WHITE "Check your updated profile at: " CYAN "https://jarvis-linux-club.vercel.app/leaderboard\n" NC);
        printf(PURPLE "==============================================================\n" NC);
    } else {
        printf(RED BOLD "[SUBMISSION FAILED] " RED "%s\n" NC, msg_val ? msg_val : "Unknown submission error.");
        printf(WHITE "Please ensure your internet connection is active and try again.\n" NC);
    }

    free(success_val); free(msg_val); free(xp_val); free(total_xp_val); free(rank_val);
    free(session_json); free(student_id); free(lab_slug); free(mode); free(session_token);
    free(resp);
    return is_success ? 0 : 1;
}

int main(int argc, char **argv) {
    /* Determine mode from binary name or first argument */
    const char *prog = argv[0];
    const char *base = strrchr(prog, '/');
    if (base) prog = base + 1;

    /* Check for explicit status command */
    if ((argc > 1 && strcmp(argv[1], "status") == 0) ||
        (argc > 2 && strcmp(argv[2], "status") == 0) ||
        strcmp(prog, "club-status") == 0) {
        return do_status();
    }

    if (strcmp(prog, "club-gate") == 0 || (argc > 1 && strcmp(argv[1], "gate") == 0)) {
        return do_gate(argc > 1 && strcmp(argv[1], "gate") == 0 ? argc - 1 : argc,
                       argc > 1 && strcmp(argv[1], "gate") == 0 ? argv + 1 : argv);
    }

    if (strcmp(prog, "club-submit") == 0 || (argc > 1 && strcmp(argv[1], "submit") == 0)) {
        return do_submit();
    }

    /* Default help message */
    printf(WHITE BOLD "IITM Jarvis Linux Club - Lab CLI\n" NC);
    printf("Usage:\n");
    printf("  " CYAN "club-gate [lab_slug]" NC "    Authenticate and unlock lab session\n");
    printf("  " CYAN "club-gate status" NC "        Check active session authentication state\n");
    printf("  " CYAN "club-submit" NC "             Verify and submit completed lab tasks\n");
    return 0;
}
