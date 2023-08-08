#!/bin/bash
# LFS 11.2 Build Script


export LFS=/mnt/lfs

# 将$LFS/*目录的所有权更改为root用户
chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
x86_64) chown -R root:root $LFS/lib64 ;;
esac


umount $LFS/dev/pts
umount $LFS/{sys,proc,run,dev}


# 准备虚拟内核文件系统
mkdir -pv $LFS/{dev,proc,sys,run} 

# 通过 "绑定挂载" 主机系统的/dev目录到$LFS下的/dev目录，实现了/dev目录的手动挂载和填充
mount -v --bind /dev $LFS/dev

# 现在挂载剩余的虚拟内核文件系统：
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

# 进入chroot环境
chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login
