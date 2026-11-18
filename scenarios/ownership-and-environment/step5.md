# Step 5: Terminal Text Editing with Nano & Vim

As a Linux systems engineer, modifying configurations via the terminal without a GUI is an essential daily skill.

---

### Part 1: Nano (Simple Modeless Editor)
Nano displays handy shortcut hints at the bottom of the screen (`^` indicates the `Ctrl` key).
- `Ctrl+O` followed by `Enter`: **Write Out** (save changes to disk).
- `Ctrl+X`: **Exit** Nano.
- `Ctrl+W`: Search for keywords.

#### Nano Exercise:
1. Create a configuration file with Nano:
   ```bash
   nano /root/service_config.env
   ```
2. Type or paste the following text:
   ```text
   ENVIRONMENT=production
   SERVER_NAME=olympus-node-1
   PORT=8080
   ```
3. Press `Ctrl+O`, then `Enter` to save.
4. Press `Ctrl+X` to exit.
5. Verify the file contents on disk:
   ```bash
   cat /root/service_config.env
   ```

---

### Part 2: Vim (The Modal Powerhouse)
Vim operates in **modes**:
1. **Normal mode** (Default): Navigate text and execute edit commands (`dd` to delete a line, `u` to undo).
2. **Insert mode**: Type text into the file. Press `i` to enter Insert mode. Press `Esc` to return to Normal mode.
3. **Command mode**: Save and quit. Press `:` from Normal mode:
   - `:wq` + `Enter`: Write changes and quit.
   - `:q!` + `Enter`: Quit **without saving** (safely discard changes).

#### Vim Exercise:
1. Open a new file in Vim:
   ```bash
   vim /root/modal_notes.txt
   ```
2. Press `i` to enter **Insert mode** (notice `-- INSERT --` at the bottom).
3. Type:
   ```text
   Mastering Vim modal editing is essential for Linux administration.
   This second line is a temporary draft line.
   ```
4. Press `Esc` to return to **Normal mode**.
5. Move your cursor to the second line and press `dd` to delete the line.
6. Press `u` once to **undo** the deletion.
7. Type `:wq` and press `Enter` to save and exit.
8. Verify with `cat`:
   ```bash
   cat /root/modal_notes.txt
   ```

---

### Final Submission:
When complete, click **Check** below to validate your files. Once all checks pass, run:
```bash
club-submit
```
in your terminal to record your completion on the **Jarvis Linux Club Leaderboard**!

