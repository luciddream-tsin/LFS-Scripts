rm -r $LFS/*.sh

rm -rf $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) rm -rf $LFS/lib64 ;;
esac

cp *.sh $LFS/

