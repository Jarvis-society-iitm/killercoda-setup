# Step 2: Shell vs Environment Variables & Child Shells

In Linux, think of variables like sticky notes:
- **Shell Variable**: A note stuck to your current terminal only. When you open a child shell or run a script, it cannot see this variable.
- **Environment Variable**: An exported note. Every child program or subshell receives an exact copy.

### Fundamental Rules:
- **Assignment**: `NAME="value"` (no spaces around the `=` sign!).
- **Expansion / Reading**: `$NAME` tells the shell to retrieve the value.
- **Exporting**: `export NAME` promotes a shell variable to an environment variable.
- **Removing**: `unset NAME` removes the variable completely from memory.

---

### Instructions:

1. **Create Lab Workspace**:
   ```bash
   mkdir -p /root/w3s1_lab && cd /root/w3s1_lab
   ```

2. **Demonstrate Shell Variable Isolation**:
   Create a shell variable:
   ```bash
   MY_SECRET="OlympusVault2026"
   echo $MY_SECRET
   ```
   Now test whether a child subshell can read it:
   ```bash
   bash -c 'echo "Child sees: $MY_SECRET"'
   ```
   Notice that the child shell prints a blank value!

3. **Promote to an Environment Variable with `export`**:
   Export `MY_SECRET` so child processes can inherit it:
   ```bash
   export MY_SECRET
   ```
   Now test again with the child subshell:
   ```bash
   bash -c 'echo "Child sees: $MY_SECRET"'
   ```
   Now the child process successfully reads `OlympusVault2026`!

4. **Inspect `printenv` vs `set`**:
   - `printenv` (or `env`) displays exported environment variables only.
   - `set` displays everything: shell variables, environment variables, and shell functions.
   
   Capture your exported variable with `printenv` and save it to a verification file:
   ```bash
   printenv MY_SECRET > /root/w3s1_lab/exported_var.txt
   ```

5. **Create a Managed Club Variable**:
   Create and export a variable named `CLUB_COHORT`:
   ```bash
   export CLUB_COHORT="Jarvis-Week3-Foundations"
   echo "$CLUB_COHORT" > /root/w3s1_lab/cohort.txt
   ```

Click **Check** below to verify your variables setup.
