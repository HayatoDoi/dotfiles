LS_COLOR_OPT='-G'

PATH=$PATH:${HOME}/.dotfiles/zshrc/mac_cmd

function copy_backup() {
	if [ -e $2 ]; then
		mv $2 $2.back
	fi
	comannd cp $1 $2 
}

function rm_backup() {
	# todo...
}

#backupの作成
#alias rm='rm_backup'
#alias cp='copy_backup'
