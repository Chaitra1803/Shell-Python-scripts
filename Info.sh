#!/bin/bash

# System Monitor Script

while true; do
    clear

    # Display system information
    echo "System Information:"
    echo "-------------------"
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime -p)"
    echo "Load Average: $(uptime | awk -F'average:' '{print $2}')"

# Display CPU usage
    echo -e "\nCPU Usage:"
    echo "-----------"
    top -bn 1 | grep '%Cpu' | sed 's/,/ /g' | awk '{print "CPU: " $2+$4 "%, User: " $2 "%, System: " $4 "%, Idle: " $8 "%"}'

# Display Memory usage
    echo -e "\nMemory Usage:"
    echo "--------------"
    free -h

 # Display Disk usage
    echo -e "\nDisk Usage:"
    echo "------------"
    df -h / 

# Display Network information
    echo -e "\nNetwork Information:"
    echo "--------------------"
    ifconfig | grep -A 1 '^[a-z]' | awk '{print $1, $2}' | sed 's/Link encap:/ /'
   
 # Display processes
    echo -e "\nRunning Processes:"
    echo "------------------"
    ps aux --sort=-%cpu | head -n 6
# Sleep for 2 seconds before refreshing
    sleep 2
done
