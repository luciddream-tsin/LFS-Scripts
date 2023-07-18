# Create a directory to put packages
if [ -d $LFS/sources ]; then
    echo "$LFS/sources exists"
else
    echo "$LFS/sources does not exist"
    mkdir -v $LFS/sources
fi

# Download packages, https://www.linuxfromscratch.org/mirrors.html
# Way 1:
# wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
# Wat 2:

pkg_name="lfs-packages-11.2.tar"

if [ ! -f "$LFS/sources/$pkg_name" ]; then
	#rm -r $LFS/sources/$pkg_name
	wget https://mirror.dogado.de/LFS/lfs-packages/lfs-packages-11.2.tar -P $LFS/sources
fi

# Extract the tar.
cd $LFS/sources
tar -xvf $pkg_name

# Move all the packages into root of the $LFS/soruces dir.
dir=$(find . -type d -name "*11.2*")
if [ -d "$dir" ]; then
  echo "Moving contents of $dir to current directory..."
  mv "$dir"/* .
  echo "Done."
else
  echo "No directory with '11.2' in its name found in current directory."
fi

# Make sure this dir sticky mode
chmod -v a+wt $LFS/sources

