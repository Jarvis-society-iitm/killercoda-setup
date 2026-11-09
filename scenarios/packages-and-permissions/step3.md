# Step 3: Decoding `ls -l` & Identity Inspection

When software is installed, where does it live and who controls it?
Every file in Linux has an owner user, a group, and a 10-character permission mode string.

### Understanding `ls -l` Fields:
Example:
```text
-rwxr-xr-x 1 root root 179896 Nov  1 10:00 /usr/bin/htop
```
- `-`: Regular file (`d` = directory, `l` = symlink)
- `rwxr-xr-x`: Owner has `rwx`, Group has `r-x`, Others have `r-x`
- `root root`: Owned by user `root` and group `root`

---

### Instructions:
1. **Inspect Identity & Groups**:
   Check your current username and group memberships:
   ```bash
   whoami
   id
   ```
   Save your `id` output into a report file:
   ```bash
   id > /root/my_identity.txt
   ```

2. **Inspect Installed System Binaries**:
   Look at the permissions of the `tree` and `htop` binaries installed in `/usr/bin/`:
   ```bash
   ls -l $(which tree)
   ls -l $(which htop)
   ```
   Save the long listing of both binaries to `/root/installed_bins.txt`:
   ```bash
   ls -l $(which tree) $(which htop) > /root/installed_bins.txt
   ```

3. **Inspect Directory Permissions with `ls -ld`**:
   Notice that running `ls -l /etc` lists contents *inside* `/etc`, but `ls -ld /etc` shows the permission string of `/etc` *itself*.
   Save the directory permissions of `/etc` and `/tmp`:
   ```bash
   ls -ld /etc /tmp > /root/dir_modes.txt
   ```

Click **Check** below to validate your identity and mode inspection reports.
