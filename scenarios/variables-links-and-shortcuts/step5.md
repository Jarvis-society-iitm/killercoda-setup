# Step 5: Fast Navigation & Readline Shortcuts

GNU Readline is the line-editing library powering Bash. It allows you to navigate, cut, paste, and search your terminal commands at lightning speed without ever reaching for a mouse.

### Essential Readline Shortcuts:
| Shortcut | Action |
|---|---|
| `Tab` | Auto-complete a filename, path, or command |
| `Ctrl + A` | Jump cursor to **start** of the line |
| `Ctrl + E` | Jump cursor to **end** of the line |
| `Alt + B` / `Alt + F` | Hop **backward / forward** by one word |
| `Ctrl + U` | Cut from cursor back to the start of the line |
| `Ctrl + K` | Cut from cursor forward to the end of the line |
| `Ctrl + W` | Cut the single word before the cursor |
| `Ctrl + Y` | Yank (paste) the cut text back |
| `Ctrl + R` | Interactive reverse history search |
| `Ctrl + L` | Clear the screen (same as `clear`) |
| `!!` | Bash history shortcut to repeat the last command |

---

### Practice Exercise:

1. **Practice Line Editing**:
   Type this long command without pressing Enter yet:
   ```bash
   echo "alpha beta gamma delta epsilon"
   ```
   - Press `Ctrl + A`: Your cursor instantly jumps to the start.
   - Press `Ctrl + E`: Your cursor jumps back to the end.
   - Press `Alt + B` (or `Esc` then `b`): Your cursor hops back word-by-word.
   - Press `Ctrl + U`: The entire line is cut.
   - Press `Ctrl + Y`: The line is pasted back.
   - Press `Enter` to run the command!

2. **Practice Reverse History Search**:
   - Press `Ctrl + R`.
   - Start typing `alpha`.
   - Notice how Readline instantly finds your command `echo "alpha beta gamma delta epsilon"`!
   - Press `Enter` to run it directly from history.

3. **Log History Snapshot**:
   Bash records your session commands. Flush and save your recent commands to `/root/w3s1_lab/history_sample.txt`:
   ```bash
   history -w
   tail -n 15 ~/.bash_history > /root/w3s1_lab/history_sample.txt 2>/dev/null || history | tail -n 15 > /root/w3s1_lab/history_sample.txt
   ```

4. **Verify Final Workspace State**:
   Confirm that all lab artifacts are in place:
   ```bash
   ls -la /root/w3s1_lab/
   ```

---

### Final Submission:
When complete, click **Check** below to validate. Once all checks pass, run:
```bash
club-submit
```
in your terminal to record your completion on the **Jarvis Linux Club Leaderboard**!
