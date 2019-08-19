function ls() {
	gls $*
}

function cp() {
	gcp $*
}

function mv() {
	gmv $*
}

PATH=$PATH:${HOME}/.dotfiles/zshrc/mac_cmd
