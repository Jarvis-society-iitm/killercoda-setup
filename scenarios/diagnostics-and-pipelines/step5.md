# Step 5: Live Lab Execution & Synthesis Challenge

Now it's time to assemble the complete live lab synthesis from Slide 11 (`system_specs.txt`)!

In this challenge, commands are hidden by default so you can practice recalling them yourself. If you get stuck, click **▶ Show Answer** to check the solution.

---

### 🏆 The Checklist & Challenge:

### Task 1: Switch to your home directory
Before generating project files, ensure you are in your home folder (`~` or `/root`).

<details>
<summary>▶ Show Answer</summary>

```bash
cd ~
```
*Expected Outcome*: Your shell prompt changes to `root@ubuntu:~#` (or your current directory becomes `$HOME`).

</details>

### Task 2: Processor Diagnostics
Run `lscpu` and redirect the full output into `system_specs.txt` using `>`.

<details>
<summary>▶ Show Answer</summary>

```bash
lscpu > system_specs.txt
```
*Expected Outcome*: Runs silently. Creates `system_specs.txt` containing CPU details like `Architecture:` and `CPU(s):`.

</details>

### Task 3: Memory Diagnostics
Run `free -h` and **append** the output to `system_specs.txt` using `>>` (be careful not to use `>` which would overwrite and delete your CPU details!).

<details>
<summary>▶ Show Answer</summary>

```bash
free -h >> system_specs.txt
```
*Expected Outcome*: Runs silently. The memory table (`Mem:` and `Swap:`) is appended to the bottom of `system_specs.txt`.

</details>

### Task 4: Directory Processing Pipeline
Build a pipeline that lists all files in `/` in long format including hidden items (`ls -la /`), sorts them alphabetically (`sort`), and isolates only the top 5 results (`head -n 5`).

<details>
<summary>▶ Show Answer</summary>

```bash
ls -la / | sort | head -n 5
```
*Expected Output*:
```text
drwxr-xr-x  19 root root  4096 ... .
drwxr-xr-x  19 root root  4096 ... ..
drwxr-xr-x   2 root root  4096 ... bin
drwxr-xr-x   4 root root  4096 ... boot
drwxr-xr-x  14 root root  2880 ... dev
```
*Explanation*: The pipe (`|`) transfers data entirely in memory from `ls` into `sort`, then into `head -n 5` to keep only the first 5 alphabetical rows.

</details>

### Task 5: Append Pipeline Output to Your Dossier
Execute the exact same pipeline and **append** its results to `system_specs.txt`.

<details>
<summary>▶ Show Answer</summary>

```bash
ls -la / | sort | head -n 5 >> system_specs.txt
```
*Expected Outcome*: Runs silently. The top 5 sorted lines are appended to the end of `system_specs.txt`.

</details>

### Task 6: Inspect Final Dossier
Inspect `system_specs.txt` to verify all three sections were properly collected together:

<details>
<summary>▶ Show Answer</summary>

```bash
cat system_specs.txt
```
*Expected Output*:
```text
Architecture:          x86_64
CPU(s):                ...
...
               total        used        free      ...
Mem:           ...
...
drwxr-xr-x ... .
drwxr-xr-x ... ..
... (top 5 lines from the pipeline)
```

</details>

### Task 7: Hardware Snapshot Challenge Preview
As outlined in Slide 12 for the upcoming Weekly Challenge, assemble `~/system_snapshot.txt` block-by-block using sequential appending (`uname -a`, `uptime`, `df -h /`, and `free -h`).

<details>
<summary>▶ Show Answer</summary>

```bash
uname -a > system_snapshot.txt
uptime >> system_snapshot.txt
df -h / >> system_snapshot.txt
free -h >> system_snapshot.txt
```
*Expected Outcome*: `system_snapshot.txt` is created with OS identity, current uptime, disk capacity, and available memory stacked in order.

</details>

---

### 🎉 Final Submission for XP:
Once you verify this step, execute the secure club submission command in your terminal to record your achievement and XP on the Jarvis Club leaderboard:
```bash
club-submit
```
*Expected Output*:
```text
==============================================================
        Jarvis Linux Club - Lab Completion Submission
==============================================================
Student:  25f3002130
Lab Slug: diagnostics-and-pipelines
Mode:     active

[*] Submitting completion to Jarvis Club Leaderboard...

==============================================================
                  LAB OFFICIALLY COMPLETED!                   
==============================================================
Awesome work! Lab completed successfully: +5 XP and +... $ Tokens awarded!

  ★ XP Earned: +5 XP
  ★ Total XP:  ... XP
  ★ Club Rank: #...

Check your updated profile at: https://jarvis-linux-club.vercel.app/leaderboard
==============================================================
```
