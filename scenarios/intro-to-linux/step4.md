# Step 4: Hands-On Practice 3 — Viewing Data & Safe Deletion

In this step, you will practice viewing file contents using `cat` and `head`, and explore safe directory deletion using `rm` (Slides 15-17).

### Background & Concepts:
- `cat [file]`: Concatenates and dumps the whole file to the screen (best for small files).
- `less [file]`: Interactive paging viewer for large files (`q` to quit, `space` for next page).
- `head -n [count] [file]`: Displays the first *N* lines of a file (default 10).
- `tail -n [count] [file]`: Displays the last *N* lines of a file (default 10).
- `rm [file]`: Permanently deletes a single file (remember: there is **no Recycle Bin** in Linux!).
- `rm -r [dir]`: Recursively deletes a folder and everything inside it.
- `rm -rf [dir]`: Force deletes recursively without confirmation prompts.

---

### Tasks:
1. Output the contents of the system hostname file:
   ```bash
   cat /etc/hostname
   ```
2. View just the first 3 lines of the `/etc/passwd` account database:
   ```bash
   head -n 3 /etc/passwd
   ```
3. Return to your home directory:
   ```bash
   cd ~
   ```
4. Create a folder named `garbage` with a file named `trash.txt` inside it:
   ```bash
   mkdir garbage && touch garbage/trash.txt
   ```
5. Try to delete the folder using `rm garbage`:
   ```bash
   rm garbage
   ```
   *Notice the error message:* `rm: cannot remove 'garbage': Is a directory`.
6. Permanently delete the folder and its contents using recursive removal:
   ```bash
   rm -r garbage
   ```
7. Verify with `ls` that the `garbage` directory no longer exists:
   ```bash
   ls garbage 2>&1 | tee /tmp/view_delete_done.txt
   ```
   *(Running `ls garbage` will return `ls: cannot access 'garbage': No such file or directory`)*

Click **Verify** once completed!
