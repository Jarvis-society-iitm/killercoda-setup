# Step 3: Environment Variables & Scripting

In this step, you will configure an environment variable and create an executable script.

### Task:
1. Create a bash script at `/root/workspace/run.sh`:
   ```bash
   cat << 'EOF' > /root/workspace/run.sh
   #!/usr/bin/env bash
   echo "JARVIS_MODE=$JARVIS_ENV"
   EOF
   ```
2. Make it executable (`+x`):
   ```bash
   chmod +x /root/workspace/run.sh
   ```
3. Export the environment variable `JARVIS_ENV=CYBERPUNK` and also append it to `/root/.bashrc` so that subshells inherit it:
   ```bash
   echo 'export JARVIS_ENV=CYBERPUNK' >> /root/.bashrc
   export JARVIS_ENV=CYBERPUNK
   ```

### Final Submission:
After verifying Step 3, you can officially submit your lab for XP:
```bash
club-submit
```

