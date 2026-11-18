# Week 3 • Session I: Shell Variables, Links & Shortcuts

Welcome to the **Jarvis Linux & Systems Club** interactive laboratory for **Week 3 Session I**!

### Scenario Overview
In this lab, you will master the foundational mechanics of how Bash manages in-memory data, formats your prompt, and creates disk-level shortcuts:

1. **Variables: The Sticky Notes of Linux**:
   - Differentiate between **Shell Variables** (confined to current session) and **Environment Variables** (inherited by child shells).
   - Use `export`, `unset`, `printenv`, and `set`.
2. **Customizing & Coloring Your Prompt (`$PS1`)**:
   - Deconstruct escape sequences (`\u`, `\h`, `\w`, `\t`, `\$`).
   - Add ANSI colors (`\e[31m`, `\e[32m`, `\e[0m`) safely with `\[ ... \]` to prevent terminal wrapping bugs.
   - Persist your custom prompt in `~/.bashrc`.
3. **Inodes & Links**:
   - Inspect inode identity with `ls -i` and `stat`.
   - Create and differentiate **Hard Links** (`ln`) and **Symbolic Links** (`ln -s`).
   - Observe behavior when the original target file is deleted.
4. **Readline Shortcuts**:
   - Master line navigation (`Ctrl+A`, `Ctrl+E`, `Alt+B`, `Alt+F`), cutting/pasting (`Ctrl+U`, `Ctrl+K`, `Ctrl+W`, `Ctrl+Y`), and history search (`Ctrl+R`, `!!`).

---

### Verification:
Each task is validated by automated verification scripts. Complete every task step by step, click **Check** to verify, and finally submit your score with `club-submit`!
