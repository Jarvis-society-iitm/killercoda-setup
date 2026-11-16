#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -f /root/initial_path.txt ]; then
    echo "/root/initial_path.txt not found. Please run: echo \$PATH > /root/initial_path.txt"
    exit 1
fi

if ! grep -q "/usr/bin" /root/initial_path.txt; then
    echo "/root/initial_path.txt is missing expected path directories."
    exit 1
fi

if [ ! -f /root/editor_locations.txt ]; then
    echo "/root/editor_locations.txt not found. Please run: which nano vim > /root/editor_locations.txt"
    exit 1
fi

if ! grep -q "/nano" /root/editor_locations.txt || ! grep -q "/vim" /root/editor_locations.txt; then
    echo "/root/editor_locations.txt does not contain paths to both nano and vim."
    exit 1
fi

if [ ! -f /root/system_environment.txt ]; then
    echo "/root/system_environment.txt not found. Please run: printenv > /root/system_environment.txt"
    exit 1
fi

if ! grep -q "USER=" /root/system_environment.txt || ! grep -q "HOME=" /root/system_environment.txt; then
    echo "/root/system_environment.txt is missing standard environment definitions."
    exit 1
fi

echo "Task 2 (Environment Variables) verified successfully!"
exit 0
