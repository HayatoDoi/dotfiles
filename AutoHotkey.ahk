" =====================================================
" This program is for the Japanese.
" Therefore, comments are written in Japanese.
" All will be understood by reading the source code.
" =====================================================
" File name          : AutoHotkey.ahk
" Author             : Hayato Doi
" Last Update        : 2016/10/24
" Since              : 2016/2/10
" Outline            : AutoHotkeyの設定ファイル。(最近はこのコードをコンパイルできるみたい。)
" Update information : Alt + hjklで方向キーを使えるように。
" Copyright (c) 2016, Hayato Doi
#`::
DetectHiddenWindows, on
IfWinExist ahk_class mintty
{
	IfWinActive ahk_class mintty
	{
		WinHide ahk_class mintty
		WinActivate ahk_class Shell_TrayWnd
    }
	else
	{
		WinShow ahk_class mintty
		WinActivate ahk_class mintty
	}
}
else
	Run C:\Program Files\Git\git-bash.exe
DetectHiddenWindows, off
return

;=====  Alt +(hjkl) == Direction key  ======
<!h::
	Send,{Left}
	return
<!l::
	Send,{Right}
	return
<!j::
	Send,{Down}
	return
<!k::
	Send,{Up}
	return