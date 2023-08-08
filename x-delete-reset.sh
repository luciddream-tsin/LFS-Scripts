rm -r $LFS/*.sh

rm -rf $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) rm -rf $LFS/lib64 ;;
esac

if [ -d "$LFS/sources" ]; then
  for dir in "$LFS/sources"/*/; do
    echo "rm : $dir"
    rm -rf "$dir"
  done
else
  echo "sources dir not exist."
fi

# TODO: if you exec this sh under $LFS, this line not effective.
cp -f 07*.sh 08*.sh 09*.sh 10*.sh 11*.sh x*.sh $LFS/


