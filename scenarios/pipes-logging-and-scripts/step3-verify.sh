#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w4s2_lab/file.txt ] || ! grep -q "Hello" /root/w4s2_lab/file.txt || ! grep -q "World" /root/w4s2_lab/file.txt; then
    echo "Expected /root/w4s2_lab/file.txt to contain both 'Hello' and 'World'."
    exit 1
fi

if [ ! -f /root/w4s2_lab/errors.txt ] || [ ! -s /root/w4s2_lab/errors.txt ]; then
    echo "Expected /root/w4s2_lab/errors.txt to contain captured stderr output."
    exit 1
fi

if [ ! -f /root/w4s2_lab/full_report.txt ] || ! grep -q "404" /root/w4s2_lab/full_report.txt || ! grep -q "No such file" /root/w4s2_lab/full_report.txt; then
    echo "Expected /root/w4s2_lab/full_report.txt to contain both the 404 match and the 'No such file' error."
    exit 1
fi

if [ ! -f /root/w4s2_lab/success.txt ] || [ "$(wc -l < /root/w4s2_lab/success.txt | tr -d '[:space:]')" != "5" ]; then
    echo "Expected /root/w4s2_lab/success.txt to contain the 5 lines matching '200'."
    exit 1
fi

if [ ! -f /root/w4s2_lab/daily_report.txt ] || ! grep -q "8 " /root/w4s2_lab/daily_report.txt; then
    echo "Expected /root/w4s2_lab/daily_report.txt to contain the date and '8 /root/w4s2_lab/server.log'."
    exit 1
fi

echo "Task 2 (Redirection for logging) verified successfully!"
exit 0
