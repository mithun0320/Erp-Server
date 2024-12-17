#!/bin/bash

# Configuration
BASE_DIR="/home/administrator/MITHUN/erp_server"  # Change this to your ERP system's base directory
OLD_DIR_PATTERN="old_reports"          # Change this to the pattern of directories you want to delete
LOG_DIR_PATTERN="logs"                 # Change this to the pattern of log directories you want to delete
DAYS_OLD=30                            # Number of days to consider a directory obsolete

# Function to delete empty directories
delete_empty_dirs() {
    find "$BASE_DIR" -type d -empty -exec rmdir {} \; 2>/dev/null
}

# Function to delete old directories based on pattern
delete_old_dirs() {
    find "$BASE_DIR" -type d \( -name "*$OLD_DIR_PATTERN*" -o -name "*$LOG_DIR_PATTERN*" \) -mtime +$DAYS_OLD -exec rm -rf {} \;
}

# Execute the cleanup functions
delete_empty_dirs
delete_old_dirs

echo "Directory cleanup completed."
