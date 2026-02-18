# Windows-Systems-Security-Learning-Lab
This repository serves as my professional **technical journal**. Here, I document my daily progress and hands-on experience in **Windows Systems Administration**, **PowerShell Automation**, and **Cybersecurity Hardening**.
---

## 🚀 Daily Technical Progress

### Day 1: System Inventory & Network Discovery
* **The Goal:** Establish a baseline of the system's hardware and network configuration using CLI.
* **Scripts Created:**
    1. `scripts/01_System_Discovery.ps1`: Retrieves OS details, CPU model, RAM capacity, and Disk usage.
    2. `scripts/02_Network_Discovery.ps1`: Maps IPv4 addresses, DNS servers, and active TCP connections.
* **Technical Skills:** WMI/CIM querying, data formatting (Bytes to GB), and network stack auditing.

---

## 🛠️ Troubleshooting Log (Lessons Learned)

### Issue: `TerminatorExpectedAtEndOfString` Error
* **Description:** While running the first script, PowerShell returned a red error indicating a string was not properly closed.
* **Root Cause:** Invisible characters or "smart quotes" (curly quotes) were introduced during the copy-paste process, or the file encoding was corrupted.
* **Solution:** 1. Deleted the corrupted `.ps1` file.
    2. Re-created the file from scratch using **UTF-8 encoding**.
    3. Manually verified that all double quotes `"` were straight and properly paired.
* **Lesson:** When a syntax error persists despite the code looking "correct," recreating the file is the most reliable way to clear hidden encoding issues.

---
