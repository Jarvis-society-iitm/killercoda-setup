# Week 4 • Session II: Pipes, Logging & Scripts

Welcome to the **Jarvis Linux & Systems Club** interactive laboratory for **Week 4 Session II**!

### Scenario Overview
In this lab, you will connect small Linux tools into data pipelines, capture logs with redirection, and automate your workflow with Bash scripts:

1. **Pipes as Data Pipelines**:
   - Chain `cut`, `sort`, `uniq -c`, `sort -rn`, `head`, and `wc -l` to analyze `server.log`.
   - See firsthand why `uniq` requires `sort` first.
2. **Redirection for Logging**:
   - Use `>` (overwrite) vs `>>` (append) to build files.
   - Isolate errors with `2>` and merge streams with `> file 2>&1`.
   - Split output to both screen and file with `tee`, and create timestamped logs with `date >>`.
3. **Introduction to Shell Scripting**:
   - Write scripts starting with `#!/bin/bash` and `#` comments.
   - Make scripts executable with `chmod +x` and run them with `./`.
   - Use script variables (`VAR="value"`, `$VAR`) and interactive input (`read -p`).

---

### Verification:
Follow each step in `/root/w4s2_lab`, observe every command's output in your terminal, click **Check** to verify, and submit your score at the end with `club-submit`!
