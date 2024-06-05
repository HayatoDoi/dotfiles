# ============================================================================
# File name          : color.zsh
# Author             : Hayato Doi
# Outline            : シェルの色設定
# License            : MIT
# Copyright (c) 2015-2024, Hayato Doi

function echonc() {
	if [ $1 -eq -1 ];then
		echo -n "${2}"
	else
		echo -n "\e[38;5;${1}m${2}\e[0m"
	fi
}

function echonc256() {
	echo -n "|"
	for i in `seq 1 256`;do
		echo -n "$(printf %03d ${i}) $(echonc $i ■) |"
		if [ $i -eq 256 ];then
			echo ""
			break
		fi
		if [ $(( $i % 16 )) -eq 0 ]; then
			echo -n "\n|"
		fi
	done
}

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
# zshが更新されるたびに呼ばれる部分
precmd(){
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# root,非rootでコマンドの色を変える
case ${UID} in
	0)
		color_theme=$DOTFILES_COLOR_THEME_ROOT
		;;
	*)
		color_theme=$DOTFILES_COLOR_THEME_USER
		;;
esac
case ${color_theme} in
	"GREEN")
		color=(2 14 12)
		;;
	"RED")
		color=(9 11 130)
		;;
	"VIOLET")
		color=(5 172 192)
		;;
	*)
		color=(-1 -1 -1)
		;;
esac
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
# プロンプトを2行で表示、時刻を表示
PROMPT="`echonc $color[1] %n`@%m`echonc $color[2] '[%1(v|%1v|-----)]'` %~
`echonc $color[1] '>'``echonc $color[2] '>'``echonc $color[2] '>'` "
PROMPT2="`echonc $color[2] '>>>'`"
if [ $DOTFILES_TERMINAL_CLOCK = "ON" ];then
RPROMPT="%D{%y-%m-%d %H:%M:%S}"
fi

# viinsキーバインド使用時, INSERTモードとNORMALモードでカーソルの色を変える
# xterm依存かもしれない.
function zle-line-init zle-keymap-select {
	case $KEYMAP in
		vicmd)
			echo -ne '\e]12;#009900\a'
			;;
		main|viins)
			echo -ne '\e]12;#FFFFFF\a'
			;;
	esac
	# zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


# ls 等の色設定
local LS_COLOR_DI='36;01' #Directory
local LS_COLOR_LN='35' #Symlink
local LS_COLOR_SO='32' #Socket 
local LS_COLOR_PI='33' #Pipe
local LS_COLOR_EX='31' #Executable
local LS_COLOR_DB='46;34' #Block device
local LS_COLOR_CD='43' #Char device
local LS_COLOR_SU='41;30' #setuid
local LS_COLOR_SG='46;30' #setgid
local LS_COLOR_TW='42;30' #ow w/ sticky
local LS_COLOR_OW='43;30' #other-writable

export LS_COLORS="di=${LS_COLOR_DI}:ln=${LS_COLOR_LN}:so=${LS_COLOR_SO}:pi=${LS_COLOR_PI}:ex=${LS_COLOR_EX}:bd=${LS_COLOR_DB}:cd=${LS_COLOR_CD}:su=${LS_COLOR_SU}:sg=${LS_COLOR_SG}:tw=${LS_COLOR_TW}:ow=${LS_COLOR_OW}"

# 補完候補一覧をカラー表示する設定
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
