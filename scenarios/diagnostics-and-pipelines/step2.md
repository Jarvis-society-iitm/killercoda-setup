# Step 2: Hands-On Practice 1 — System Health & Diagnostics

In this step, you will practice interrogating system health, hardware processing units, storage disks, and memory consumption (Slides 3-5).

### Background & Concepts:
- `uname -a`: Prints kernel name, network nodename, kernel release, version, and architecture (`x86_64`).
- `uptime`: Reports current time, time running, active users, and CPU load averages over the last 1, 5, and 15 minutes.
- `lscpu`: Displays detailed CPU architecture, core counts, and threads.
- `lsblk`: Lists block storage devices (`disk` physical drives and `part` partitions).
- `df -h`: Disk Filesystem summary in human-readable units (`M`/`G`). Look for the mountpoint `/` (the root filesystem).
- `free -h`: Displays RAM and Swap usage. **Key rule:** Look at **`available`**, not just `free`, to know what memory applications can actually utilize.

---

### Tasks:
Execute the diagnostics from your terminal:

1. Check your system uptime and note your 15-minute load average:
   ```bash
   uptime
   ```
2. Count your CPU cores and view CPU architecture:
   ```bash
   lscpu
   ```
3. Inspect connected block storage devices:
   ```bash
   lsblk
   ```
4. Check available storage on your root disk (`/`):
   ```bash
   df -h /
   ```
5. Check your total and available RAM:
   ```bash
   free -h
   ```
6. Record your diagnostic findings: Save the one-line summary of root disk space and RAM to `/tmp/diag_summary.txt`:
   ```bash
   df -h / > /tmp/diag_summary.txt
   free -h >> /tmp/diag_summary.txt
   ```

Click **Verify** once completed!

