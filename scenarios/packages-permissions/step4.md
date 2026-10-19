# Step 4: Custom Scripts & Persistent PATH

In Session 2, we covered environment variables (`$HOME`, `$PATH`, `$USER`) and how to permanently register custom binary directories so scripts can be executed from anywhere without `./`.

### Task:
1. Create a personal scripts directory at `/root/scripts`:
   ```bash
   mkdir -p /root/scripts
   ```
2. Create an executable utility script `/root/scripts/sysping`:
   ```bash
   cat << 'EOF' > /root/scripts/sysping
   #!/usr/bin/env bash
   echo "PONG from Jarvis Host"
   EOF
   chmod +x /root/scripts/sysping
   ```
3. Add `/root/scripts` to your `$PATH` persistently by appending the export statement to `/root/.bashrc`:
   ```bash
   echo 'export PATH="$PATH:/root/scripts"' >> /root/.bashrc
   export PATH="$PATH:/root/scripts"
   ```
4. Verify you can execute `sysping` directly from any directory:
   ```bash
   cd /
   sysping
   ```

---

### Final Submission:
Once you verify Step 4, submit your lab results to the Jarvis Leaderboard:
```bash
club-submit
```

