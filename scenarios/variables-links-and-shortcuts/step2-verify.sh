#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/city_var.txt ]; then
    echo "File /root/w3s1_lab/city_var.txt not found. Did you run: printenv CITY > /root/w3s1_lab/city_var.txt ?"
    exit 1
fi

CITY_VAL=$(cat /root/w3s1_lab/city_var.txt | tr -d '[:space:]')
if [ "$CITY_VAL" != "London" ]; then
    echo "Expected city_var.txt to contain 'London', but found '$CITY_VAL'."
    exit 1
fi

if [ ! -f /root/w3s1_lab/session_var.txt ]; then
    echo "File /root/w3s1_lab/session_var.txt not found."
    exit 1
fi

SESS_VAL=$(cat /root/w3s1_lab/session_var.txt | tr -d '[:space:]')
if [ "$SESS_VAL" != "Variables-and-Links" ]; then
    echo "Expected session_var.txt to contain 'Variables-and-Links', but found '$SESS_VAL'."
    exit 1
fi

echo "Task 1 (Shell vs Environment Variables) verified successfully!"
exit 0
