#!/bin/bash

wall -n "Architecture: $(uname -a)
Physical CPUs: $(echo "$(lscpu | egrep '^Core\(s\) per socket:' | egrep -o '[0-9]+')  *  $(lscpu | egrep '^Socket\(s\):' | egrep -o '[0-9]+')" | awk '{ print $1 * $3 }')
Virtual CPUs: $(lscpu | egrep '^CPU\(s\):' | egrep -o '[0-9]+')
RAM usage: $(free -m | awk 'NR == 2 { printf "%d/%d MiB (%.2f%%)\n", $3, $2, $3/$2 * 100 }')
Disk usage: $(lsblk -nb -o FSUSED,FSSIZE | awk 'BEGIN {used=0;size=0}{used+=$1;size+=$2}END{printf "%d/%d MiB (%.2f%%)\n", used / 1024 / 1024, size / 1024 / 1024, used/size * 100}')
CPU load: $(uptime | awk '{printf "Last minute: %.2f%%, last 5 minutes: %.2f%%, last 15 minutes: %.2f%%\n", $8 * 100, $9 * 100, $10 * 100}')
Last boot: $(who -b | awk '{print $3, $4}')
LVM active: $(if [[ $(lsblk -n -o TYPE) =~ "lvm" ]]; then echo "yes"; else echo "no"; fi)
Active connections: $(ss -Ht | wc -l)
Users logged in: $(users | tr ' ' '\n' | sort -u | wc -l)
Network: $(DEVICE=$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)'); echo "IPv4: $(ip -4 addr show $DEVICE | grep -Po '(?<=inet )[^/]*') ($(ip -4 link show $DEVICE | grep -Po '(?<=link/ether )\S*'))")
Sudo commands ran: $(grep sudo /var/log/auth.log | awk '{print $7, $8}' | grep "session opened" | wc -l)"
