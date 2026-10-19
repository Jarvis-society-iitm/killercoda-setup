#!/usr/bin/env bash
# Step 2 Verification

# Check gate
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

FILE="/root/workspace/secret.txt"
if [ ! -f "$FILE" ]; then
    echo "File $FILE does not exist."
    exit 1
fi

CONTENT=$(cat "$FILE" 2>/dev/null | tr -d '[:space:]')
if [ "$CONTENT" != "JarvisLinuxRocks" ]; then
    echo "File content is incorrect. Expected 'JarvisLinuxRocks'."
    exit 1
fi

PERMS=$(stat -c "%a" "$FILE" 2>/dev/null)
if [ "$PERMS" != "600" ]; then
    echo "File permissions are $PERMS, expected 600."
    exit 1
fi

echo "Step 2 validated successfully."
exit 0

