#!/bin/zsh
# file name: anyenv.zsh
# description: anyenvの設定とセットアップスクリプト
# mamo:
#  anyenvの使い方:
#    nodenvのインストール: $anyenv install nodenv
#    nodejsのダウンロード可能バージョンの確認: $nodenv install --list
#    nodejsのインストール: $nodenv install <version>
#    nodejsの使用するバージョンを指定: $nodenv global ???????

function dotfile_setup_anyenv() {
	git clone https://github.com/riywo/anyenv $HOME/.anyenv
	export PATH="$HOME/.anyenv/bin:$PATH"
	eval "$(anyenv init -)"
	anyenv install nodenv
	mkdir -p "$(nodenv root)/plugins"
	git clone https://github.com/pine/nodenv-yarn-install.git "$(nodenv root)/plugins/nodenv-yarn-install"
}

type anyenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
	export PATH="$HOME/.anyenv/bin:$PATH"
	eval "$(anyenv init -)"
fi

