# Task 3: Locating Files with `find`

`ls` only looks inside one folder. `find` searches an entire directory tree by name, type, size, or depth.

### Tasks:
1. **Find by type & name**: Locate all regular files ending in `.log` under `/root/w4s1_lab` (remember to quote `'*.log'`) and save the list to `/root/w4s1_lab/all_logs.txt`:
   ```bash
   find /root/w4s1_lab -type f -name '*.log' > /root/w4s1_lab/all_logs.txt
   ```
2. **Find by size (`-size +1M`)**: Locate all regular files larger than `1M` under `/root/w4s1_lab` and save to `/root/w4s1_lab/large_files.txt`:
   ```bash
   find /root/w4s1_lab -type f -size +1M > /root/w4s1_lab/large_files.txt
   ```
3. **Limit depth (`-maxdepth 1`)**: List only directories directly inside `/root/w4s1_lab` (depth 1) and save to `/root/w4s1_lab/top_dirs.txt`:
   ```bash
   find /root/w4s1_lab -maxdepth 1 -type d > /root/w4s1_lab/top_dirs.txt
   ```

Click **Check** when done!
