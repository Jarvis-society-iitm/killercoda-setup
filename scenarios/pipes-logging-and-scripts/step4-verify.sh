#!/usr/bin/env bash
if [ ! -f /tmp/.jarvis_unlocked ]; then
    echo "Terminal is not authenticated. Please complete authentication in Step 1."
    exit 1
fi

if [ ! -x /root/w4s2_lab/vars.sh ]; then
    echo "Expected /root/w4s2_lab/vars.sh to exist and be executable (chmod +x)."
    exit 1
fi

if ! head -n 1 /root/w4s2_lab/vars.sh | grep -q '^#!/bin/bash'; then
    echo "Expected /root/w4s2_lab/vars.sh to start with #!/bin/bash."
    exit 1
fi

if [ ! -f /root/w4s2_lab/vars_output.txt ] || ! grep -q "404" /root/w4s2_lab/vars_output.txt; then
    echo "Expected /root/w4s2_lab/vars_output.txt to contain the 404 line from running ./vars.sh."
    exit 1
fi

if [ ! -x /root/w4s2_lab/test.sh ]; then
    echo "Expected /root/w4s2_lab/test.sh to exist and be executable (chmod +x)."
    exit 1
fi

if ! grep -q 'read -p' /root/w4s2_lab/test.sh || ! head -n 1 /root/w4s2_lab/test.sh | grep -q '^#!/bin/bash'; then
    echo "Expected /root/w4s2_lab/test.sh to start with #!/bin/bash and use 'read -p'."
    exit 1
fi

echo "Task 3 (Shell scripting) verified successfully!"
exit 0
