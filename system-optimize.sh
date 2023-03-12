#!/bin/bash

# temp folder path
tmp_dir="/tmp /var/tmp"

# delete tmp_dir
echo "1. Removing temporary files..."
sudo rm -rf ${tmp_dir}/*

# Clear cache
echo "2. Clearing system cache..."
sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches

# delete log more than 30 days
echo "3. Removing old log files..."
sudo find /var/log -type f -mtime +30 -exec rm {} \;

# Update system packages
echo "4. Updating system packages..."
source ./up.sh

echo "Result : System maintenance completed."
