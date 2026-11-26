#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w4s1_lab/non_200.txt ]; then
    echo "Missing /root/w4s1_lab/non_200.txt"
    exit 1
fi

NON200_LINES=$(wc -l < /root/w4s1_lab/non_200.txt | tr -d '[:space:]')
if [ "$NON200_LINES" != "4" ] || grep -q ' 200 ' /root/w4s1_lab/non_200.txt; then
    echo "Expected non_200.txt to have the 4 lines without 200."
    exit 1
fi

if [ ! -f /root/w4s1_lab/nov24_count.txt ]; then
    echo "Missing /root/w4s1_lab/nov24_count.txt"
    exit 1
fi

NOV24_VAL=$(cat /root/w4s1_lab/nov24_count.txt | tr -d '[:space:]')
if [ "$NOV24_VAL" != "4" ]; then
    echo "Expected nov24_count.txt to contain '4', found '$NOV24_VAL'."
    exit 1
fi

if [ ! -f /root/w4s1_lab/day25.txt ]; then
    echo "Missing /root/w4s1_lab/day25.txt"
    exit 1
fi

DAY25_LINES=$(wc -l < /root/w4s1_lab/day25.txt | tr -d '[:space:]')
if [ "$DAY25_LINES" != "1" ] || ! grep -q '25/Nov' /root/w4s1_lab/day25.txt; then
    echo "Expected day25.txt to contain only the 1 line for 25/Nov (not 256)."
    exit 1
fi

echo "Task 1 (Basic grep filtering) verified successfully!"
exit 0
