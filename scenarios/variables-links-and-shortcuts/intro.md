# Week 3 • Session I: Shell Variables, Links & Shortcuts

Welcome to the **Jarvis Linux & Systems Club** interactive laboratory for **Week 3 Session I**!

### Scenario Overview
In this lab, you will follow the exact progression taught in the Session I presentation:

1. **Variables: The Sticky Notes of Linux**:
   - Differentiate between **Shell Variables** (confined to the current terminal session) and **Environment Variables** (inherited by child shells).
   - Create, read, and delete variables (`NAME="value"`, `echo $NAME`, `unset NAME`).
   - Export variables to child shells (`export NAME`, test with `bash -c 'echo $NAME'`).
   - Compare `printenv` / `env` (exported variables only) vs `set` (everything).
2. **Inodes & Links: From Memory to Disk**:
   - Understand the inode as the file's ticket (storing size, owner, permissions, disk location).
   - Inspect inode numbers and link counts with `ls -li` and `stat`.
   - Create **Hard Links** (`ln target link`): share the same inode number and increment the link count; data survives when the original name is deleted.
   - Create **Symbolic Links** (`ln -s target link`): independent file containing a path; becomes broken/dangling if the target is deleted.
3. **Spotting Links & Avoiding Traps**:
   - Identify symbolic links in `ls -l` (`l` in column 1, `link -> target`).
   - Use `readlink` to print link targets.
   - Avoid common traps: argument ordering (`ln target link`), forgetting `-s`, and relative vs absolute paths.
4. **Readline Shortcuts**:
   - Line movement: `Ctrl+A` (start), `Ctrl+E` (end), `Alt+B` / `Alt+F` (by word).
   - Editing: `Ctrl+U` (cut to start), `Ctrl+Y` (paste), `Ctrl+W` (cut word).
   - History & control: `Ctrl+R` (reverse history search), `Tab` (auto-complete), `!!` (repeat last command), and `Ctrl+L` (clear).

---

### Verification:
Complete each step in the interactive terminal, click **Check** to verify your progress, and submit your score at the end with `club-submit`!
