#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -d /root/scripts ]; then
    echo "Directory /root/scripts not found. Please create it with: mkdir -p ~/scripts"
    exit 1
fi

if [ ! -f /root/scripts/hello ]; then
    echo "Script /root/scripts/hello not found."
    exit 1
fi

if [ ! -x /root/scripts/hello ]; then
    echo "Script /root/scripts/hello is not executable. Run: chmod u+x ~/scripts/hello"
    exit 1
fi

if ! grep -q 'export PATH=.*scripts' /root/.bashrc 2>/dev/null; then
    echo "~/.bashrc does not contain the expected export PATH line. Please add: export PATH=\"\$PATH:\$HOME/scripts\""
    exit 1
fi

if [ ! -f /root/extended_path.txt ]; then
    echo "/root/extended_path.txt not found. Please run: echo \$PATH > /root/extended_path.txt"
    exit 1
fi

if ! grep -q "/root/scripts" /root/extended_path.txt; then
    echo "/root/extended_path.txt does not contain /root/scripts. Ensure you ran: source ~/.bashrc"
    exit 1
fi

# Execute hello from /tmp to verify global resolution
OUTPUT=$(cd /tmp && PATH="$PATH:/root/scripts" hello 2>/dev/null)
if ! echo "$OUTPUT" | grep -qi "Jarvis"; then
    echo "Executing 'hello' from /tmp did not produce expected output."
    exit 1
fi

echo "Task 3 (Persistent ~/.bashrc & Extended \$PATH) verified successfully!"
exit 0

