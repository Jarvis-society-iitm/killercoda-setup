# Step 4: Persistent Configuration in `~/.bashrc` & Extending `$PATH`

Variables set with `export` live only in memory (RAM). When your terminal closes, those variables vanish!
To make configurations **permanent across all sessions**, add them to `~/.bashrc`.
Every interactive Bash shell reads `~/.bashrc` at startup. To apply changes to your current terminal without logging out, execute:
```bash
source ~/.bashrc
```

---

### The Command Search Path Architecture:
By default, custom scripts in your personal folders cannot be run simply by typing their name—you must provide the path (`./my_script.sh` or `~/scripts/my_script.sh`).
To execute personal scripts from **any directory** on the system, add your scripts folder to the end of `$PATH`:
```bash
export PATH="$PATH:$HOME/scripts"
```

---

### Instructions:
1. **Create Personal Scripts Directory**:
   Create a scripts directory in your home folder:
   ```bash
   mkdir -p ~/scripts
   ```

2. **Create an Executable Custom Utility**:
   Create a script named `hello` inside `~/scripts`:
   ```bash
   echo '#!/bin/bash' > ~/scripts/hello
   echo 'echo "Jarvis Linux Systems: Path Extended Successfully!"' >> ~/scripts/hello
   chmod u+x ~/scripts/hello
   ```

3. **Extend `$PATH` Permanently in `~/.bashrc`**:
   Append the path extension to the bottom of your `~/.bashrc` file:
   ```bash
   echo 'export PATH="$PATH:$HOME/scripts"' >> ~/.bashrc
   ```

4. **Reload Configuration into Live Shell**:
   Reload `~/.bashrc` so the current session recognizes the new path:
   ```bash
   source ~/.bashrc
   ```

5. **Test Execution from an External Directory**:
   Move to the temporary directory `/tmp` and execute `hello` without any `./` or path prefix:
   ```bash
   cd /tmp
   hello
   ```
   Notice that the shell resolves `hello` directly from `$HOME/scripts`!
   Save your updated `$PATH` to `/root/extended_path.txt`:
   ```bash
   echo $PATH > /root/extended_path.txt
   ```

Click **Check** below to verify that your `$PATH` extension and script work globally.
