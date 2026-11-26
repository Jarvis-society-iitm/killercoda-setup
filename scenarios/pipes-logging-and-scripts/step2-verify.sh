#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w4s2_lab/top_status.txt ] || [ "$(wc -l < /root/w4s2_lab/top_status.txt | tr -d '[:space:]')" != "2" ]; then
    echo "Expected /root/w4s2_lab/top_status.txt with the top 2 status codes."
    exit 1
fi

if ! grep -q "5 200" /root/w4s2_lab/top_status.txt; then
    echo "Expected top_status.txt to start with '5 200'."
    exit 1
fi

if [ ! -f /root/w4s2_lab/unique_codes_count.txt ] || [ "$(cat /root/w4s2_lab/unique_codes_count.txt | tr -d '[:space:]')" != "4" ]; then
    echo "Expected /root/w4s2_lab/unique_codes_count.txt to contain '4'."
    exit 1
fi

if [ ! -f /root/w4s2_lab/ip_counts.txt ] || ! grep -q "3 192.168.1.10" /root/w4s2_lab/ip_counts.txt; then
    echo "Expected /root/w4s2_lab/ip_counts.txt to contain '3 192.168.1.10'."
    exit 1
fi

echo "Task 1 (Data pipelines) verified successfully!"
exit 0
