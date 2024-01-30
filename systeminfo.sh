#!/bin/bash
echo "System information:"

echo "******************"

echo "Kernal Version: $(uname -r)"

echo "*******************"

echo "CPU INFO: $(uname -m)"

echo "********************"

echo "Total Memory: $(free -m)"

echo "*******************"

echo "Disk Used: $(df -h)"
