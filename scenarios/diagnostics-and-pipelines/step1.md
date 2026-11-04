# Step 1: Club Authentication & Verification

Before executing commands, your terminal environment must authenticate with the Jarvis Linux Club server. This connects your sandbox session to your student profile so your XP and progress can be tracked.

---

### Tasks:

1. **Authenticate the Terminal**:
   The terminal prompt to the right will ask for two pieces of information:
   - **Student ID**: Enter your registered roll number (e.g. `25f3002130`).
   - **Passkey**: Enter your secure personal passkey found on your club dashboard (`~/labs`).

2. **Check Authentication Status**:
   If the prompt did not appear automatically or you ever want to check your active session:
   ```bash
   club-gate status
   ```
   *Expected Output*:
   ```json
   {
     "student_id": "25f3002130",
     "lab_slug": "diagnostics-and-pipelines",
     "mode": "active",
     "session_token": "...",
     "authenticated_at": "..."
   }
   ```
   *Explanation*: Confirms you are authenticated in **active mode** (eligible to earn XP upon completion).

3. **System Identity Check (`uname -a`)**:
   As introduced in Slide 3, test your first system diagnostic command:
   ```bash
   uname -a
   ```
   *Example Expected Output*:
   ```text
   Linux sandbox-vm 5.15.0-76-generic #83-Ubuntu SMP... x86_64
   ```
   *Breaking Down the Output (Reading Left-to-Right)*:
   - **`Linux`**: The operating system kernel name.
   - **`sandbox-vm`**: The system network hostname (nodename).
   - **`5.15.0-76-generic`**: The specific kernel release version currently running.
   - **`x86_64`**: The hardware processor architecture (64-bit AMD/Intel compatible).

Click **Verify** below once authenticated to unlock Step 2!
