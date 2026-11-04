# Step 4: Hands-On Practice 3 — Pipelines & Linux Manuals

In this step, you will connect processes using pipes (`|`) and learn how to extract quick guidance using manual pages and help utilities (Slides 8-10).

### Background & Concepts:
- **Pipes (`|`)**: Route the `stdout` of the command on the left into the `stdin` of the command on the right.
- `command1 | command2 | command3` creates an assembly line of data processing in memory.
- **Manuals & Help Tools**:
  - `man [command]`: Comprehensive reference manual. Navigation: Space/PageDown to scroll, `/keyword` to search, `q` to quit.
  - `[command] --help`: Fast, inline flag reference in your current terminal.
  - `tldr [command]`: Practical, concise community examples.

---

### Tasks:
1. Practice building a multi-stage pipeline:
   - Generate raw file list of `/etc`:
     ```bash
     ls /etc
     ```
   - Sort the output alphabetically:
     ```bash
     ls /etc | sort
     ```
   - Extract only the bottom 5 entries using `tail -n 5`:
     ```bash
     ls /etc | sort | tail -n 5
     ```
2. Save this pipeline's output directly into a file using redirection (`>`):
   ```bash
   ls /etc | sort | tail -n 5 > /tmp/bottom_etc.txt
   ```
   *Verify with `cat`:*
   ```bash
   cat /tmp/bottom_etc.txt
   ```
3. Test getting help with `uname --help`:
   ```bash
   uname --help
   ```
4. Query the practical examples for `df` with `tldr`:
   ```bash
   tldr df 2>/dev/null || man -f df
   ```

Click **Verify** once completed!

