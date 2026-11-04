# Step 1: Club Authentication & Verification

Before executing commands, your terminal environment must authenticate with the Jarvis Linux Club server. This connects your sandbox session to your student profile so your XP and progress can be tracked.

---

### Tasks:

1. **Authenticate the Terminal**:
   The terminal will open the gate prompt automatically. If you ever need to re-authenticate manually, run:
   ```bash
   club-gate login
   ```
   *(The lab scenario is auto-detected—you only need to provide your Student Roll and Passkey).*

2. **Check Authentication Status**:
   To inspect your active session:
   ```bash
   club-gate status
   ```
   *Expected Output*:
   ```text
   ==============================================================
                ACTIVE & AUTHENTICATED LAB SESSION               
   ==============================================================
     • Student ID:   25f3002130
     • Lab Scenario: diagnostics-and-pipelines
     • Session Mode: active
     • Gate Status:  UNLOCKED
   ==============================================================
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
