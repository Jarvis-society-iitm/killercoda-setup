# Task 1: Basic Log Filtering with `grep`

Servers write thousands of log lines every minute. `grep` (*global regular expression print*) acts like a digital highlighter: it prints only the lines matching your pattern and hides the rest.

### Understanding `access.log`
Move into the lab workspace and inspect the sample web server log:
```bash
cd /root/w4s1_lab
cat access.log
```
Each line has 5 parts: `IP` · `[Date]` · `"METHOD /path"` · `Status Code` · `Reply Bytes`.
- **Status code rule of thumb**: `2xx` = success (`200`), `4xx` = visitor/client mistake (`401`, `403`, `404`), `5xx` = server mistake (`500`).

---

### Tasks:

1. **Highlight a specific status code (`grep` & `-n`)**:
   Run these directly in your terminal to see `grep` in action (notice `-n` adds the line number):
   ```bash
   grep '404' access.log
   grep -n '404' access.log
   ```
   *Expected Output*:
   ```text
   5:10.0.0.5 - [24/Nov] "GET /missing" 404 256
   ```

2. **Invert the match (`-v`) to find all non-`200` lines**:
   `-v` hides matching lines and shows everything else. Use `| tee` so you see the output **on screen** while saving it to `non_200.txt`:
   ```bash
   grep -v '200' /root/w4s1_lab/access.log | tee /root/w4s1_lab/non_200.txt
   ```
   *Expected Output*: You should see the 4 error lines (`401`, `403`, `404`, `500`).

3. **Count matching lines (`-c`)**:
   Instead of printing the lines, `-c` prints only the total count. Count how many requests happened on `24/Nov`:
   ```bash
   grep -c '24/Nov' /root/w4s1_lab/access.log | tee /root/w4s1_lab/nov24_count.txt
   ```
   *Expected Output*: `4`

4. **Pitfall Demo — Partial match vs. Whole-word match (`-w`)**:
   First, search for `25` *without* `-w`:
   ```bash
   grep '25' access.log
   ```
   Notice it matched **two** lines: `[24/Nov] ... 256` (because `256` contains `25`) and `[25/Nov]`!
   Now add `-w` (whole word only) to match only `25`:
   ```bash
   grep -w '25' /root/w4s1_lab/access.log | tee /root/w4s1_lab/day25.txt
   ```
   *Expected Output*: Only the `[25/Nov]` line appears.

Click **Check** when done!
