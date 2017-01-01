#!/bin/sh

# command check
if [ type git ];then
	echo "git command is not installed"
	exit 1
fi

# make folder
if [ ! -e ${HOME}/.config ];then
	echo "\"${HOME}/.config\" is not found"
	echo "make \"${HOME}/.config\" folder"
	mkdir ~/.config
fi

if [ ! -e /var/tmp/trash ];then
	echo "\"/var/tmp/trash\" is not found"
	echo "make \"/var/tmp/trash\" folder"
	mkdir /var/tmp/trash
fi

if [ ! -e ${HOME}/.config/nvim/ ];then
	echo "\"${HOME}/.config/nvim/\" is not found"
	echo "make \"${HOME}/.config/nvim/\" folder"
	mkdir ${HOME}/.config/nvim/
fi

# download rc files.
git clone https://github.com/nikaidoumari/rc.git ${HOME}/.rc
ln -s ${HOME}/.rc/.zshrc ${HOME}/.zshrc
ln -s ${HOME}/.rc/.tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/.rc/.vimrc ${HOME}/.config/nvim/init.vim
ln -s ${HOME}/.rc
# wget nononono.net/.zshrc.php -O ${HOME}/.zshrc
# wget nononono.net/.vimrc.php -O ${HOME}/.config/nvim/init.vim
# wget nononono.net/.tmux.conf.php -O ${HOME}/.tmux.conf

# setup
