# Step 4: Spotting Links, `readlink` & Avoiding Traps

### Spotting Links:
When running `ls -l`, an `l` in the very first column indicates a symbolic link:
```text
lrwxrwxrwx 1 student student 10 Nov 16 10:05 shortcut.txt -> report.txt
```
To query exactly which target path a symbolic link points to, use **`readlink`**:
```bash
readlink shortcut.txt
```

### Common Traps to Avoid:
1. **Wrong argument order**: The existing target comes first, the new link name second (`ln existing_file new_link`).
2. **Forgetting `-s`**: Plain `ln` creates a hard link, not a symbolic link.
3. **Relative target paths**: A symbolic link's relative path is resolved from the **link's own folder**. If you move the link elsewhere, it can break. Using an **absolute path** (starting with `/`) prevents this.

---

### Instructions:

1. **Create Target Document in Deep Folder**:
   ```bash
   mkdir -p /root/w3s1_lab/deep/folder
   echo "Confidential Strategy 2026" > /root/w3s1_lab/deep/folder/notes.txt
   ```

2. **Create Absolute Shortcut with `ln -s`**:
   Create a symbolic link named `quick_notes.txt` in `/root/w3s1_lab` pointing to the absolute path:
   ```bash
   ln -s /root/w3s1_lab/deep/folder/notes.txt /root/w3s1_lab/quick_notes.txt
   ```

3. **Verify with `readlink`**:
   Print the path `quick_notes.txt` points to:
   ```bash
   readlink /root/w3s1_lab/quick_notes.txt
   ```
   Save the output to `/root/w3s1_lab/link_target.txt`:
   ```bash
   readlink /root/w3s1_lab/quick_notes.txt > /root/w3s1_lab/link_target.txt
   ```

4. **Directory Symbolic Link**:
   Unlike hard links, symbolic links can link entire directories!
   Create a link named `deep_link` that points directly to `/root/w3s1_lab/deep/folder`:
   ```bash
   ln -s /root/w3s1_lab/deep/folder /root/w3s1_lab/deep_link
   ```
   Verify that listing the link reveals `notes.txt`:
   ```bash
   ls -l /root/w3s1_lab/deep_link
   ```

Click **Check** below to verify your links.
