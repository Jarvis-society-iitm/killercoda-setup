# Step 3: Inodes and Hard vs. Symbolic Links

From memory to disk:
- A file's data is like a heavy coat.
- The **inode (index node)** is the coat-check ticket: it records where the file is stored, its size, owner, permissions, and timestamps.
- The **filename** is just a label pinned to that ticket. Several labels (names) can point to the same ticket (inode).

### Hard Links vs. Symbolic Links:
| Feature | Hard Link (`ln target link`) | Symbolic (Soft) Link (`ln -s target link`) |
|---|---|---|
| **What it is** | A second name for the same file | A tiny separate file holding a path |
| **Inode** | **Shares the same inode** | **Has its own inode** |
| **Shown in `ls -l`** | Looks like a normal file (link count goes up) | Starts with `l` and shows `link -> target` |
| **Original Deleted** | **Data survives** (freed only when link count reaches 0) | **Link breaks** (dangling link) |
| **Link a directory** | No | Yes |
| **Cross filesystems** | No (same disk partition only) | Yes |

---

### Instructions:

1. **Create Base Test File**:
   ```bash
   cd /root/w3s1_lab
   echo "hello" > test.txt
   ```

2. **Inspect File Inode & Metadata**:
   View the inode number and detailed metadata:
   ```bash
   ls -li test.txt
   stat test.txt
   ```
   Notice the inode number in the first column and `Links: 1`.

3. **Create a Hard Link**:
   Create a hard link named `hard.txt`:
   ```bash
   ln test.txt hard.txt
   ls -li test.txt hard.txt
   ```
   Notice:
   - Both `test.txt` and `hard.txt` share the **exact same inode number**.
   - The link count (column 3) increased to **2**. Both names point directly to the same data on disk!

4. **Create a Symbolic Link**:
   Create a symbolic link named `soft.txt`:
   ```bash
   ln -s test.txt soft.txt
   ls -li test.txt hard.txt soft.txt
   ```
   Notice:
   - `soft.txt` has a **brand new, distinct inode number**.
   - In `ls -l`, it starts with `l` and displays `soft.txt -> test.txt`.

5. **Observe Original Deletion Behavior**:
   Remove the original file `test.txt`:
   ```bash
   rm test.txt
   ```
   Now test reading both links:
   - Read the hard link:
     ```bash
     cat hard.txt
     ```
     *(The data prints `hello`—the data survived!)*
   - Try reading the soft link:
     ```bash
     cat soft.txt
     ```
     *(Fails with `cat: soft.txt: No such file or directory` because the target path no longer exists!)*

6. **Restore the Original File**:
   Re-create `test.txt`:
   ```bash
   echo "hello restored" > test.txt
   ```
   Verify that `soft.txt` works again:
   ```bash
   cat soft.txt
   ```

Click **Check** below to verify your links and inodes.
