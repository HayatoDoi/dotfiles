#!/bin/sh
# File name          : uninstallrc.sh
# Author             : Hayato Doi
# Last Update        : 2018/12/2
# Since              : 2017/1/1
# Outline            : dotfile 系を自動でアンインストールしておくやつ。
# Update information : 
# Copyright (c) 2017-2018, Hayato Doi


# remove folder
rm -rf ${HOME}/.dotfiles
rm -rf /var/tmp/trash

rm -rf ${HOME}/.zshrc
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.config/nvim/init.vim
rm -rf ${HOME}/.cache/dein

