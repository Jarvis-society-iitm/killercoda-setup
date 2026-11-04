# Step 5: Live Lab Execution & Synthesis Challenge

Now it's time to assemble the complete live lab synthesis from Slide 11 (`system_specs.txt`)!

### 🏆 The Checklist & Challenge:
Execute the operations sequentially from your home directory (`cd ~`):

1. **Switch to your home directory**:
   Navigate to `~`.

<details>
<summary>▶ Show Answer</summary>

```bash
cd ~
```

</details>

2. **Processor Diagnostics**:
   Run `lscpu` and redirect the full output into `system_specs.txt` using `>`.

<details>
<summary>▶ Show Answer</summary>

```bash
lscpu > system_specs.txt
```

</details>

3. **Memory Diagnostics**:
   Run `free -h` and **append** the output to `system_specs.txt` using `>>` (be careful not to overwrite!).

<details>
<summary>▶ Show Answer</summary>

```bash
free -h >> system_specs.txt
```

</details>

4. **Directory Processing Pipeline**:
   Build a pipeline that lists all files in `/` in long format including hidden items (`ls -la /`), sorts them alphabetically (`sort`), and isolates only the top 5 results (`head -n 5`).

<details>
<summary>▶ Show Answer</summary>

```bash
ls -la / | sort | head -n 5
```

</details>

5. **Append Pipeline Output**:
   Execute the same pipeline and **append** its results to `system_specs.txt`.

<details>
<summary>▶ Show Answer</summary>

```bash
ls -la / | sort | head -n 5 >> system_specs.txt
```

</details>

6. **Inspect Final Dossier**:
   Inspect `system_specs.txt`. Verify it contains the `Architecture:` section from `lscpu`, the `Mem:` and `Swap:` lines from `free -h`, and the top 5 directory lines.

<details>
<summary>▶ Show Answer</summary>

```bash
cat system_specs.txt
```

</details>

7. **Hardware Snapshot Challenge Preview**:
   As outlined in Slide 12 for the Weekly Challenge, assemble `~/system_snapshot.txt` block-by-block using redirection and append (`uname -a`, `uptime`, `df -h /`, and `free -h`).

<details>
<summary>▶ Show Answer</summary>

```bash
uname -a > system_snapshot.txt
uptime >> system_snapshot.txt
df -h / >> system_snapshot.txt
free -h >> system_snapshot.txt
```

</details>

---

### 🎉 Final Submission for XP:
Once you verify this step, submit your complete lab to record your achievement and XP on the Jarvis Club leaderboard:
```bash
club-submit
```
