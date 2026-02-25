# Windows-Systems-Security-Learning-Lab
This repository serves as my professional **technical journal**. Here, I document my daily progress and hands-on experience in **Windows Systems Administration**, **PowerShell Automation**, and **Cybersecurity Hardening**.
---

## 🚀 Daily Technical Progress

### Day 1 (18/02/2026): System Inventory & Network Discovery
* **The Goal:** Establish a baseline of the system's hardware and network configuration using CLI.
* **Scripts Created:**
    1. `scripts/01_System_Discovery.ps1`: Retrieves OS details, CPU model, RAM capacity, and Disk usage.
    2. `scripts/02_Network_Discovery.ps1`: Maps IPv4 addresses, DNS servers, and active TCP connections.
* **Technical Skills:** WMI/CIM querying, data formatting (Bytes to GB), and network stack auditing.

### Day 2 (19/02/2026): Identity & Access Management (IAM)
* **The Goal:** Automate user provisioning and audit local security privileges.
* **Scripts Created:**
    1. `scripts/03_Local_Admin_Audit.ps1`: Identifies users with administrative rights to enforce the "Principle of Least Privilege".
    2. `scripts/04_Password_Status.ps1`: Audits account hygiene, checking password expiration and last set dates.
    3. `scripts/05_Bulk_User_Provisioning.ps1`: Automates the creation of multiple local accounts for new employees.
* **Technical Skills:** Local group management, security compliance auditing, and hybrid automation using PowerShell and Command Line.

### Day 3 (23/02/2026): MES Production Support & Performance
* **The Goal:** Develop diagnostic tools for shop-floor stability and peripheral availability in MES environments.
* **Scripts Created:**
    1. `scripts/06_MES_Latency_Monitor.ps1`: Performance auditor that measures network jitter and response times against production thresholds. 
    2. `scripts/07_Peripherals_Health_Check.ps1`: Automated hardware discovery for barcode scanners and label printers to prevent line downtime.
* **Technical Skills:** Statistical analysis of network metrics, PnPDevice management, and proactive maintenance logic.

### Day 4 (25/02/2026): Software Health & Process Reliability
* **The Goal:** Ensure MES software uptime through automated log rotation and process monitoring.
* **Scripts Created:**
    1. `scripts/08_MES_Log_Maintenance.ps1`: Automated cleanup utility that removes outdated log files (>7 days) to prevent disk space exhaustion.
    2. `scripts/09_MES_Process_Watchdog.ps1`: A reliability agent that detects frozen application states and automates process recovery. 
* **Technical Skills:** Filesystem management, process lifecycle auditing, and automated fault recovery.

## 🛠️ Troubleshooting Log
### Issue: `TerminatorExpectedAtEndOfString` Error
* **Description:** While running the first script, PowerShell returned a red error indicating a string was not properly closed.
* **Root Cause:** Invisible characters or "smart quotes" (curly quotes) were introduced during the process, or the file encoding was corrupted.
* **Solution:**
    1. Deleted the corrupted `.ps1` file.
    2. Re-created the file from scratch using **UTF-8 encoding**.
    3. Manually verified that all double quotes `"` were straight and properly paired.

### Issue: `NamedParameterNotFound` & `UserNotFound` Errors
* **Description:** While running the user provisioning script, PowerShell returned red errors indicating that specific parameters (like `-PasswordExpiresAtNextLogon`) were not recognized or users were not found immediately after creation.
* **Root Cause:** **Environment mismatch:** Certain PowerShell parameters are only available in **Windows Enterprise** builds or Active Directory environments, causing compatibility issues in local lab setups.
    * **OS Latency:** The system sometimes fails to register a new user before the next command tries to modify its properties.
* **Solution:**
    1. **Hybrid Approach:** Integrated the classic `net user` command for better compatibility across all Windows versions.
    2. **Execution Timing:** Implemented `Start-Sleep` pauses to ensure the OS completes account registration before applying further changes.
    3. **File Integrity:** Deleted persistent errors by recreating the `.ps1` files from scratch using **UTF-8 encoding** to clear hidden characters.

