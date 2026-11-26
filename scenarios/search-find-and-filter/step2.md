# Task 1: Basic Log Filtering with `grep`

Your lab workspace is ready at `/root/w4s1_lab`, containing `access.log` (the sample web server log from Session I).

First, move into the workspace and inspect `access.log`:
```bash
cd /root/w4s1_lab
cat access.log
```

### Tasks:
1. **Invert match (`-v`)**: Save all lines from `access.log` that did **not** return status `200` into `/root/w4s1_lab/non_200.txt`:
   ```bash
   grep -v '200' /root/w4s1_lab/access.log > /root/w4s1_lab/non_200.txt
   ```
2. **Count matches (`-c`)**: Count how many requests occurred on `24/Nov` and save the number into `/root/w4s1_lab/nov24_count.txt`:
   ```bash
   grep -c '24/Nov' /root/w4s1_lab/access.log > /root/w4s1_lab/nov24_count.txt
   ```
3. **Whole-word match (`-w`)**: Match only the whole word `25` (so `[25/Nov]` matches, but `256` does not) and save the result into `/root/w4s1_lab/day25.txt`:
   ```bash
   grep -w '25' /root/w4s1_lab/access.log > /root/w4s1_lab/day25.txt
   ```

Click **Check** when done!
