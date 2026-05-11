# Disk Space Incident Simulator  

A practical Bash scripting project that simulates a real-world Linux server issue where disk space becomes critically full.  
This script automatically checks disk usage, detects incidents when usage exceeds a defined threshold, identifies large directories, and provides cleanup suggestions for system administrators.  

---

## Real World Scenario  

In production environments, servers can crash or become unstable when disk usage reaches critical levels.  
This project helps simulate and troubleshoot such incidents using Linux command-line tools and Bash scripting.  

---

## Features  

- Detects disk usage above a defined threshold  
- Monitors root partition usage  
- Finds the largest directories consuming disk space  
- Displays cleanup suggestions for quick recovery  
- Helps practice Linux troubleshooting skills  
- Simulates real-world DevOps/Linux administration tasks  

---

## Technologies Used  

- Bash Scripting  
- Linux Commands  
  - `df`  
  - `du`  
  - `awk`  
  - `sort`  
  - `head`  
  - `find`  

---

## Project Structure  

```bash
disk-space-incident-simulator/
│
├── disk_check.sh
└── README.md
```

---

## How It Works  

### 1. Checks Disk Usage  

The script checks the current disk usage of the root partition using:  

```bash
df -h /
```

---

### 2. Detects Critical Usage  

If disk usage becomes greater than or equal to `90%`, the script triggers an alert.  

```bash
THRESHOLD=90
```

---

### 3. Finds Largest Directories  

The script scans the system and displays the top largest directories.  

```bash
du -h --max-depth=1 /
```

---

### 4. Suggests Cleanup Actions  

The script provides common Linux cleanup commands such as:  

- Clearing log files  
- Cleaning package cache  
- Removing unused packages  
- Finding large files  
- Cleaning Docker resources  
- Removing temporary files  

---

## Usage  

### Make Script Executable  

```bash
chmod +x disk_check.sh
```

### Run the Script  

```bash
./disk_check.sh
```

Or run with sudo for better visibility:  

```bash
sudo ./disk_check.sh
```

---

## Sample Output  

```bash
=== Disk Space Incident Check ===
Checking disk usage...

Current Disk Usage: 92%

ALERT: Disk usage is above 90%!

=== Finding Largest Directories ===

20G /var
15G /home
8.0G /usr

=== Cleanup Suggestions ===
1. Clear log files
2. Remove old package cache
3. Remove unused packages
```

---

## Learning Outcomes  

This project helps practice:  

- Bash scripting  
- Linux system administration  
- Disk management  
- Incident troubleshooting  
- Server monitoring basics  
- Real-world troubleshooting workflows  

---

## Future Improvements  

- Email alert system  
- Log file generation  
- Automatic cleanup option  
- Monitoring multiple partitions  
- Cron job automation  
- Colored terminal output  

---

## License  

This project is open-source and available for learning and educational purposes.  
