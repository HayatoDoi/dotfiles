#!/bin/zsh
# file name: anyenv.zsh
# description: anyenvの設定とセットアップスクリプト
# mamo:
#  anyenvの使い方:
#    nodenvのインストール: $anyenv install nodenv
#    nodejsのダウンロード可能バージョンの確認: $nodenv install --list
#    nodejsのインストール: $nodenv install <version>
#    nodejsの使用するバージョンを指定: $nodenv ???????

function dotfile_setup_anyenv() {
	git clone https://github.com/riywo/anyenv $HOME/.anyenv
}

type anyenv > /dev/null 2>&1
if [ $? != 0 ]; then
	export PATH="$HOME/.anyenv/bin:$PATH"
	eval "$(anyenv init -)"
fi

