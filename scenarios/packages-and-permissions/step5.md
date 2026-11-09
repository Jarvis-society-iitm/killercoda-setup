# Step 5: Octal Shortcuts & Directory Access Challenge

In systems engineering, permissions are frequently defined as **three octal digits** (Owner, Group, Others), where $r = 4$, $w = 2$, and $x = 1$.

### Standard Octal Permission Numbers:
- `644` (`-rw-r--r--`): Default file (owner edits, all read).
- `755` (`-rwxr-xr-x`): Executable binary or directory (owner edits, all execute/enter).
- `600` (`-rw-------`): Private file (SSH keys, secrets).
- `700` (`-rwx------`): Private directory.

### The Critical Rule of Directories:
On a folder, **`x` (Execute)** means permission to **enter** (via `cd`) and reach the contents inside. Without `x`, you cannot `cd` into the folder even if you have read (`r`) permission!

---

### Instructions:
Stay in or switch to `/root/permissions_lab`:
```bash
cd /root/permissions_lab
```

1. **Octal Private Key Setup**:
   Create a simulated private key file:
   ```bash
   echo "-----BEGIN RSA PRIVATE KEY-----" > id_rsa_mock
   ```
   Set its mode to private `600` using the octal shortcut:
   ```bash
   chmod 600 id_rsa_mock
   ```

2. **Octal Web Script Setup**:
   Create a public diagnostic script:
   ```bash
   echo 'echo "Status: 200 OK"' > healthcheck.sh
   chmod 755 healthcheck.sh
   ```

3. **Directory Access Architecture Challenge**:
   Build two directories under `/root/permissions_lab`:
   - `shared_portal`: A directory accessible to all users for entering and listing, but owned by root:
     ```bash
     mkdir -p shared_portal
     chmod 755 shared_portal
     ```
   - `vault_secure`: A strictly private vault folder accessible only to root:
     ```bash
     mkdir -p vault_secure
     chmod 700 vault_secure
     ```

4. **Verify Your Workspace Structure**:
   Use the `tree` utility you installed in Step 2 to inspect your directory hierarchy and modes:
   ```bash
   tree -p /root/permissions_lab
   ```

When complete, click **Check** to validate your work. Once verified, run `club-submit` in your terminal to record your score on the leaderboard!
