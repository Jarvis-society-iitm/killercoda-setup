#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w4s1_lab/ip_start.txt ]; then
    echo "Missing /root/w4s1_lab/ip_start.txt"
    exit 1
fi

IP_LINES=$(wc -l < /root/w4s1_lab/ip_start.txt | tr -d '[:space:]')
if [ "$IP_LINES" != "2" ]; then
    echo "Expected ip_start.txt to contain 2 lines for 192.168.1.10."
    exit 1
fi

if [ ! -f /root/w4s1_lab/zero_size.txt ]; then
    echo "Missing /root/w4s1_lab/zero_size.txt"
    exit 1
fi

ZERO_LINES=$(wc -l < /root/w4s1_lab/zero_size.txt | tr -d '[:space:]')
if [ "$ZERO_LINES" != "1" ] || ! grep -q '500 0$' /root/w4s1_lab/zero_size.txt; then
    echo "Expected zero_size.txt to contain only the 500 0 line."
    exit 1
fi

if [ ! -f /root/w4s1_lab/errors_4xx_5xx.txt ]; then
    echo "Missing /root/w4s1_lab/errors_4xx_5xx.txt"
    exit 1
fi

ERR_LINES=$(wc -l < /root/w4s1_lab/errors_4xx_5xx.txt | tr -d '[:space:]')
if [ "$ERR_LINES" != "4" ]; then
    echo "Expected errors_4xx_5xx.txt to contain 4 lines (401, 403, 404, 500)."
    exit 1
fi

echo "Task 2 (Regex & grep -E) verified successfully!"
exit 0
