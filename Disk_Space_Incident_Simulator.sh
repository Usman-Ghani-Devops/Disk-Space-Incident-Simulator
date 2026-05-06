#!/bin/bash

THRESHOLD=90
TOP_DIR="/"
TOP_N=5

echo "=== Disk Space Incident Check ==="
echo "Checking disk usage..."

# Get disk usage percentage (root partition)
USAGE=$(df -h "$TOP_DIR" | awk 'NR==2 {gsub("%",""); print $5}')

echo "Current Disk Usage: $USAGE%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is above ${THRESHOLD}%!"

    echo "=== Finding Largest Directories ==="
    echo "This may take some time..."

    du -h --max-depth=1 "$TOP_DIR" 2>/dev/null | sort -hr | head -n $TOP_N

    echo "=== Cleanup Suggestions ==="

    echo "1. Clear log files:"
    echo "   sudo truncate -s 0 /var/log/*.log"

    echo "2. Remove old package cache:"
    echo "   sudo apt clean"

    echo "3. Remove unused packages:"
    echo "   sudo apt autoremove -y"


    echo "4. Check large files manually:"
    echo "   find / -type f -size +100M 2>/dev/null"
    echo "5. Check Docker (if installed):"
    echo "   docker system prune -a"

    echo "6. Check /tmp directory:"
    echo "   sudo rm -rf /tmp/*"

else
    echo "Disk usage is under control."
fi

echo "=== Check Complete ==="
