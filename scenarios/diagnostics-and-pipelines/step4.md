# Step 4: Hands-On Practice 3 — Pipelines & Linux Manuals

In this step, you will connect processes using pipes (`|`) and learn how to extract quick guidance using manual pages and help utilities (Slides 8-10).

### Background & Concepts:
- **Pipes (`|`)**: Route the `stdout` of the command on the left into the `stdin` of the command on the right.
- `command1 | command2 | command3` creates an assembly line of data processing in memory without temporary files.
- **Manuals & Help Tools**:
  - `man [command]`: Comprehensive reference manual. Navigation: Space/PageDown to scroll, `/keyword` to search, `q` to quit.
  - `[command] --help`: Fast, inline flag reference in your current terminal.
  - `tldr [command]`: Practical, concise community examples.

---

### Tasks:
1. **Practice building a multi-stage pipeline**:
   - Generate raw file list of `/etc`:
     ```bash
     ls /etc
     ```
     *Expected Output*: A wide, unsorted block of 100+ files and folders displayed across multiple columns.
   - Sort the output alphabetically using a pipe:
     ```bash
     ls /etc | sort
     ```
     *Expected Output*: The same list sorted in a single alphabetical column (from capital letters down to lowercase `z`).
   - Extract only the bottom 5 entries using `tail -n 5`:
     ```bash
     ls /etc | sort | tail -n 5
     ```
     *Expected Output*: Exactly 5 lines representing the last alphabetical entries in `/etc`:
     ```text
     wgetrc
     xattr.conf
     xdg
     xml
     zsh_command_not_found
     ```
     *(Note: `zsh_command_not_found` is a standard helper script installed on Ubuntu systems, not an error).*

2. **Save this pipeline's output directly into a file using redirection (`>`)**:
   ```bash
   ls /etc | sort | tail -n 5 > /tmp/bottom_etc.txt
   ```
   *Expected Outcome*: Runs silently because stdout was caught by `> /tmp/bottom_etc.txt`.

3. **Verify the saved file with `cat`**:
   ```bash
   cat /tmp/bottom_etc.txt
   ```
   *Expected Output*: The exact 5 lines extracted by your pipeline.

4. **Query inline command help**:
   ```bash
   uname --help
   ```
   *Expected Output*: Fast summary of available options (`-a`, `-s`, `-n`, `-r`, `-m`, etc.).

5. **Query practical examples with `tldr` (or fallback to `man -f`)**:
   ```bash
   tldr df 2>/dev/null || man -f df
   ```
   *Expected Output*: Common, real-world examples of running `df` with flags like `-h`.

Click **Verify** once completed!
