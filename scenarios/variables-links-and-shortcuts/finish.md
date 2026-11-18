# Congratulations, Linux Systems Engineer! 🎉

You have successfully conquered the **Week 3 • Session I: Shell Variables, Links & Shortcuts** interactive laboratory!

### What You Demonstrated:
1. **Shell vs Environment Variables**:
   - Mastered variable scoping and isolated child subshells (`bash -c`).
   - Exported runtime variables to child processes with `export`.
   - Audited exported environment states using `printenv` and full shell variables using `set`.
2. **Prompt Engineering & Terminal Customization (`PS1`)**:
   - Configured prompt escape sequences (`\u`, `\h`, `\w`, `\t`, `\$`).
   - Styled prompts with ANSI color codes (`\e[32m`, `\e[0m`) wrapped safely inside non-printing brackets `\[ ... \]` to prevent terminal line wrapping corruption.
   - Persisted prompt definitions permanently in `~/.bashrc` and reloaded using `source`.
3. **Inodes, Hard Links & Symbolic Links**:
   - Inspected inode identity and link counts with `ls -i` and `stat`.
   - Created **Hard Links** sharing the exact same inode and observed how data survives target deletion.
   - Created **Symbolic Links** pointing to target paths and analyzed dangling link behavior.
4. **Readline Productivity Shortcuts**:
   - Mastered rapid command line movement (`Ctrl+A`, `Ctrl+E`, `Alt+B`, `Alt+F`).
   - Utilized cut & yank editing (`Ctrl+U`, `Ctrl+K`, `Ctrl+W`, `Ctrl+Y`).
   - Searched and recalled command history in real time (`Ctrl+R`, `!!`).

---

### Record Your Progress & Claim XP:
To submit your lab completion and update the club leaderboard:
```bash
club-submit
```
Once submitted, return to the **Jarvis Linux Club Portal** to celebrate your achievement and view your updated profile standing!
