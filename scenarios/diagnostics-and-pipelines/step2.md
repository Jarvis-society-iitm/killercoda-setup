# Step 2: Hands-On Practice 1 — System Health & Diagnostics

In this step, you will practice interrogating system health, hardware processing units, storage disks, and memory consumption (Slides 3-5).

### 🔍 Core Concepts & Tools:
- **`uptime`**: Reveals how long the machine has stayed powered on and the CPU load pressure.
- **`lscpu`**: Inspects CPU architecture, core counts, and hyperthreading.
- **`lsblk`**: Lists all connected physical storage devices and their partitions.
- **`df -h`**: Reports storage space on mounted filesystems in human-friendly units (`-h` = GB/MB).
- **`free -h`**: Reports physical RAM and Swap usage. **Important Rule:** Always look at the **`available`** column, not just `free`, to see what RAM your programs can actually use without slowing down the OS.

---

### Tasks:

1. **Check System Uptime and Load**:
   ```bash
   uptime
   ```
   *Example Expected Output*:
   ```text
   14:32:01 up 3 days, 4:12, 2 users, load average: 0.15, 0.05, 0.01
   ```
   *Explanation of Output Fields*:
   - `14:32:01`: Current server clock time.
   - `up 3 days, 4:12`: Total uninterrupted running time since last reboot.
   - `2 users`: Number of active logged-in terminal sessions.
   - `load average: 0.15, 0.05, 0.01`: System processor workload averaged over the last **1 minute**, **5 minutes**, and **15 minutes**.

2. **Inspect CPU Processor Details**:
   ```bash
   lscpu
   ```
   *Key Lines to Look For*:
   - `Architecture: x86_64` (Processor instruction set).
   - `CPU(s): 2` or `4` (Total virtual processing units/threads available to Linux).
   - `Model name: ...` (The exact CPU hardware model).

3. **List Block Storage Devices**:
   ```bash
   lsblk
   ```
   *Example Expected Output*:
   ```text
   NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
   sda      8:0    0   50G  0 disk 
   `-sda1   8:1    0   50G  0 part /
   ```
   *Explanation*:
   - `disk`: A physical drive (e.g. `sda`).
   - `part`: A partition carved out on that drive (e.g. `sda1`).
   - `MOUNTPOINT: /`: Tells you that partition `sda1` is attached to `/` (the root filesystem).

4. **Inspect Root Filesystem Storage Usage**:
   ```bash
   df -h /
   ```
   *Example Expected Output*:
   ```text
   Filesystem      Size  Used Avail Use% Mounted on
   /dev/sda1        50G   12G   35G  26% /
   ```
   *Explanation*:
   - `-h` turns raw byte counts into human-readable notation (`50G`, `12G`).
   - `Use% 26%`: Only 26% of your root partition is consumed; 35 GB remains available.

5. **Inspect Physical RAM & Swap Usage**:
   ```bash
   free -h
   ```
   *Example Expected Output*:
   ```text
                  total        used        free      shared  buff/cache   available
   Mem:           3.8Gi       1.2Gi       500Mi        20Mi       2.1Gi       2.4Gi
   Swap:          2.0Gi          0B       2.0Gi
   ```
   *Crucial Distinction: `free` vs `available`*:
   - `free` (500Mi) is completely untouched memory. Linux aggressively uses extra RAM for disk caching (`buff/cache`).
   - **`available`** (2.4Gi) is the true amount of RAM memory applications can claim without the OS needing to swap.

6. **Record Diagnostics to a File using Redirection**:
   Now take the output from `df -h /` and `free -h` and write both into `/tmp/diag_summary.txt`:
   ```bash
   df -h / > /tmp/diag_summary.txt
   free -h >> /tmp/diag_summary.txt
   ```
   *Explanation*:
   - `>` creates `/tmp/diag_summary.txt` and writes the disk usage.
   - `>>` **appends** the memory usage to the end of the file so the disk summary isn't erased.
   
   Verify your combined file:
   ```bash
   cat /tmp/diag_summary.txt
   ```
   *Expected Output*: You should see both the `Filesystem` table and the `Mem:` table stacked inside the same file!

Click **Verify** once completed!
