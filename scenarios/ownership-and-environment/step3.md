# Step 3: Environment Variables (`$USER`, `$HOME`, `$PATH`, `printenv`)

An **environment variable** is a named key-value pair stored in memory that the shell and programs can query to determine system settings. By convention, variable names are in **ALL CAPS**.
To read a variable, prepend the `$` sign (e.g. `echo $USER`).

### Standard Variables:
- `$USER`: The logged-in username (e.g., `root`, `student`).
- `$HOME`: The absolute path to your home directory (`/root` or `/home/student`).
- `$SHELL`: The active login shell binary (`/bin/bash`).
- `$PATH`: A colon-separated list of directories searched in order when you type any executable command name.

---

### Instructions:
1. **Inspect Core Variables**:
   Display your current user, home directory, and shell:
   ```bash
   echo "User: $USER | Home: $HOME | Shell: $SHELL"
   ```

2. **Inspect & Save `$PATH`**:
   View how Linux searches for commands:
   ```bash
   echo $PATH
   ```
   Save your system `$PATH` string to `/root/initial_path.txt`:
   ```bash
   echo $PATH > /root/initial_path.txt
   ```

3. **Locate Executables with `which`**:
   When you run `nano` or `vim`, the shell checks `$PATH` in order. Verify where their binaries are installed:
   ```bash
   which nano
   which vim
   ```
   Save their exact locations to `/root/editor_locations.txt`:
   ```bash
   which nano vim > /root/editor_locations.txt
   ```

4. **Temporary vs Exported Variables**:
   Set a temporary shell variable (remember: **no spaces** around `=`) and export it so child processes can inherit it:
   ```bash
   export CLUB_COHORT="Jarvis-Linux-2026"
   ```
   Verify that a child subshell can read the exported variable:
   ```bash
   bash -c 'echo $CLUB_COHORT'
   ```

5. **Capture Active Environment with `printenv`**:
   Use `printenv` to output all exported environment variables, filter for your custom variable, and save the active environment snapshot:
   ```bash
   printenv > /root/system_environment.txt
   ```

Click **Check** below to validate your environment variables setup.
