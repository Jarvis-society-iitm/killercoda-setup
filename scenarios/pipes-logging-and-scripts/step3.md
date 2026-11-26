# Task 2: Redirection for Logging (`>`, `>>`, `2>`, `2>&1`, `tee`, `date`)

Instead of letting command output flash on screen and vanish, redirection saves it like a receipt.

### Redirection Cheat Sheet:
- `>` : Overwrite file (erases existing content!)
- `>>` : Append to bottom of file
- `2>` : Redirect **only** error messages (stderr, stream 2)
- `> file 2>&1` : Merge stdout and stderr into the same file (write `>` first, then `2>&1`)
- `tee file` : Show output on screen **and** save to a file (`tee -a` appends)

---

### Tasks:

1. **Overwrite (`>`) vs. Append (`>>`)**:
   ```bash
   echo "Hello" > /root/w4s2_lab/file.txt
   echo "World" >> /root/w4s2_lab/file.txt
   cat /root/w4s2_lab/file.txt
   ```
   *Expected Output*: `Hello` on line 1, `World` on line 2.

2. **Capture Errors Only (`2>`) and Combined Output (`2>&1`)**:
   Run `find` as the `student` user (so `/etc/ssl/private` triggers a `Permission denied` error) and save only errors to `errors.txt`:
   ```bash
   su - student -c 'find /etc -name "passwd"' 2> /root/w4s2_lab/errors.txt
   cat /root/w4s2_lab/errors.txt
   ```
   Now run `grep` on both `server.log` (exists) and `missing.log` (does not exist), saving **both** stdout and stderr together into `full_report.txt`:
   ```bash
   grep "404" /root/w4s2_lab/server.log /root/w4s2_lab/missing.log > /root/w4s2_lab/full_report.txt 2>&1
   cat /root/w4s2_lab/full_report.txt
   ```
   *Expected Output*: You should see the `404` match from `server.log` AND the `No such file or directory` error for `missing.log`!

3. **Split Output with `tee`**:
   Find all `"200"` lines in `server.log`, display them on screen, and save them to `success.txt`:
   ```bash
   grep "200" /root/w4s2_lab/server.log | tee /root/w4s2_lab/success.txt
   ```

4. **Create a Timestamped Log (`date >>`)**:
   Combine `date` and `wc -l` with `>>` to create `daily_report.txt`, then inspect it with `cat`:
   ```bash
   date >> /root/w4s2_lab/daily_report.txt
   wc -l /root/w4s2_lab/server.log >> /root/w4s2_lab/daily_report.txt
   cat /root/w4s2_lab/daily_report.txt
   ```

Click **Check** when done!
