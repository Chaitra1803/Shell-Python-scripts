#!/bin/bash

# Specify the log file to analyze
LOG_FILE="/var/log/syslog"

# Function to display error messages from the log
display_errors() {
    echo "=== Displaying Error Messages ==="
    grep -i "error" "$LOG_FILE"
}

# Function to count occurrences of a specific keyword
count_keyword() {
    local keyword="$1"
    echo "=== Counting occurrences of '$keyword' ==="
    grep -c "$keyword" "$LOG_FILE"
}
# Function to display the last N lines of the log
display_last_lines() {
    local lines="$1"
    echo "=== Displaying Last $lines Lines of the Log ==="
    tail -n "$lines" "$LOG_FILE"
}
# Main menu
while true; do
    echo "=== Log Analysis Menu ==="
    echo "1. Display Error Messages"
    echo "2. Count Occurrences of a Keyword"
    echo "3. Display Last N Lines of the Log"
    echo "4. Exit"

    read -p "Enter your choice (1-4): " choice
case $choice in
        1)
            display_errors
            ;;
        2)
            read -p "Enter the keyword to count: " keyword
            count_keyword "$keyword"
            ;;
        3)
            read -p "Enter the number of lines to display: " lines
            display_last_lines "$lines"
            ;;
        4)
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
	    ;;
    esac
done
