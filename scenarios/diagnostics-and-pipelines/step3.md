# Step 3: Hands-On Practice 2 — Data Streams & Redirection

In this step, you will explore the three standard Linux streams and file descriptors (Slides 6-7).

### The Three Standard Streams:
| Stream | Name | File Descriptor | Default Device |
| :--- | :--- | :--- | :--- |
| **stdin** | Standard Input | `0` | Keyboard |
| **stdout** | Standard Output | `1` | Terminal Screen |
| **stderr** | Standard Error | `2` | Terminal Screen |

### Redirection Operators:
- `>` : Overwrites destination file with stdout (truncates existing file).
- `>>` : Appends stdout to the destination file.
- `<` : Feeds a file's contents into stdin.
- `2>` : Isolates stderr (errors only) into a file.
- `2>&1` : Merges stderr into the same stream destination as stdout.

> [!WARNING]
> Remember the **Overwrite Mistake**! Using `>` when you meant `>>` will erase existing file contents.

---

### Tasks:
Navigate to `/tmp` and test stream separation:
```bash
cd /tmp
```

1. Write a greeting line to `stream_test.txt` using `>`:
   ```bash
   echo "Stream Redirection Test" > stream_test.txt
   ```
2. Append a second line using `>>`:
   ```bash
   echo "Second Line Appended" >> stream_test.txt
   ```
3. Test feeding data via stdin (`<`) with `wc -l` (counts lines):
   ```bash
   wc -l < stream_test.txt
   ```
   *(Notice that unlike `wc -l stream_test.txt`, feeding via `<` prints only the number `2` without the filename!)*
4. Isolate an error stream using `2>`:
   Attempt to list a nonexistent directory `/fake_directory_jarvis` and capture only the error message to `errors.txt`:
   ```bash
   ls /fake_directory_jarvis 2> errors.txt
   ```
   *Notice nothing is printed to your screen because stderr was redirected into `errors.txt`.*
5. Inspect `errors.txt` with `cat`:
   ```bash
   cat errors.txt
   ```
6. Combine stdout and stderr into a single log file using `2>&1`:
   ```bash
   ls /fake_directory_jarvis /etc/hostname > combined.log 2>&1
   ```
   *Verify `combined.log` holds both the error and `/etc/hostname`:*
   ```bash
   cat combined.log
   ```

Click **Verify** once completed!
