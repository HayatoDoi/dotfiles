# =====================================================
# This program is for the Japanese.
# Therefore, comments are written in Japanese.
# All will be understood by reading the source code.
# =====================================================
# File name          : .zshrc
# Author             : Hayato Doi
# Last Update        : 2016/10/22
# Since              : 2015/7/14
# Outline            : zshの設定ファイル
# Update information : ls 等の色を変更
# Copyright (c) 2015-2016, Hayato Doi

# 環境変数LANGの設定
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
# 補完機能設定
autoload -U compinit
compinit

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"

# プロンプトを2行で表示、時刻を表示
RootPrompt="%(?.%{%F{red}%n%f%}.%{%B%F{red}%n%f%b%})""@""%F{yellow}%m%f""(%*)"" %~""
%B%F{red}>`echo -n "\e[38;5;130m>"`%F{yellow}>%f%b "
RootPrompt2="%B%F{yellow}>>>%f%b "

OtherPrompt="%(?.%{%F{green}%n%f%}.%{%B%F{green}%n%f%b%})""@""%F{blue}%m%f""(%*)"" %~""
%B%F{green}>%f%F{cyan}>%f%F{blue}>%f%b "
OtherPrompt2="%B%F{blue}>>>%f%b "
# root,非rootでコマンドの色を変える
case ${UID} in
0)	
	PROMPT=$RootPrompt
	PROMPT2=$RootPrompt2
	;;
*)
	PROMPT=$OtherPrompt
	PROMPT2=$OtherPrompt2
	;;
esac

# 履歴の設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

case "${TERM}" in
kterm*|xterm|mlterm)
	precmd() {
		echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	}
	;;
esac

# viキーバインド設定
bindkey -v

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
# 自作コマンド
function envproxy(){
	# Function name      : envproxy
	# Author             : Hayato Doi
	# Outline            : この関数は、環境変数をセットするプログラムである。
	# Update information : 2系 .<shell>rcに書き込む事で、sourceしなくて良くなった。
	#                    : ヒアドキュメントのインデントを修正。
	#
	# Arguments          : 
	#              * on     プロキシをセットする
	#              * off    プロキシを解除する。
	#              * --version バージョン情報の表示
	#              * --help ヘルプの表示
	# Copyright (c) 2015-2016, Hayato Doi


	# == Global variable ==
	ProgramName='envproxy'
	Version=2.0.1
	HttpProxy='wwwproxy.kanazawa-it.ac.jp:8080'
	HttpsProxy='wwwproxy.kanazawa-it.ac.jp:8080'
	FtpPrpxy='wwwproxy.kanazawa-it.ac.jp:8080'
	NoProxy='localhost,127.0.0.0/8,::1,*kanazawa-it.ac.jp,*kanazawa-tc.ac.jp,*kitnet.ne.jp,*eagle-net.ne.jp'
	Copyright='Copyright (c) 2015-2016, Hayato Doi'
	tab='    '
	#== Global variable =end

	# == Manual ==
	ManualText=`cat <<- EOS
		使用法: ${ProgramName} [オプション]
		[オプション]
		${tab}on        プロキシをセットする。
		${tab}of        プロキシのセットを無効化する。
		${tab}--version プログラムのバージョン情報を表示する。
		${tab}--help    プログラムのヘルプを表示する。

		${ProgramName} に関するバグは< b1517914@planet.kanazawa-it.ac.jp >までご連絡ください。

		${Copyright}
	EOS`
	# == Manual =end

	# == Error Message ==
	ErrorArgument=`cat <<- EOS
		コマンドライン引数が間違っています。
		--help で使い方を確認できます。
	EOS`
	# == Error Message =end

	if [ $# -eq 0 ];then
		echo ${ErrorArgument}
	fi

	case $1 in
		on ) #echo on
			export http_proxy=$HttpProxy
			export https_proxy=$HttpsProxy
			export ftp_proxy=$FtpPrpxy
			export no_proxy=$NoProxy
			;;
		off ) #echo of
			unset http_proxy
			unset https_proxy
			unset ftp_proxy
			unset no_proxy
			;;
		--version ) #echo version
			echo ${ProgramName}' '${Version}
			echo $Copyright
			;;
		--help ) #echo help
			echo ${ManualText}
			;;
		* ) shift #echo '--'
			echo ${ErrorArgument}
			;;
	esac
}

function gitproxy(){
	# Function name      : gitproxy
	# Author             : Hayato Doi
	# Outline            : このプログラムは、gitのプロキシをセットするプログラムである。
	# Update information : 2系 .<shell>rcに書き込む事で、sourceしなくて良くなった。
	#                    : ヒアドキュメントのインデントを修正。
	#
	# Arguments          : 
	#              * on     プロキシをセットする
	#              * off    プロキシを解除する。
	#              * --version バージョン情報の表示
	#              * --help ヘルプの表示
	# Copyright (c) 2015-2016, Hayato Doi


	# == Global variable ==
	ProgramName='gitproxy'
	Version=1.2.4
	HttpsProxy='wwwproxy.kanazawa-it.ac.jp:8080'
	Copyright='Copyright (c) 2015-2016, Hayato Doi'
	tab='    '
	# == Global variable =end
	
	# == Manual ==
	ManualText=`cat <<- EOS
		使用法: ${ProgramName} [オプション]
		[オプション]
		${tab}on        プロキシをセットする。
		${tab}of        プロキシのセットを無効化する。
		${tab}--version プログラムのバージョン情報を表示する。
		${tab}--help    プログラムのヘルプを表示する。

		${ProgramName} に関するバグは< b1517914@planet.kanazawa-it.ac.jp >までご連絡ください。

		${Copyright}
	EOS`
	# == Manual =end

	# == Error Message ==
	ErrorArgument=`cat <<- EOS
		コマンドライン引数が間違っています。
		--help で使い方を確認できます。
	EOS`
	# == Error Message =end

	if [ $# -eq 0 ];then
		echo ${ErrorArgument}
	fi

	case $1 in
		on ) #echo on
			git config --global http.proxy http://${HttpProxy}
			git config --global https.proxy https://${HttpsProxy}
			git config --global url.'https://'.insteadOf git://
			;;
		off ) #echo of
			git config --global --unset http.proxy
			git config --global --unset https.proxy
			git config --global --unset url.'https://'.insteadOf git://
			;;
		--version ) #echo version
			echo ${ProgramName}' '${Version}
			echo $Copyright
			;;
		--help ) #echo help
			echo ${ManualText}
			;;
		* ) shift #echo '--'
			echo ${ErrorArgument}
			;;
	esac
}
