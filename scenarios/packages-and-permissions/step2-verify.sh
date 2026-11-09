#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if ! command -v tree >/dev/null 2>&1; then
    echo "Command 'tree' is not installed. Please run: sudo apt install -y tree"
    exit 1
fi

if ! command -v htop >/dev/null 2>&1; then
    echo "Command 'htop' is not installed. Please run: sudo apt install -y htop"
    exit 1
fi

if [ ! -f /root/tree_pkg_info.txt ]; then
    echo "/root/tree_pkg_info.txt not found. Please inspect the package using: apt show tree > /root/tree_pkg_info.txt"
    exit 1
fi

if ! grep -qi "Package: tree" /root/tree_pkg_info.txt; then
    echo "/root/tree_pkg_info.txt is missing expected package metadata."
    exit 1
fi

echo "Task 1 (APT Package Provisioning) verified successfully!"
exit 0
