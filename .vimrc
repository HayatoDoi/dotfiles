" =====================================================
" testtest
" This program is for the Japanese.
" Therefore, comments are written in Japanese.
" All will be understood by reading the source code.
" =====================================================
" File name          : .vimrc
" Author             : Hayato Doi
" Last Update        : 2016/10/27
" Since              : 2015/9/28
" Outline            : vimの設定ファイル
" Update information : ヤンクする最大量の変更
" Copyright (c) 2015-2016, Hayato Doi

" 行番号のの表示
set number

" 検索語句のハイライト
set hlsearch

" C言語スタイルのインデントを自動でいれる
set cindent

" タブの幅（表示）
set tabstop=4

" タブの幅（挿入）
set shiftwidth=4
" タブをタブとして扱う
set noexpandtab

" カッコを強調
set showmatch

" 色を付ける
syntax on

" カラースキーマの指定
colorscheme desert

" 行番号の色
highlight LineNr ctermfg=white

" escをCtrl+jに変更
imap <C-j> <esc>

" 表示するファイルのタイプを環境変数から取ってくる
filetype on

" ヤンクする最大行のを1000にする。
set viminfo='20,\"1000

" Ctrl+eでNERDTreeToggleの起動
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 色の設定を変更
set laststatus=2

" lightlineのテーマをwombatにする。
let g:lightline = {'colorscheme':'wombat'}

" ==== 初回起動 ====
if has('vim_starting')
	" runtimepathにneobundleのパスを指定する
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" ---- 初回起動 ----

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" ==== インストールするプラグインをここに記述 ====
	" コメントON/OFFを手軽に実行
	NeoBundle 'tomtom/tcomment_vim'
	" ファイルマネージャー
	NeoBundle 'scrooloose/nerdtree'
	" ステータスラインの表示内容をシャレオツに
	NeoBundle 'itchyny/lightline.vim'
" ---- インストールするプラグインをここに記述 ----
call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
