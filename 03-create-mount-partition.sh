#!/bin/bash

# List available disk devices and filter for devices larger than 20GB
echo "Available disks larger than 20GB:"
lsblk -d -o NAME,SIZE | grep -E '^sd[a-z]' | awk '{print $1, "(" $2 ")"}'

# Prompt user to select a disk device to partition
echo "Please select a disk device to partition (just name, pre /dev/** auto added):"
read disk

# Create a new partition on the selected disk device using fdisk
echo "Creating a new partition on $disk..."
echo "n/p/1/ENTER/+20*1024mb/w" 
fdisk /dev/$disk


# Cautious the ${disk}1, the 1 is default number
# If you input another number when create partition, change it.

# Format the new partition as ext4 using mkfs
echo "Formatting the new partition as ext4..."
# mkfs -v -t ext4 /dev/${disk}1 
mkfs.ext4 /dev/${disk}1

echo "Partition creation complete."

# Mounting the new partition
mkdir -pv $LFS
mount -v -t ext4 /dev/${disk}1 $LFS




