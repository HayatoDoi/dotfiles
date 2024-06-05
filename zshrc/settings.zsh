# ============================================================================
# File name          : setting.zsh
# Author             : Hayato Doi
# Outline            : シェルの設定管理モジュール
# License            : MIT
# Copyright (c) 2015-2024, Hayato Doi

# シェルのカラーテーマ
# 対応テーマ : GREEN / RED / VIOLET
export DOTFILES_COLOR_THEME_USER="GREEN"
export DOTFILES_COLOR_THEME_ROOT="RED"

# シェルの右側み時計を表示するか否か
export DOTFILES_TERMINAL_CLOCK="ON"

# シェル起動時にtmuxへ接続するか否か
export DOTFILES_TMUX_CONNECT="OFF"

# ユーザー設定で上書きする
if [ -e ~/.dotfile_setting.zsh ]; then
    source ~/.dotfile_setting.zsh
fi
