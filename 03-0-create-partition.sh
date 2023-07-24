#!/bin/bash

# List available disk devices and filter for devices larger than 20GB
echo "Available disks larger than 20GB:"
lsblk -d -o NAME,SIZE | grep -E '^(sd[a-z]|nvme)' | awk '{print $1, "(" $2 ")"}'

# Prompt user to select a disk device to partition
echo "Please select a disk device to partition (just name, pre /dev/** auto added):"
read disk

# Create a new partition on the selected disk device using fdisk
echo "Creating a new partition on $disk..."
echo "n/p/1/ENTER/+20*1024mb/w" 
fdisk /dev/$disk


echo "list current all partitions:"
lsblk -o NAME,MOUNTPOINT,SIZE,TYPE /dev/sda /dev/nvme0n1 | grep -E '^sd[a-z]|^nvme+|^├─|^└─'

# Prompt user to select a disk device to partition
echo "Please in put the name of the partition you created:"
read partition

# Format the new partition as ext4 using mkfs
echo "Formatting the new partition $partition as ext4..."
# mkfs -v -t ext4 /dev/${disk}1 
mkfs.ext4 /dev/$partition

echo "Partition creation complete."





