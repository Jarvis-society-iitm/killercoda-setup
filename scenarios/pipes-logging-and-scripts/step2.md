# Task 1: Pipes as Data Pipelines (`cut`, `sort`, `uniq -c`, `head`, `wc -l`)

In Linux, the pipe (`|`) acts like a factory assembly line: each small tool does one job and passes its output to the next.

Move into `/root/w4s2_lab` and inspect `server.log`:
```bash
cd /root/w4s2_lab
cat server.log
```
Notice the 7 space-separated fields: `1: IP` · `2: -` · `3: [Time]` · `4: Method` · `5: Page` · `6: Status` · `7: Bytes`.

---

### Tasks:

1. **Step 1 — Extract (`cut`)**:
   Extract column 6 (status codes) and then practice extracting column 1 (IP addresses):
   ```bash
   cat server.log | cut -d' ' -f6
   cat server.log | cut -d' ' -f1
   ```

2. **Step 2 — Organize (`sort`) & Pitfall Demo (`uniq -c`)**:
   `uniq -c` only collapses **adjacent** duplicate lines. Run it *without* `sort` first to see why:
   ```bash
   cat server.log | cut -d' ' -f6 | uniq -c
   ```
   Notice `200` appears multiple times! Now add `sort` before `uniq -c`:
   ```bash
   cat server.log | cut -d' ' -f6 | sort | uniq -c
   ```
   *Expected Output*: `5 200`, `1 401`, `1 403`, `1 404`.

3. **Step 3 — Top Results (`sort -rn | head -n 2`) & Unique Count (`wc -l`)**:
   Sort highest-first (`-rn`) and keep the top 2 status codes, saving to `top_status.txt`:
   ```bash
   cat server.log | cut -d' ' -f6 | sort | uniq -c | sort -rn | head -n 2 | tee /root/w4s2_lab/top_status.txt
   ```
   Now count how many unique status codes exist using `wc -l`:
   ```bash
   cat server.log | cut -d' ' -f6 | sort | uniq -c | wc -l | tee /root/w4s2_lab/unique_codes_count.txt
   ```
   *Expected Output*: `4`.

4. **Step 4 — Practice on IP Addresses (Field 1)**:
   Count how many times each IP address visited, sorted highest-first, and save to `ip_counts.txt`:
   ```bash
   cat server.log | cut -d' ' -f1 | sort | uniq -c | sort -rn | tee /root/w4s2_lab/ip_counts.txt
   ```
   *Expected Output*: `3 192.168.1.10`, `2 172.16.0.2`, `2 10.0.0.5`, `1 192.168.1.12`.

Click **Check** when done!
