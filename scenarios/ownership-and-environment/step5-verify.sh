#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/service_config.env ]; then
    echo "File /root/service_config.env not found. Please create it using nano."
    exit 1
fi

if ! grep -q "ENVIRONMENT=production" /root/service_config.env || ! grep -q "PORT=8080" /root/service_config.env; then
    echo "File /root/service_config.env is missing expected configuration lines."
    exit 1
fi

if [ ! -f /root/modal_notes.txt ]; then
    echo "File /root/modal_notes.txt not found. Please create and save it using vim."
    exit 1
fi

if ! grep -qi "Mastering Vim" /root/modal_notes.txt; then
    echo "File /root/modal_notes.txt does not contain expected text saved via Vim."
    exit 1
fi

echo "Task 4 (Terminal Text Editing with Nano & Vim) verified successfully!"
exit 0

