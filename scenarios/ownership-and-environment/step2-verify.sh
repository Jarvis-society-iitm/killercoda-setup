#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/ownership_lab/audit_report.txt ]; then
    echo "File /root/ownership_lab/audit_report.txt not found."
    exit 1
fi

OWNER=$(stat -c '%U' /root/ownership_lab/audit_report.txt 2>/dev/null)
GROUP=$(stat -c '%G' /root/ownership_lab/audit_report.txt 2>/dev/null)

if [ "$OWNER" != "student" ] || [ "$GROUP" != "devs" ]; then
    echo "Expected /root/ownership_lab/audit_report.txt to be owned by 'student:devs', but found '$OWNER:$GROUP'."
    exit 1
fi

if [ ! -f /root/ownership_lab/team_notes.txt ]; then
    echo "File /root/ownership_lab/team_notes.txt not found."
    exit 1
fi

TEAM_GROUP=$(stat -c '%G' /root/ownership_lab/team_notes.txt 2>/dev/null)
if [ "$TEAM_GROUP" != "devs" ]; then
    echo "Expected /root/ownership_lab/team_notes.txt group to be 'devs', but found '$TEAM_GROUP'."
    exit 1
fi

if [ ! -f /root/ownership_lab/project_tree/src/main.sh ]; then
    echo "File /root/ownership_lab/project_tree/src/main.sh not found."
    exit 1
fi

NESTED_OWNER=$(stat -c '%U' /root/ownership_lab/project_tree/src/main.sh 2>/dev/null)
NESTED_GROUP=$(stat -c '%G' /root/ownership_lab/project_tree/src/main.sh 2>/dev/null)

if [ "$NESTED_OWNER" != "student" ] || [ "$NESTED_GROUP" != "devs" ]; then
    echo "Recursive ownership failed on project_tree/src/main.sh. Expected 'student:devs', found '$NESTED_OWNER:$NESTED_GROUP'."
    exit 1
fi

if [ ! -f /root/ownership_lab_status.txt ]; then
    echo "/root/ownership_lab_status.txt not found. Please run: ls -la /root/ownership_lab > /root/ownership_lab_status.txt"
    exit 1
fi

echo "Task 1 (Ownership Management with chown & chgrp) verified successfully!"
exit 0
