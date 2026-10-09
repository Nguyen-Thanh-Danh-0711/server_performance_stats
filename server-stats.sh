#!/bin/bash
echo "Total CPU usage"

echo 

top -bn1 | grep "%Cpu(s)" | cut -d ',' -f 4 |awk '{print "Total CPU usage: " 100 - $1"%"}'

echo "----------"
echo "Total Memory Usage"

echo 

free -m | grep "Mem:" | awk '{printf "Total: %.2f MB\nUsed: %.2f MB (%.2f%%)\n\
Free: %.2f MB (%.2f%%)\n", \
$2, \
$3, $3 / $2 * 100, \
$4, $4 / $2 * 100}'

echo "----------"
echo "Total Disk Usage"

echo 

df -BG | grep "/" -w | awk '{printf "Total: %.0f GB\n\
Used: %.0f GB (%.2f%%)\n\
Available: %.0f GB (%.2f%%)\n", \
$2, \
$3, $3 / $2 * 100, \
$4, $4 / $2 * 100}'

echo "----------"
echo "Top 5 processes by CPU usage"

echo 

ps aux --sort=-%cpu | head -n 6 | awk '{print $2, "\t", $3, "\t", $11}'

echo "----------"
echo "Top 5 processes by memory usage"

echo

ps aux --sort=-%mem | head -n 6 | awk '{print $2, "\t", $4, "\t", $11}'
