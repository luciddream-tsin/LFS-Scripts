# Mounting the new partition
echo "Input the disk name, (e.g. sdb1):"
read disk
mkdir -pv $LFS
mount -v -t ext4 /dev/${disk} $LFS
