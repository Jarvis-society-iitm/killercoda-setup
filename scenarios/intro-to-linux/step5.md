# Step 5: Mini-Lab Synthesis Challenge

Now it's time to put everything together in the **Session I Synthesis Challenge** (Slide 18)!

### 🏆 The Challenge:
Execute the following operations safely and in order:

1. Navigate to the temporary filesystem directory:
   ```bash
   cd /tmp
   ```
2. Create the nested directory structure `project/source` using **one single command** and the `-p` parent flag:
   ```bash
   mkdir -p project/source
   ```
3. Inside `project/source`, create an empty C source file named `main.c`:
   ```bash
   touch project/source/main.c
   ```
4. Move `main.c` up one level, directly into `project/`:
   ```bash
   mv project/source/main.c project/main.c
   ```
5. Rename `project/main.c` to `script.sh`:
   ```bash
   mv project/main.c project/script.sh
   ```
6. Add an executable shell line into `project/script.sh`:
   ```bash
   echo 'echo "Jarvis Linux Club Synthesis Passed"' > project/script.sh
   chmod +x project/script.sh
   ```
7. Verify execution:
   ```bash
   ./project/script.sh
   ```
8. Save synthesis confirmation to `/tmp/.synthesis_tested`:
   ```bash
   touch /tmp/.synthesis_tested
   ```
9. Final Clean-up: Delete the entire `project` directory and everything inside it:
   ```bash
   rm -r /tmp/project
   ```

10. Verify self-check:
   ```bash
   ls /tmp/project
   ```
   *(Must output: `ls: cannot access '/tmp/project': No such file or directory`)*

---

### 🎉 Final Submission for XP:
Once you verify this step, submit your complete lab to record your achievement and XP on the Jarvis Club leaderboard:
```bash
club-submit
```
