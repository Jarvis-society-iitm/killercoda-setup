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
- `>>` : Appends stdout to the destination file without destroying existing contents.
- `<` : Feeds a file's contents into a command's stdin.
- `2>` : Isolates stderr (errors only) into a file.
- `2>&1` : Merges stderr into the same stream destination as stdout.

> [!WARNING]
> Remember the **Overwrite Mistake**! Using `>` when you meant `>>` will erase previous file contents.

---

### Tasks:
Navigate to `/tmp` and test stream separation:
```bash
cd /tmp
```

1. **Write a greeting line to `stream_test.txt` using `>`**:
   ```bash
   echo "Stream Redirection Test" > stream_test.txt
   ```
   *Expected Outcome*: Nothing is printed to your screen because stdout was redirected into `stream_test.txt`.

2. **Append a second line using `>>`**:
   ```bash
   echo "Second Line Appended" >> stream_test.txt
   ```
   *Expected Outcome*: The second line is appended to the bottom of the file without deleting the first line.

3. **Feed data via stdin (`<`) into `wc -l`**:
   ```bash
   wc -l < stream_test.txt
   ```
   *Expected Output*:
   ```text
   2
   ```
   *Explanation*: Because the file was fed via stdin (`<`), `wc` receives raw text rather than a filename argument, so it prints **only the line count (`2`)** without the filename.

4. **Isolate an error stream using `2>`**:
   Attempt to list a nonexistent directory (`/fake_directory_jarvis`) and redirect standard error into `errors.txt`:
   ```bash
   ls /fake_directory_jarvis 2> errors.txt
   ```
   *Expected Outcome*: The terminal prompt returns **completely silently**.
   *Why?* The command fails with an error, but because we used `2>`, the error stream was diverted away from your screen into `errors.txt`.

5. **Inspect `errors.txt` with `cat`**:
   ```bash
   cat errors.txt
   ```
   *Expected Output*:
   ```text
   ls: cannot access '/fake_directory_jarvis': No such file or directory
   ```
   *Explanation*: This is the expected error! It proves that the error message was successfully captured into the file instead of cluttering your terminal.

6. **Combine stdout and stderr into a single log using `2>&1`**:
   Execute a command that has both a valid target (`/etc/hostname`) and an invalid target (`/fake_directory_jarvis`), redirecting stdout to `combined.log` and merging stderr into stdout:
   ```bash
   ls /fake_directory_jarvis /etc/hostname > combined.log 2>&1
   ```
   *Expected Outcome*: Runs silently with no terminal output.

7. **Verify `combined.log` holds both success output and error output**:
   ```bash
   cat combined.log
   ```
   *Expected Output*:
   ```text
   ls: cannot access '/fake_directory_jarvis': No such file or directory
   /etc/hostname
   ```
   *Explanation*: Both streams (stdout and stderr) are merged together in the exact same log file.

Click **Verify** once completed!
