
# Use at your own risk. This will override your home with the stuff in this folder.

set -ex

for file in $(find $(pwd) -maxdepth 1)
do
	rm -f ~/$(basename $file)
	ln -s $file ~
done

