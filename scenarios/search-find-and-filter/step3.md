# Task 2: Pattern Matching with Regex & `grep -E`

When you don't know the exact text—only its **shape**—you use a **regular expression (regex)**.

### Key Regex Rules:
| Symbol | Meaning | Example |
| :--- | :--- | :--- |
| `.` | Any **one** character | `4.4` matches `404`, `414` |
| `\.` | A **literal** dot (escaped with `\`) | `10\.0` matches `10.0`, not `10-0` |
| `^` / `$` | **Start** / **End** of line | `^10\.0` / `1024$` |
| `[...]` | Character set (one of these) | `[45]` matches `4` or `5` |

> **Critical Rule:** Always wrap regexes in **single quotes** `'...'` so the shell doesn't alter special characters before `grep` sees them.

---

### Tasks:

1. **Anchor to the start of a line (`^`) & escape dots (`\.`)**:
   Find all requests from `192.168.1.10` at the beginning of the line:
   ```bash
   grep '^192\.168\.1\.10' /root/w4s1_lab/access.log | tee /root/w4s1_lab/ip_start.txt
   ```
   *Expected Output*: 2 lines starting with `192.168.1.10`.

2. **Anchor to the end of a line (`$`)**:
   Find requests whose reply size at the very end of the line is `0`:
   ```bash
   grep ' 0$' /root/w4s1_lab/access.log | tee /root/w4s1_lab/zero_size.txt
   ```
   *Expected Output*: Only the `500 0` line (notice `200 1024` also ends in `4`, and `200 2048` doesn't end in `0`, while ` 0$` requires a space + `0` right at the end).

3. **Extended Regex with `grep -E`**:
   `grep -E` lets you use `+`, `?`, `|`, `( )`, and `{n}` without backslashes.
   Match all 3-digit status codes starting with `4` or `5` between spaces (`[45]` followed by `[0-9]{2}`):
   ```bash
   grep -E ' [45][0-9]{2} ' /root/w4s1_lab/access.log | tee /root/w4s1_lab/errors_4xx_5xx.txt
   ```
   *Expected Output*: 4 lines (`401`, `403`, `404`, `500`).

Click **Check** when done!
