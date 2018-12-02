#!/bin/sh
# File name          : installdotfiles.sh
# Author             : Hayato Doi
# Last Update        : 2018/12/2
# Since              : 2017/1/1
# Outline            : dotfiles系を自動でインストールしておくやつ。
# Update information : 
# Copyright (c) 2017-2018, Hayato Doi


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

# download dotfiles files.
git clone https://github.com/HayatoDoi/dotfiles.git ${HOME}/.dotfiles
ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc
ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.config/nvim/init.vim

# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /var/tmp/installer.sh
sh /var/tmp/installer.sh ~/.cache/dein

