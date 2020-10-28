# svn, git用のsjisファイルをdiffするときにutf8へ変換して出力するラッパースクリプト
# 要インストール: nkfコマンド
function svn() {
	if [[ $1 == "diff" ]]; then
		LANG_TMP=$LANG
		export LANG=ja_JP.SJIS
		command svn $* | while IFS= read -r line; do echo -E $line | nkf -w; done
		export LANG=$LANG_TMP
	else
		command svn $*
	fi
}

function git() {
	if [[ $1 == "diff" ]]; then
		LANG_TMP=$LANG
		export LANG=ja_JP.SJIS
		command git $* | while IFS= read -r line; do echo -E $line | nkf; done
		export LANG=$LANG_TMP
	else
		command git $*
	fi
}

