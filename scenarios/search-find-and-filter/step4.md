# Task 3: Locating Files with `find`

`grep` searches **inside** files, but what if you don't know which file to look in? `find` searches an entire directory tree using criteria like name, type, size, or depth.

### Syntax:
```text
find [PATH] [CRITERIA] [ACTION]
```
- `-type f` / `-type d`: Regular files / Directories
- `-name '*.log'`: Filename pattern (**always quote wildcards** so the shell doesn't expand them early!)
- `-size +1M`: Files larger than 1 MB
- `-maxdepth 1`: Stop after 1 level (do not recurse into subfolders)

---

### Tasks:

1. **Find all `.log` files recursively**:
   ```bash
   find /root/w4s1_lab -type f -name '*.log' | tee /root/w4s1_lab/all_logs.txt
   ```
   *Expected Output*: 5 `.log` files across `/root/w4s1_lab`, `logs/`, and `logs/archive/`.

2. **Find files larger than 1 MB (`-size +1M`)**:
   ```bash
   find /root/w4s1_lab -type f -size +1M | tee /root/w4s1_lab/large_files.txt
   ```
   *Expected Output*: `/root/w4s1_lab/logs/big_dump.bin`.

3. **Compare recursive `find` vs. `-maxdepth 1`**:
   First, list all directories under `/root/w4s1_lab`:
   ```bash
   find /root/w4s1_lab -type d
   ```
   Notice it includes `/root/w4s1_lab/logs/archive` (depth 2). Now restrict it to depth 1:
   ```bash
   find /root/w4s1_lab -maxdepth 1 -type d | tee /root/w4s1_lab/top_dirs.txt
   ```
   *Expected Output*: Only `/root/w4s1_lab`, `logs`, and `notes`.

Click **Check** when done!
