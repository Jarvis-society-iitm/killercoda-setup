# Step 5: Live Lab Execution & Synthesis Challenge

Now it's time to assemble the complete live lab synthesis from Slide 11 (`system_specs.txt`)!

### 🏆 The Checklist & Challenge:
Execute the operations sequentially from your home directory (`cd ~`):

1. Switch to your home directory:
   ```bash
   cd ~
   ```
2. Run `lscpu` and redirect the full output to `system_specs.txt` using `>`:
   ```bash
   lscpu > system_specs.txt
   ```
3. Run `free -h` and **append** the output to the same file using `>>`:
   ```bash
   free -h >> system_specs.txt
   ```
4. Build the directory pipeline: list all files in `/` (or `~`), sort them, and capture the top 5 results:
   ```bash
   ls -la / | sort | head -n 5
   ```
5. **Append** the pipeline output to `system_specs.txt`:
   ```bash
   ls -la / | sort | head -n 5 >> system_specs.txt
   ```
6. Inspect the resulting file:
   ```bash
   cat system_specs.txt
   ```
   *Verify it has the `Architecture:` section from `lscpu`, the `Mem:` and `Swap:` lines from `free -h`, and the 5 directory lines.*

7. Build the Hardware Snapshot preview (`~/system_snapshot.txt`) as outlined in Slide 12 for the Weekly Challenge:
   ```bash
   uname -a > system_snapshot.txt
   uptime >> system_snapshot.txt
   df -h / >> system_snapshot.txt
   free -h >> system_snapshot.txt
   ```

---

### 🎉 Final Submission for XP:
Once you verify this step, submit your complete lab to record your achievement and XP on the Jarvis Club leaderboard:
```bash
club-submit
```
