# Step 2: Hands-On Practice 1 — Navigation & Visibility

In this step, you will practice navigating the filesystem hierarchy and exploring system folders using both absolute and relative paths (Slides 7-11).

### Background & Concepts:
- `pwd` (Print Working Directory): Prints your current path.
- `cd [path]`: Changes directory. Remember:
  - `cd ~` goes to your home directory (`/root` on this system).
  - `cd ..` goes up one level to the parent directory.
  - `cd -` toggles to your previous directory.
- `ls`: Lists files.
  - `-l`: Long format (permissions, owner, size, date).
  - `-a`: Show hidden files (those starting with `.`).
  - `-la`: Combined long format with all hidden files.
- `tree`: Displays directory trees graphically.

---

### Tasks:
1. Ensure you start in your home directory:
   ```bash
   cd ~
   pwd
   ```
2. Navigate to the system log directory using an **absolute path**:
   ```bash
   cd /var/log
   pwd
   ```
3. List all files here in long format:
   ```bash
   ls -l
   ```
4. Move up one level using a **relative path**:
   ```bash
   cd ..
   pwd
   ```
   *(Your working directory should now be `/var`)*
5. List everything in `/var`, including hidden files, in long format:
   ```bash
   ls -la
   ```
6. Return to your home directory:
   ```bash
   cd ~
   ```
7. To record your completion of this step, save your current directory path to `/tmp/nav_done.txt`:
   ```bash
   pwd > /tmp/nav_done.txt
   ```

Click **Verify** once you have completed the navigation sequence!
