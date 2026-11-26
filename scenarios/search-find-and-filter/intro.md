# Week 4 • Session I: Search, Find, and Filter

Welcome to the **Jarvis Linux & Systems Club** interactive laboratory for **Week 4 Session I**!

### Scenario Overview
In this lab, you will practice the exact log-hunting and file-discovery toolkit from Session I:

1. **Basic Filtering with `grep`**:
   - Filter log lines directly or through pipes (`grep '404' access.log`).
   - Use `-v` (invert match), `-c` (count matches), `-i` (ignore case), `-n` (line numbers), and `-w` (whole word only).
2. **Pattern Matching with Regex & `grep -E`**:
   - Anchor patterns to the start (`^`) and end (`$`) of lines.
   - Escape literal dots (`\.`) so `.` does not match arbitrary characters.
   - Use character sets (`[45][0-9]`) and extended regex (`grep -E`) for alternation (`|`), grouping (`( )`), and exact counts (`{n}`).
3. **Locating Files with `find`**:
   - Search directory trees by type (`-type f`, `-type d`), filename pattern (`-name '*.log'`), size (`-size +1M`), and depth (`-maxdepth 1`).
   - Quote wildcard patterns so the shell does not expand them prematurely.
4. **Combining `find`, `xargs`, and `grep`**:
   - Pipe discovered file paths into `xargs` to search across multiple log files at once.
   - Safely handle filenames containing spaces using `find ... -print0 | xargs -0 ...`.

---

### Verification:
Complete each step in `/root/w4s1_lab`, click **Check** to verify your progress, and submit your score at the end with `club-submit`!
