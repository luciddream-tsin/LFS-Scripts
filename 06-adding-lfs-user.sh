# Create a new group named lfs
groupadd lfs

# Create a new user named lfs to the lfs group, with default shell bash and home dir.
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

# Give lfs a password
passwd lfs

# Grant user lfs as Owner of $LFS
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) chown -v lfs $LFS/lib64 ;;
esac

su - lfs




