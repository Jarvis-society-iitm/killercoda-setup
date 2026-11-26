# Task 2: Pattern Matching with Regex & `grep -E`

Now use regular expressions (always wrapped in single quotes `'...'`) to match exact positions and shapes in `/root/w4s1_lab/access.log`.

### Tasks:
1. **Start-of-line anchor (`^`) & escaped dots (`\.`)**: Find all requests from IP `192.168.1.10` at the start of the line and save to `/root/w4s1_lab/ip_start.txt`:
   ```bash
   grep '^192\.168\.1\.10' /root/w4s1_lab/access.log > /root/w4s1_lab/ip_start.txt
   ```
2. **End-of-line anchor (`$`)**: Find all requests whose reply size at the end of the line is `0` and save to `/root/w4s1_lab/zero_size.txt`:
   ```bash
   grep ' 0$' /root/w4s1_lab/access.log > /root/w4s1_lab/zero_size.txt
   ```
3. **Extended regex (`grep -E`)**: Find all lines with a 3-digit status code starting with `4` or `5` (using `[45][0-9]{2}` between spaces) and save to `/root/w4s1_lab/errors_4xx_5xx.txt`:
   ```bash
   grep -E ' [45][0-9]{2} ' /root/w4s1_lab/access.log > /root/w4s1_lab/errors_4xx_5xx.txt
   ```

Click **Check** when done!
