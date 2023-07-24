#!/bin/bash

# Add export LFS=/mnt/lfs to the .bash_profile file in the user's home directory
if ! grep -q "export LFS=/mnt/lfs" ~/.bash_profile; then
    echo 'export LFS=/mnt/lfs' >> ~/.bash_profile
fi

# Add export LFS=/mnt/lfs to the .bash_profile file in the root user's home directory
if ! grep -q "export LFS=/mnt/lfs" /root/.bash_profile; then
    echo 'export LFS=/mnt/lfs' >> /root/.bash_profile
fi

# Add export LFS=/mnt/lfs to the .bashrc file for the current user
if ! grep -q "export LFS=/mnt/lfs" ~/.bashrc; then
    echo 'export LFS=/mnt/lfs' >> ~/.bashrc
fi

# Add export LFS=/mnt/lfs to the .bashrc file for root
if ! grep -q "export LFS=/mnt/lfs" /root/.bashrc; then
    echo 'export LFS=/mnt/lfs' >> /root/.bashrc
fi

# Reload the shell environment for the current user and root
source ~/.bash_profile
source /root/.bash_profile
source ~/.bashrc
source /root/.bashrc

echo "LFS environment variable has been added to relevant files."
echo "LFS value: $LFS"
