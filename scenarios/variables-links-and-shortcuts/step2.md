# Step 2: Shell vs Environment Variables & Child Shells

In Linux, think of variables like sticky notes:
- **Variable**: A named container holding a piece of text or data.
- **Shell Variable**: A note stuck to your current terminal only. When you open a new window or run a program/script, it cannot see it.
- **Environment Variable**: A note whose copy is handed to every program the shell starts (its child programs).

### Core Syntax:
- **Create**: `NAME="value"` (no spaces around the `=` sign!).
- **Read**: `echo $NAME` (`$` means "give me the value").
- **Remove**: `unset NAME` removes the variable from memory.
- **Export**: `export NAME` promotes a shell variable to an environment variable.
- **Inspect**:
  - `printenv` (or `env`): Shows exported environment variables only.
  - `set`: Shows everything (shell variables, environment variables, and functions).

---

### Instructions:

1. **Create Lab Workspace**:
   ```bash
   mkdir -p /root/w3s1_lab && cd /root/w3s1_lab
   ```

2. **Create a Shell Variable & Test Child Shell Isolation**:
   Create a shell variable named `CITY`:
   ```bash
   CITY="London"
   echo $CITY
   ```
   Now ask a child subshell to read it:
   ```bash
   bash -c 'echo $CITY'
   ```
   Notice that the child shell prints a blank line! The child shell cannot see shell variables.

3. **Make It an Environment Variable with `export`**:
   Export `CITY` so child processes can inherit it:
   ```bash
   export CITY
   ```
   Now ask the child subshell again:
   ```bash
   bash -c 'echo $CITY'
   ```
   Now the child shell prints `London`!

4. **Verify Export with `printenv`**:
   Verify that `CITY` appears in `printenv` and save it to a verification file:
   ```bash
   printenv CITY > /root/w3s1_lab/city_var.txt
   ```

5. **Clean Up with `unset`**:
   Remove the variable:
   ```bash
   unset CITY
   echo "CITY is now: '$CITY'"
   ```

6. **Create Club Session Variable**:
   Create and export a session variable `SESSION_NAME="Variables-and-Links"`:
   ```bash
   export SESSION_NAME="Variables-and-Links"
   printenv SESSION_NAME > /root/w3s1_lab/session_var.txt
   ```

Click **Check** below to verify your variables setup.
