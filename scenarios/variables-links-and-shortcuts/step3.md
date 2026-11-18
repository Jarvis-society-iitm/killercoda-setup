# Step 3: Customizing and Coloring Your Prompt (`$PS1`)

The prompt is the text displayed before your cursor (e.g. `root@ubuntu:~#`).
In Bash, the primary prompt format is controlled by the **`PS1`** environment variable.

### Essential Escape Sequences:
| Code | Meaning |
|---|---|
| `\u` | Current username (`root` or `student`) |
| `\h` | Short hostname of the computer |
| `\w` | Full current working directory (`~` for home) |
| `\t` | Current time in 24-hour HH:MM:SS format |
| `\$` | Displays `#` if root, `$` for regular users |

### ANSI Colors & Non-Printing Brackets:
Terminal colors use ANSI escape codes:
- Red: `\e[31m`
- Green: `\e[32m`
- Reset to normal: `\e[0m`

> ⚠️ **CRITICAL RULE**: Every color code MUST be enclosed inside `\[ ... \]` (e.g., `\[\e[32m\]`).
> This tells Bash that the color sequence takes up **zero printable characters** on screen. Without `\[ ... \]`, typing long commands causes bizarre text wrapping bugs across your terminal line!

---

### Instructions:

1. **Inspect Current `$PS1`**:
   ```bash
   echo "$PS1"
   ```

2. **Test Custom Prompt in Memory**:
   Try setting a timestamped prompt with green color formatting:
   ```bash
   PS1="\[\e[32m\][\t]\[\e[0m\] \u@\h:\w\$ "
   ```
   Notice how your terminal prompt immediately updates to show the time in green!

3. **Make Your Custom Prompt Permanent in `~/.bashrc`**:
   To ensure every new shell session uses your prompt, append it to `/root/.bashrc`:
   ```bash
   echo 'PS1="\[\e[32m\][\t]\[\e[0m\] \u@\h:\w\$ "' >> /root/.bashrc
   ```

4. **Reload Bash Configuration**:
   Reload the configuration into your active shell without restarting:
   ```bash
   source /root/.bashrc
   ```

5. **Save Prompt Configuration Snapshot**:
   Save your active `PS1` string to `/root/w3s1_lab/prompt_snapshot.txt`:
   ```bash
   echo "$PS1" > /root/w3s1_lab/prompt_snapshot.txt
   ```

Click **Check** below to verify your prompt configuration.
