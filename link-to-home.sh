
# Use at your own risk. This will override your home with the (cool) stuff in this folder.

set -e

for file in $(find $(pwd)/home -maxdepth 1 -mindepth 1)
do
	HOME_FILE=~/$(basename $file)
	if [ -e $HOME_FILE ] ; then
		find $HOME_FILE -type l | xargs rm
	fi
	ln -s $file ~
done

