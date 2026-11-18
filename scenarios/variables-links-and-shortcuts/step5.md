# Step 5: Fast Navigation & Readline Shortcuts

GNU Readline is the library Bash uses so you can edit commands quickly: move around, cut, paste, and search old commands without touching a mouse.

### Readline Reference (Slide 12):
1. **Type this without pressing Enter**:
   ```bash
   echo one two three four five
   ```
2. **Press `Ctrl + A`**: Cursor jumps to the start.
3. **Press `Ctrl + E`**: Cursor jumps to the end.
4. **Press `Alt + B`** a few times: Cursor hops back word-by-word. (If Alt does not work in your browser, press `Esc` then `b`).
5. **Press `Ctrl + U`**: Cuts the entire line.
6. **Press `Ctrl + Y`**: Pastes (yanks) what you just cut back onto the screen.
7. **Press `Enter`** to run it!
8. **Press `Ctrl + R`**: Interactive history search. Type `echo` and press `Enter` to rerun it from history.
9. **Tab Completion**: Type `cd /et` and press `Tab`. It completes to `/etc/`.
10. **Repeat Last Command**: Run `!!` to repeat the last command.
11. **Clear Screen**: Press `Ctrl + L` (or run `clear`).

---

### Verification Task:
Record your completed practice:
```bash
echo "Readline practice completed" > /root/w3s1_lab/readline_done.txt
```

---

### Final Submission:
When complete, click **Check** below to validate. Once all checks pass, run:
```bash
club-submit
```
in your terminal to record your completion on the **Jarvis Linux Club Leaderboard**!
