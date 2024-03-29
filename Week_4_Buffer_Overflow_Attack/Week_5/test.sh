#!/bin/bash

# This script customizes the output of the df command
# It shows the source, available space, percentage used, and target mount points
# Adds a line for the total, and specifically focuses on the /apps mount point as well

# Print the header for the table
echo -e "Filesystem\tAvailable\tUsed%\tMounted on"

# Get the main df output except the total
df -h --output=source,avail,pcent,target | grep -v "Total" | while read line; do
    echo -e "$line"
done

# Add a specific line for /apps mount point
echo -e "\nFocusing on /apps mount point:"
df -h --output=source,avail,pcent,target | grep "/apps" | while read line; do
    echo -e "$line"
done

# Calculate and display the total storage and used storage
echo -e "\nCalculating total storage and used storage:"
total=$(df -h --total | grep "total" | awk '{print $2}')
used=$(df -h --total | grep "total" | awk '{print $3}')
echo -e "Total storage: $total\nUsed storage: $used"
