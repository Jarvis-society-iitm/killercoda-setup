# Task 4: Combining `find`, `xargs`, and `grep`

`find` prints a list of **file paths**, whereas `grep` needs file paths as **command-line arguments**. `xargs` acts as the bridge: it reads lines from a pipe and passes them as arguments to the next command.

### The Space-in-Filename Trap
In `/root/w4s1_lab/logs/`, there is a file named `my app.log` (with a space!).

1. **See what goes wrong with plain `xargs`**:
   ```bash
   find /root/w4s1_lab -type f -name '*.log' | xargs grep -E '(404|500)'
   ```
   Look at the error: `xargs` split `my app.log` into `my` and `app.log`, causing `No such file or directory`!

2. **Fix it safely with `-print0` and `-0`**:
   `-print0` tells `find` to separate filenames with a null character instead of a space/newline, and `xargs -0` reads that null-separated list safely:
   ```bash
   find /root/w4s1_lab -type f -name '*.log' -print0 | xargs -0 grep -E '(404|500)' | tee /root/w4s1_lab/critical_hits.txt
   ```
   *Expected Output*: All 5 matching `404` and `500` lines across `access.log`, `error.log`, **and** `my app.log`, each prefixed with its file path!

Click **Check** when done!
