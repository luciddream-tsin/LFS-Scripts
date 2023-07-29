#!/bin/bash

# Check if lfs group exists
if ! grep -q "^lfs:" /etc/group; then
  echo "Creating lfs group..."
  groupadd lfs
fi

# Check if lfs user exists
if ! id -u lfs > /dev/null 2>&1; then
  echo "Creating lfs user..."
  # Create lfs user and add to lfs group
  useradd -s /bin/bash -g lfs -m -k /dev/null lfs
  
  # Set password for lfs user
  passwd lfs

fi
  

case $(uname -m) in
    x86_64) chown -v lfs $LFS/lib64 ;;
esac

# Set ownership of $LFS directory
chown -v lfs $LFS/{usr{,/*},lib*,var,etc,bin,sbin,tools}
