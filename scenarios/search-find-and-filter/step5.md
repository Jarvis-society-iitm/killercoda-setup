# Task 4: Combining `find`, `xargs`, and `grep`

`find` prints file paths, while `grep` expects file names as arguments. `xargs` bridges the two.

Notice that `/root/w4s1_lab/logs/my app.log` has a **space** in its filename! Using plain `xargs` would split `my` and `app.log` into two broken paths.

### Task:
Use `find ... -print0` with `xargs -0` and `grep -E` to search **all** `.log` files under `/root/w4s1_lab` for `404` or `500`, and save the output to `/root/w4s1_lab/critical_hits.txt`:
```bash
find /root/w4s1_lab -type f -name '*.log' -print0 | xargs -0 grep -E '(404|500)' > /root/w4s1_lab/critical_hits.txt
```

Inspect `/root/w4s1_lab/critical_hits.txt` to confirm matches from `access.log`, `error.log`, and `my app.log` all appear cleanly, then click **Check**!
