#!/usr/bin/env bash
# Step 3 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

HOME_DIR="${HOME:-/root}"
SANDBOX="$HOME_DIR/sandbox"
DATA_FILE="$SANDBOX/data.csv"
ARCHIVE_DIR="$SANDBOX/archive"
BACKUP_FILE="$ARCHIVE_DIR/backup.csv"

if [ ! -d "$SANDBOX" ]; then
    echo "Directory $SANDBOX does not exist. Did you run 'mkdir sandbox' in your home folder?"
    exit 1
fi

if [ ! -f "$DATA_FILE" ]; then
    echo "File $DATA_FILE does not exist. Did you create data.csv inside sandbox?"
    exit 1
fi

if [ ! -d "$ARCHIVE_DIR" ]; then
    echo "Directory $ARCHIVE_DIR does not exist. Did you create archive inside sandbox?"
    exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
    echo "File $BACKUP_FILE does not exist. Did you move backup.csv into sandbox/archive?"
    exit 1
fi

echo "Hands-On Practice 2: Create & Move verified successfully!"
exit 0
