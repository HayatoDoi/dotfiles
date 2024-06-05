# ============================================================================
# File name          : main.zsh
# Author             : Hayato Doi
# Outline            : Setting for the Z Shell.
# License            : MIT
# Copyright (c) 2015-2021, Hayato Doi

###############################################################################
# Defines
###############################################################################
# zsh設定が格納されたディレクトリのパス
export ZSHRC_DIR="${HOME}/.dotfiles/zshrc"
# 独自コマンドにpathを通す
export PATH=$PATH:$ZSHRC_DIR/cmd
# 環境変数LANGの設定
export LANG=ja_JP.UTF-8

###############################################################################
# Includes
###############################################################################
# Source settings for each OS.
case ${OSTYPE} in
	darwin*) #mac
		source $ZSHRC_DIR/os/macos_zshrc.zsh
		;;
	freebsd*) #freebsd
		source $ZSHRC_DIR/os/freebsd_zshrc.zsh
		;;
	linux*)  #linux
		source $ZSHRC_DIR/os/linux_zshrc.zsh
		;;
esac

# ライブラリの読み込み
source $ZSHRC_DIR/lib/include.zsh

# Source settings to enable functions.
Include $ZSHRC_DIR/settings.zsh

# 細かい環境の設定ファイルを読み込む
Include $ZSHRC_DIR/env/*.zsh
Include $ZSHRC_DIR/ignore_env/*.zsh
Include $ZSHRC_DIR/job_zshrc/*.zsh

# shell用組み込みコマンドの読み込み
Include ~/.dotfiles/zshrc/buildin_cmd/*

# local 実行ファイルpathの読み込み
Include ~/.bin/include_path.zsh

# カラー設定を読み込む
Include $ZSHRC_DIR/color.zsh

###############################################################################
# Z shell profiles
###############################################################################
# 補完機能設定
autoload -U compinit
compinit

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# viキーバインドを使用
#bindkey -v

# viinsモードでバックスペースを使う
bindkey -v '^?' backward-delete-char

# 履歴の設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# 補完候補のカーソル選択を有効にする設定
zstyle ':completion:*:default' menu select=1

# コマンドエラーの修正
setopt nonomatch

#補完を大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

###############################################################################
# Aliases
###############################################################################
alias grep='grep --colour=auto'

alias ls='exa'
alias lst='exa -ltr'
alias l='exa -ltr'
alias la='exa -la'
alias ll='exa -l'

alias vim='nvim'
alias vi='nvim'
alias ns='npm start'

#backupの作成
alias cp='cp -b'
alias mv='mv -b'

alias screen='screen -U'

###############################################################################
# Misc
###############################################################################
# shell用ゴミ箱を確認
if [ ! -e /var/tmp/trash ]; then
	mkdir /var/tmp/trash
fi

# sshから起動したとき、tmuxを起動する
if [ $DOTFILES_TMUX_CONNECT = "ON" ] && [ -n "$SSH_CONNECTION" ] && [[ ! -n $TMUX ]]; then
	if tmux ls; then
		tmux -u a
	else
		tmux -u
	fi
fi

