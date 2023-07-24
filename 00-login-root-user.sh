#!/bin/bash

# Check if the current user is root
if [ "$(whoami)" != "root" ]; then
    echo "This script requires root privileges. Please enter the root password."
    sudo su
    exit
fi

# If the script is running as root, continue here
echo "You are currently logged in as root."
