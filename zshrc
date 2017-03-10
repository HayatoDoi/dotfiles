# =====================================================
# This program is for the Japanese.
# Therefore, comments are written in Japanese.
# All will be understood by reading the source code.
# =====================================================
# File name          : .zshrc
# Author             : Hayato Doi
# Last Update        : 2017/2/7
# Since              : 2015/7/14
# Outline            : zshの設定ファイル
# Copyright (c) 2015-2017, Hayato Doi

# 環境変数LANGの設定
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME=${HOME}/.config
export GOPATH=${HOME}/.go
export NODE_PATH=$(npm root -g)
# 補完機能設定
autoload -U compinit
compinit

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
# zshが更新されるたびに呼ばれる部分
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
# RPROMPT="%1(v|%F{green}%1v%f|)"

# プロンプトを2行で表示、時刻を表示
RootPrompt="%(?.%{%F{red}%n%f%}.%{%B%F{red}%n%f%b%})""@""%F{yellow}[%1(v|%1v|-----)]%f""(%*)"" %~""
%B%F{red}>`echo -n "\e[38;5;130m>"`%F{yellow}>%f%b "
RootPrompt2="%B%F{yellow}>>>%f%b "

OtherPrompt="%(?.%{%F{green}%n%f%}.%{%B%F{green}%n%f%b%})""@""%F{blue}[%1(v|%1v|-----)]%f""(%*)"" %~""
%B%F{green}>%f%F{cyan}>%f%F{blue}>%f%b "
OtherPrompt2="%B%F{blue}>>>%f%b "
# root,非rootでコマンドの色を変える
case ${UID} in
	0)	
		PROMPT=$RootPrompt
		PROMPT2=$RootPrompt2
		unset RPROMPT
		;;
	*)
		PROMPT=$OtherPrompt
		PROMPT2=$OtherPrompt2
		unset RPROMPT
		;;
esac

# 履歴の設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# viキーバインド設定
# bindkey -v

# ls 等の色設定
export LS_COLORS='di=36;01:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 補完候補一覧をカラー表示する設定
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 補完候補のカーソル選択を有効にする設定
zstyle ':completion:*:default' menu select=1

# コマンドエラーの修正
setopt nonomatch

#補完を大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# エイリアス
alias grep='grep --colour=auto'
alias ls='ls --color=auto -I '\''$RECYCLE.BIN'\'' -I '\''System Volume Information'\'
alias lst='ls -ltr --color=auto -I '\''$RECYCLE.BIN'\'' -I '\''System Volume Information'\'
alias l='ls -ltr --color=auto -I '\''$RECYCLE.BIN'\'' -I '\''System Volume Information'\'
alias la='ls -la --color=auto -I '\''$RECYCLE.BIN'\'' -I '\''System Volume Information'\'
alias ll='ls -l --color=auto -I '\''$RECYCLE.BIN'\'' -I '\''System Volume Information'\'
alias sudo='sudo -E'
alias vim='nvim'
alias ns='npm start'
#backupの作成
alias rm='mv -b -t /var/tmp/trash'
alias cp='cp -b'
alias mv='mv -b'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rc/mycommand/setproxy.sh

export NVM_DIR="/home/nono/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
