# Step 4: Symbolic Permission Management with `chmod`

When a file works but Linux refuses to let you execute or edit it, you see **"Permission denied"**.
To manage file permissions, use `chmod` (change mode).

### The Symbolic Formula:
$$\text{Target} + \text{Operator} + \text{Permission}$$
- **Targets**: `u` (user/owner), `g` (group), `o` (others), `a` (all)
- **Operators**: `+` (add), `-` (remove), `=` (set explicitly)
- **Permissions**: `r` (read), `w` (write), `x` (execute)

---

### Instructions:
1. **Create Lab Workspace**:
   Create a dedicated workspace directory:
   ```bash
   mkdir -p /root/permissions_lab && cd /root/permissions_lab
   ```

2. **Fix "Permission denied" on a Shell Script**:
   Create a bash script:
   ```bash
   echo 'echo "Jarvis Systems Club: Execution Unlocked"' > deploy.sh
   ```
   Try executing it:
   ```bash
   ./deploy.sh
   ```
   Notice the `bash: ./deploy.sh: Permission denied` error!
   Fix it by granting the owner execute permissions using symbolic notation:
   ```bash
   chmod u+x deploy.sh
   ./deploy.sh
   ```

3. **Secure a Sensitive Credentials File**:
   Create a secret credential file:
   ```bash
   echo "API_SECRET_KEY=jrv_prod_99218a" > secrets.env
   ```
   Remove all permissions from `group` and `others`:
   ```bash
   chmod go-rwx secrets.env
   ```
   Verify with `ls -l secrets.env` that only the owner has read/write (`-rw-------`).

4. **Protect a Configuration File from Accidental Changes (Read-Only)**:
   Create a critical config file:
   ```bash
   echo "CLUSTER_VERSION=2.4.1" > cluster.conf
   ```
   Make it strictly read-only for everyone:
   ```bash
   chmod a-w cluster.conf
   ```
   Verify that even the owner has only read access (`-r--r--r--`).

Click **Check** to verify your symbolic permission adjustments.
