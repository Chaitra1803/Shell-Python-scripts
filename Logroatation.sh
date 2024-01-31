#!/bin/bash

# Define log file and rotation parameters
LOG_FILE="/var/log/syslog"
BACKUP_DIR="/home/ubuntu"
MAX_SIZE=1000000  # 1 MB

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file does not exist."
    exit 1
fi
# Check if log file exceeds the maximum size
if [ $(wc -c <"$LOG_FILE") -gt $MAX_SIZE ]; then
    # Create a timestamp for the backup file
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    
    # Move the current log file to the backup directory
    mv "$LOG_FILE" "$BACKUP_DIR/${LOG_FILE##*/}_$TIMESTAMP.log"
    
    # Create a new empty log file
    touch "$LOG_FILE"
    
    echo "Log file rotated successfully."
else
    echo "Log file size is within limits. No rotation needed."
fi

