# Task 3: Introduction to Shell Scripting

Typing long commands every day is tedious. A shell script is a plain text file containing commands run from top to bottom.

### The 3 Golden Rules:
1. Start with the **shebang**: `#!/bin/bash`
2. Make it **executable**: `chmod +x script.sh`
3. Run it with **`./`** in front: `./script.sh` (the current folder is not on `$PATH`)
4. **No spaces** around `=` when setting variables (`VAR="value"`), and use `#` for comments.

---

### Tasks:

1. **Create `vars.sh` with a Shebang, Comment, and Variables**:
   Create `/root/w4s2_lab/vars.sh` (using `nano /root/w4s2_lab/vars.sh` or `cat << 'EOF'`) with these exact contents:
   ```bash
   #!/bin/bash
   # Search server.log for 404 errors
   TARGET_FILE="/root/w4s2_lab/server.log"
   SEARCH_TERM="404"
   grep $SEARCH_TERM $TARGET_FILE
   ```

2. **Pitfall Demo — Forgetting `chmod +x`**:
   Try running `./vars.sh` before making it executable:
   ```bash
   cd /root/w4s2_lab
   ./vars.sh
   ```
   You will see `Permission denied`! Now fix it with `chmod +x` and run it (saving output via `tee`):
   ```bash
   chmod +x /root/w4s2_lab/vars.sh
   ./vars.sh | tee /root/w4s2_lab/vars_output.txt
   ```
   *Expected Output*: `192.168.1.12 - [25/Nov:14:11:10] GET /missing 404 256`.

3. **Interactive Script with `read -p` and `echo`**:
   Create `/root/w4s2_lab/test.sh`:
   ```bash
   #!/bin/bash
   read -p "What is your username? " USER_NAME
   echo "Welcome to the system, $USER_NAME!"
   ```
   Make it executable and run it:
   ```bash
   chmod +x /root/w4s2_lab/test.sh
   ./test.sh
   ```
   Type your name when prompted and press Enter!

Click **Check** when done!
