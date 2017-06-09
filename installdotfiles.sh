#!/bin/sh
# File name          : installdotfiles.sh
# Author             : Hayato Doi
# Last Update        : 2017/6/9
# Since              : 2017/1/1
# Outline            : dotfiles系を自動でインストールしておくやつ。
# Update information : 
# Copyright (c) 2017, Hayato Doi


# command check
if ! type git > /dev/null 2>&1;then                                                                                                                                 
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

if [ ! -e ${HOME}/.config/nvim ];then
	echo "\"${HOME}/.config/nvim/\" is not found"
	echo "make \"${HOME}/.config/nvim/\" folder"
	mkdir ${HOME}/.config/nvim/
fi

if [ ! -e ${HOME}/.config/each ];then
	echo "\"${HOME}/.config/each\" is not found"
	echo "make \"${HOME}/.config/each\" folder"
	mkdir ${HOME}/.config/each
fi

# download dotfiles files.
git clone https://github.com/nikaidoumari/dotfiles.git ${HOME}/.dotfiles
ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc
ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.config/nvim/init.vim

git clone https://github.com/Shougo/dein.vim.git ${HOME}/.config/nvim/dein/repos/github.com/Shougo/dein.vim
# wget nononono.net/.zshdotfiles.php -O ${HOME}/.zshdotfiles
# wget nononono.net/.vimdotfiles.php -O ${HOME}/.config/nvim/init.vim
# wget nononono.net/.tmux.conf.php -O ${HOME}/.tmux.conf

# setup
git clone https://github.com/riywo/anyenv ~/.anyenv
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

# make file
touch ~/.config/each/my.sh
