
# Use at your own risk. This will override your home with the (cool) stuff in this folder.

set -ex

find `pwd`/home -maxdepth 1 -mindepth 1 | while read file
do
	ln -fs $file ~
done

# neovim vim init
mkdir -p ~/.config/nvim
cd ~/.config/nvim
ln -fs ~/.init.vim init.vim

