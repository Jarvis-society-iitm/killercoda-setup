# Week 2 • Session I: Provisioning & Protection in Linux

Welcome to the **IITM Jarvis Linux & Systems Club** interactive laboratory for **Week 2, Session I**!

### The Big Picture: Provision, then Protect
Think of Linux as a collaborative workshop:
1. **Provision**: How do you bring software tools into the machine safely, reliably, and repeatably using **APT**?
2. **Protect**: How do you decide who is allowed to read, change, or execute each tool and directory using **file permissions (`chmod`)**?

---

### What You Will Master in This Lab:
- **Package Management via APT**: Inspecting package indexes (`apt update`), discovering dependencies (`apt show`, `apt search`), installing tools (`apt install -y`), and verifying binaries.
- **Identity & Permission Structure**: Deciphering `whoami`, `id`, and the 10-character `ls -l` permission string (`rwx` for User, Group, and Others).
- **Symbolic Mode (`chmod`)**: Using targets (`u`, `g`, `o`, `a`), operators (`+`, `-`, `=`), and permissions (`r`, `w`, `x`) to secure files and fix `Permission denied` errors.
- **The Dual Nature of Permissions**: Understanding why `x` (execute) on directories determines whether you can `cd` inside.
- **Octal Representation**: Implementing standard industry permissions (`644`, `755`, `600`, `700`) and safe permission practices.

---

### Lab Protocol & Authentication:
Before running tasks, authenticate via the prompt in your right terminal:
1. Enter your **IITM Student Roll Number**.
2. Enter your **Lab Passkey** found on your club dashboard: [https://jarvis-linux-club.vercel.app/labs](https://jarvis-linux-club.vercel.app/labs).
3. Once authenticated, proceed to **Step 1** to verify your session.

When all steps are complete, execute `club-submit` in your terminal to record your completion and claim your **+5 XP**!
