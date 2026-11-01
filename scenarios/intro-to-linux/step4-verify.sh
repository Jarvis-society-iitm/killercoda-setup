#!/usr/bin/env bash
# Step 4 Verification

if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated."
    exit 1
fi

HOME_DIR="${HOME:-/root}"
if [ -d "$HOME_DIR/garbage" ] || [ -f "$HOME_DIR/garbage/trash.txt" ]; then
    echo "Directory '$HOME_DIR/garbage' still exists! Did you delete it with 'rm -r garbage'?"
    exit 1
fi

if [ ! -f /tmp/view_delete_done.txt ]; then
    echo "Verification marker /tmp/view_delete_done.txt not found. Did you run the verification command 'ls garbage 2>&1 | tee /tmp/view_delete_done.txt'?"
    exit 1
fi

echo "Hands-On Practice 3: Viewing & Safe Deletion verified successfully!"
exit 0
