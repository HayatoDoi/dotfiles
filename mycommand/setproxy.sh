#!/bin/zsh
# 自作コマンド
# Function name      : setproxy
# Author             : Hayato Doi
# Outline            : プロキシ関係を設定するプログラムである。
# Update information : 
#                    : 
#
# Arguments          : 
#              * on     プロキシをセットする
#              * off    プロキシを解除する。
#              * --version バージョン情報の表示
#              * --help ヘルプの表示
# Copyright (c) 2015-2017, Hayato Doi

function setproxy(){


	# == Global variable ==
	local ProgramName='setproxy'
	local Version=2.0.1
	local HttpProxy='wwwproxy.kanazawa-it.ac.jp:8080'
	local HttpsProxy='wwwproxy.kanazawa-it.ac.jp:8080'
	local FtpPrpxy='wwwproxy.kanazawa-it.ac.jp:8080'
	local NoProxy='localhost,127.0.0.0/8,::1,*kanazawa-it.ac.jp,*kanazawa-tc.ac.jp,*kitnet.ne.jp,*eagle-net.ne.jp'
	local Copyright='Copyright (c) 2015-2017, Hayato Doi'
	local tab='    '
	#== Global variable =end

	# == Manual ==
	local ManualText=`cat <<- EOS
		使用法: ${ProgramName} [モード] [オプション]
		[モード]
		${tab}All       すべてのプロキシをセットする。
		${tab}env       環境変数のプロキシをセットする。
		${tab}git       gitのプロキシをセットする。
		[オプション]
		${tab}on        プロキシをセットする。
		${tab}off       プロキシのセットを無効化する。
		${tab}--version プログラムのバージョン情報を表示する。
		${tab}--help    プログラムのヘルプを表示する。

		${ProgramName} に関するバグは< b1517914@planet.kanazawa-it.ac.jp >までご連絡ください。

		${Copyright}
	EOS`
	# == Manual =end

	# == Error Message ==
	local ErrorArgument=`cat <<- EOS
		コマンドライン引数が間違っています。
		--help で使い方を確認できます。
	EOS`
	# == Error Message =end

	# == Proxy set function ==
	function envproxy(){
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
			* )
				echo ${ErrorArgument}
				;;
		esac
	}
	function gitproxy(){
		# git command exist.
		if type git > /dev/null 2>&1;then
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
				* )
					echo ${ErrorArgument}
					;;
			esac
		fi
	}
	function npmproxy(){
		# git command exist.
		if type npm > /dev/null 2>&1;then
			case $1 in
				on ) #echo on
					npm -g config set proxy http://${HttpProxy}
					npm -g config set https-proxy https://${HttpsProxy}
					npm -g config set registry "https://registry.npmjs.org/"

					npm config set proxy http://${HttpProxy}
					npm config set https-proxy https://${HttpsProxy}
					npm config set registry "https://registry.npmjs.org/"
					;;
				off ) #echo of
					npm -g config delete proxy
					npm -g config delete https-proxy
					npm -g config delete registry

					npm config delete proxy
					npm config delete https-proxy
					npm config delete registry
					;;
				* )
					echo ${ErrorArgument}
					;;
			esac
		fi
	}
	# == Proxy set function =end
	
	if [ $# -eq 0 ];then
		echo "new command"
		echo ${ErrorArgument}
	fi
	
	case $1 in
		all )
			envproxy $2
			gitproxy $2
			npmproxy $2
			;;
		env )
			envproxy $2
			;;
		git )
			gitproxy $2
			;;
		npm )
			npmproxy $2
			;;
		--version ) #echo version
			echo ${ProgramName}' '${Version}
			echo $Copyright
			;;
		--help ) #echo help
			echo ${ManualText}
			;;
		* ) #shift #echo '--'
			echo ${ErrorArgument}
			;;
	esac
}
