#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/w3s1_lab/exported_var.txt ]; then
    echo "File /root/w3s1_lab/exported_var.txt not found. Did you run: printenv MY_SECRET > /root/w3s1_lab/exported_var.txt ?"
    exit 1
fi

VAL=$(cat /root/w3s1_lab/exported_var.txt | tr -d '[:space:]')
if [ "$VAL" != "OlympusVault2026" ]; then
    echo "Expected exported_var.txt to contain 'OlympusVault2026', but found '$VAL'."
    exit 1
fi

if [ ! -f /root/w3s1_lab/cohort.txt ]; then
    echo "File /root/w3s1_lab/cohort.txt not found."
    exit 1
fi

COHORT_VAL=$(cat /root/w3s1_lab/cohort.txt | tr -d '[:space:]')
if [ "$COHORT_VAL" != "Jarvis-Week3-Foundations" ]; then
    echo "Expected cohort.txt to contain 'Jarvis-Week3-Foundations', but found '$COHORT_VAL'."
    exit 1
fi

echo "Task 1 (Shell vs Environment Variables) verified successfully!"
exit 0
