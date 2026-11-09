# Step 2: Package Provisioning with APT

Linux software packages are hosted on remote repositories. To install or update software, APT synchronizes package metadata lists and dependencies.

### Key Concepts:
- `sudo apt update`: Refreshes the local index of available packages from repositories (metadata only).
- `apt show <package>`: Inspects package details, version, and dependencies before installing.
- `sudo apt install <package> -y`: Installs software along with all required dependencies.

---

### Instructions:
1. **Synchronize Package Indexes**:
   Refresh your local repository package lists:
   ```bash
   sudo apt update
   ```

2. **Inspect Package Metadata**:
   Before installing, inspect the metadata and dependencies of the `tree` utility and save its details:
   ```bash
   apt show tree > /root/tree_pkg_info.txt
   ```

3. **Install Core Utilities**:
   Install `tree` and `htop` in non-interactive mode using `-y`:
   ```bash
   sudo apt install -y tree htop
   ```

4. **Verify Installations**:
   Verify that both utilities are executable on your system:
   ```bash
   tree --version
   htop --version
   ```

When done, click **Check** to verify your package installations.
