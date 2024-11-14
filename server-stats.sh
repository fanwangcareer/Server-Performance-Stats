#!/bin/bash

echo "Server Performance Statistics"
echo "============================"

# CPU Usage
echo -e "\nCPU Usage:"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo "Total CPU Usage: $cpu_usage"

# Memory Usage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2{printf "Total: %s MB, Used: %s MB, Free: %s MB, Usage: %.2f%%\n", $2, $3, $4, $3*100/$2}'

# Disk Usage
echo -e "\nDisk Usage:"
df -h | awk '$NF=="/"{printf "Total: %s, Used: %s, Free: %s, Usage: %s\n", $2, $3, $4, $5}'

# Top 5 CPU-consuming processes
echo -e "\nTop 5 CPU-consuming processes:"
ps aux --sort=-%cpu | head -n 6 | awk 'NR>1{print $2, $3"%", $11}'

# Top 5 Memory-consuming processes
echo -e "\nTop 5 Memory-consuming processes:"
ps aux --sort=-%mem | head -n 6 | awk 'NR>1{print $2, $4"%", $11}'

# Optional: Additional stats
echo -e "\nAdditional Statistics:"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}' | xargs)"
echo "Logged-in Users: $(who | wc -l)"
echo "Failed Login Attempts: $(grep "Failed password" /var/log/auth.log | wc -l)"
