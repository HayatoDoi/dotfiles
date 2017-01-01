#!/bin/sh
# File name          : uninstallrc.sh
# Author             : Hayato Doi
# Last Update        : 2017/1/1
# Since              : 2017/1/1
# Outline            : rc file 系を自動でアンインストールしておくやつ。
# Update information : 
# Copyright (c) 2017, Hayato Doi


# make folder
rm -rf /var/tmp/trash
rm -rf ${HOME}/.config/nvim/

rm -rf ${HOME}/.rc
rm -rf ${HOME}/.zshrc
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.config/nvim/init.vim

