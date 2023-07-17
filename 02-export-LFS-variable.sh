
#!/bin/bash

# Add export LFS=/mnt/lfs to the .bash_profile file in the user's home directory
echo 'export LFS=/mnt/lfs' >> ~/.bash_profile

# Add export LFS=/mnt/lfs to the .bash_profile file in the root user's home directory
echo 'export LFS=/mnt/lfs' >> /root/.bash_profile

# Add export LFS=/mnt/lfs to the .bashrc file for the current user
echo 'export LFS=/mnt/lfs' >> ~/.bashrc

# Add export LFS=/mnt/lfs to the .bashrc file for root
echo 'export LFS=/mnt/lfs' >> /root/.bashrc

source ~/.bash_profile
source /root/.bash_profile
source ~/.bashrc
source /root/.bashrc
echo "LFS environment variable has been added to relevant files."
