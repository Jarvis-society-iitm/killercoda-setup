# Step 2: File Operations & Permissions

Now that you're in, let's test file permissions.

### Task:
1. Create a directory named `/root/workspace`:
   ```bash
   mkdir -p /root/workspace
   ```
2. Inside `/root/workspace`, create a file named `secret.txt` containing the text `JarvisLinuxRocks`:
   ```bash
   echo "JarvisLinuxRocks" > /root/workspace/secret.txt
   ```
3. Set the file permissions on `/root/workspace/secret.txt` so that **only the owner** has read and write permissions (`600`):
   ```bash
   chmod 600 /root/workspace/secret.txt
   ```

Click **Verify** once completed.

