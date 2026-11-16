# Step 2: Ownership Management with `chown` & `chgrp`

Every file and directory in Linux has exactly **one owner user** and **one owner group**.
Permissions (`rwx`) only take effect once the system knows whether you are the owner, a group member, or an outside user.

### Core Commands:
- `sudo chown user file`: Changes the owner user of a file.
- `sudo chgrp group file`: Changes the owner group of a file.
- `sudo chown user:group file`: Changes both the owner user and group at the same time.
- `sudo chown -R user:group directory`: Recursively applies ownership changes to a directory and everything inside it.

> ⚠️ **Important**: Changing a file's owner requires superuser (`sudo`) rights. Reversing the syntax (`group:user`) will fail—always use `user:group`!

---

### Instructions:
1. **Create Lab Workspace**:
   Create your workspace directory:
   ```bash
   mkdir -p /root/ownership_lab && cd /root/ownership_lab
   ```

2. **Create Test File & Check Initial Ownership**:
   Create a report file:
   ```bash
   echo "System Audit 2026" > audit_report.txt
   ls -l audit_report.txt
   ```
   Notice that both the owner and group are currently `root`.

3. **Transfer Ownership to Student**:
   Transfer ownership of `audit_report.txt` so that the user `student` owns it, and the group is set to `devs`:
   ```bash
   chown student:devs audit_report.txt
   ```
   Verify with `ls -l audit_report.txt` that the columns now read `student devs`.

4. **Change Group Independently with `chgrp`**:
   Create a shared team document:
   ```bash
   touch team_notes.txt
   chgrp devs team_notes.txt
   ```
   Verify that `team_notes.txt` has owner `root` and group `devs`.

5. **Recursive Directory Ownership**:
   Create a collaborative project folder tree with nested files:
   ```bash
   mkdir -p /root/ownership_lab/project_tree/src
   touch /root/ownership_lab/project_tree/README.md
   touch /root/ownership_lab/project_tree/src/main.sh
   ```
   Transfer ownership of the entire directory tree recursively to `student:devs`:
   ```bash
   chown -R student:devs /root/ownership_lab/project_tree
   ```
   Verify that `/root/ownership_lab/project_tree/src/main.sh` is now owned by `student:devs`.

6. **Save Verification Snapshot**:
   Output the long listing of your lab folder to `/root/ownership_lab_status.txt`:
   ```bash
   ls -la /root/ownership_lab > /root/ownership_lab_status.txt
   ```

Click **Check** below to verify your ownership configurations.
