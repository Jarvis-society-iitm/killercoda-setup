#!/usr/bin/env bash
# Step 5 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

if [ -d /tmp/project ]; then
    echo "Directory /tmp/project still exists! Complete step 9 to delete it with 'rm -r /tmp/project'."
    exit 1
fi

if [ ! -f /tmp/.synthesis_tested ]; then
    echo "Synthesis test marker /tmp/.synthesis_tested not found. Please follow the instructions to create and run the script before deleting."
    exit 1
fi

echo "=========================================================="
echo "  Mini-Lab Synthesis Challenge Completed Successfully!    "
echo "  Run 'club-submit' in your terminal to claim your XP!    "
echo "=========================================================="
exit 0
