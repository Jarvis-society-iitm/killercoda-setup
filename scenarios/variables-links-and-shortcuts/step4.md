# Step 4: Inodes and Hard vs. Symbolic Links

In Linux, a file's data blocks are identified by an **inode (index node)**.
- The inode stores file metadata: permissions, owner, size, timestamps, and pointers to disk blocks.
- The **filename** is merely a label in a directory pointing to that inode number.

### Hard Links vs. Symbolic Links:
| Feature | Hard Link (`ln target link`) | Symbolic Link (`ln -s target link`) |
|---|---|---|
| **What it is** | A direct second name pointing to the exact same inode | A tiny text file containing the path to the target |
| **Inode Number** | Same inode number as target | Brand new, distinct inode number |
| **`ls -l` prefix** | Looks like a normal file (`-rw-r--r--`), link count increments | Starts with `l` and shows `link -> target` |
| **Original Deleted** | **Data survives** intact until all hard link names are removed | **Breaks** (dangling link, "No such file or directory") |
| **Cross Filesystem** | No (same disk partition only) | Yes (can point anywhere) |
| **Can Link Folders** | No | Yes |

---

### Instructions:

1. **Create Base Document**:
   ```bash
   cd /root/w3s1_lab
   echo "Linux Systems Engineering Core Data" > original.txt
   ```

2. **Inspect Initial Inode**:
   View the inode number and link count of `original.txt`:
   ```bash
   ls -li original.txt
   ```
   Notice column 1 is the inode number, and column 3 is the link count (`1`).

3. **Create a Hard Link**:
   Create a hard link named `hard_link.txt`:
   ```bash
   ln original.txt hard_link.txt
   ls -li original.txt hard_link.txt
   ```
   Notice they share the **exact same inode number** and the link count increased to `2`!

4. **Create a Symbolic (Soft) Link**:
   Create a symbolic link named `soft_link.txt`:
   ```bash
   ln -s original.txt soft_link.txt
   ls -li original.txt hard_link.txt soft_link.txt
   ```
   Notice that `soft_link.txt` has a **different inode number**, starts with `l`, and shows `soft_link.txt -> original.txt`.

5. **Test Target Deletion Resilience**:
   Now, remove the original file:
   ```bash
   rm original.txt
   ```
   Now test reading both links:
   - Read the hard link:
     ```bash
     cat hard_link.txt
     ```
     *(The data survived perfectly!)*
   - Try reading the soft link:
     ```bash
     cat soft_link.txt
     ```
     *(Fails with `No such file or directory` because the path it pointed to is gone).*

6. **Fix the Dangling Link & Save Inode Records**:
   Re-create `original.txt` so the soft link is restored:
   ```bash
   echo "Restored Original Data" > original.txt
   ```
   Save the long listing with inodes to `/root/w3s1_lab/links_status.txt`:
   ```bash
   ls -li /root/w3s1_lab/ > /root/w3s1_lab/links_status.txt
   ```

Click **Check** below to verify your links and inodes setup.
