# Create a limited directory layout





if [ ! -d "$LFS/etc" ]; then
    mkdir -pv "$LFS/etc"
fi

if [ ! -d "$LFS/var" ]; then
    mkdir -pv "$LFS/var"
fi

if [ ! -d "$LFS/usr/bin" ]; then
    mkdir -pv "$LFS/usr/bin"
fi

if [ ! -d "$LFS/usr/lib" ]; then
    mkdir -pv "$LFS/usr/lib"
fi

if [ ! -d "$LFS/usr/sbin" ]; then
    mkdir -pv "$LFS/usr/sbin"
fi

if [ ! -L "$LFS/bin" ]; then
    ln -sv usr/bin "$LFS/bin"
fi

if [ ! -L "$LFS/lib" ]; then
    ln -sv usr/lib "$LFS/lib"
fi

if [ ! -L "$LFS/sbin" ]; then
    ln -sv usr/sbin "$LFS/sbin"
fi

case $(uname -m) in
    x86_64)
        if [ ! -d "$LFS/lib64" ]; then
            mkdir -pv "$LFS/lib64"
        fi
        ;;
esac

# For the cross-compiler in Chapter 6, use a separate folder.
if [ ! -d "$LFS/tools" ]; then
    mkdir -pv "$LFS/tools"
fi
