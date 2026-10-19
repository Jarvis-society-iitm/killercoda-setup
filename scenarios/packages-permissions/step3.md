# Step 3: Multi-tier Permission Audit

As specified in Week 2's Weekend Challenge, you must construct a structured permission audit environment under `/root/permission-audit/`.

### Task:
1. Create the base directory and four subdirectories:
   ```bash
   mkdir -p /root/permission-audit/public
   mkdir -p /root/permission-audit/private
   mkdir -p /root/permission-audit/shared
   mkdir -p /root/permission-audit/scripts
   ```

2. Apply precise numeric (octal) permissions:
   - **`public`**: `755` (read, write, execute for owner; read and execute for group and others)
     ```bash
     chmod 755 /root/permission-audit/public
     ```
   - **`private`**: `700` (read, write, execute exclusively for owner)
     ```bash
     chmod 700 /root/permission-audit/private
     ```
   - **`shared`**: `775` (read, write, execute for owner and group; read and execute for others)
     ```bash
     chmod 775 /root/permission-audit/shared
     ```
   - **`scripts`**: `750` (read, write, execute for owner; read and execute for group; zero access for others)
     ```bash
     chmod 750 /root/permission-audit/scripts
     ```

3. Inside `/root/permission-audit/scripts/`, create an executable script named `audit.sh`:
   ```bash
   cat << 'EOF' > /root/permission-audit/scripts/audit.sh
   #!/usr/bin/env bash
   echo "Audit completed for $USER at $(date)"
   EOF
   ```
4. Set permissions on `/root/permission-audit/scripts/audit.sh` so it is **executable only by owner (`700`)**:
   ```bash
   chmod 700 /root/permission-audit/scripts/audit.sh
   ```

Click **Verify** once completed.

