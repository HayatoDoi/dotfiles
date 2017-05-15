" =====================================================
" This program is for the Japanese.
" Therefore, comments are written in Japanese.
" All will be understood by reading the source code.
" =====================================================
" File name          : .vimrc
" Author             : Hayato Doi
" Last Update        : 2017/5/12
" Since              : 2015/9/28
" Outline            : vimの設定ファイル
" Copyright (c) 2015-2017, Hayato Doi

" 行番号のの表示
set number

" 検索語句のハイライト
set hlsearch

" タブの幅（表示）
set tabstop=4

" タブの幅（挿入）
set shiftwidth=4

" タブをタブとして扱う
set noexpandtab
" set expandtab

" カッコを強調
set showmatch

" 行番号の色
hi LineNr ctermfg=white

" 表示するファイルのタイプを環境変数から取ってくる
filetype on

" カーソル行のハイライト
set cursorline

" 不可視文字の表示
set list
set listchars=tab:»-

" タブの色
hi SpecialKey ctermfg=241 ctermbg=NONE

" ヤンクする最大行のを1000にする.
set viminfo='20,\"1000

" Ctrl+eでNERDTreeToggleの起動
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 色の設定を変更
set laststatus=2

" ===拡張子によるシンタックスの変更===
" [jade] シンタックスをつける.
au BufRead,BufNewFile,BufReadPre *.jade set filetype=pug 
" [md]
" 改行のスペースをビンク色で表示
au BufNewFile,BufRead *.md set listchars=tab:»-,trail:_
au BufNewFile,BufRead *.md hi SpecialKey ctermfg=199 ctermbg=NONE
" タブをスペースで.
au BufNewFile,BufRead *.md set tabstop=4
au BufNewFile,BufRead *.md set shiftwidth=4
au BufNewFile,BufRead *.md set expandtab
" [c]
" C言語スタイルのインデントを自動でいれる
au BufNewFile,BufRead *.c set cindent
" [php]
" PSR-2 coding standardにする.
au BufNewFile,BufRead *.php set tabstop=4
au BufNewFile,BufRead *.php set shiftwidth=4
au BufNewFile,BufRead *.php set expandtab
" [Python]
" インデントはスペース2
au BufNewFile,BufRead *.py set tabstop=2
au BufNewFile,BufRead *.py set shiftwidth=2
au BufNewFile,BufRead *.py set expandtab

" クリップボードを共有する
set clipboard=unnamedplus

" lightlineのテーマをwombatにする.
let g:lightline = {'colorscheme':'wombat'}
" deopleteを使用する
let g:deoplete#enable_at_startup = 1

" ==キーの変更==
" 誤字用
:command Wq wq
:command WQ wq
:command W w
:command Q q

" escをCtrl+jに変更
imap <C-[> <esc>

"キーのショートカット
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vss :VimShellSendString<CR>
nnoremap <silent> vip :VimShellInteractive ipython<CR>

" neovim使用中に中ボタンでペーストするのを禁止
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" vim 起動時にtmuxのステータスバーを非表示
if !has('gui_running') && $TMUX !=# ''
	augroup Tmux
		autocmd!
		autocmd VimEnter,VimLeave * silent !tmux set status
	augroup END
endif

" ノーマルモードになる時にfcitxを無効化
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#load_state('~/.config/nvim/dein')
call dein#begin('~/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here:
" call dein#add('Shougo/neosnippet.vim')
" call dein#add('Shougo/neosnippet-snippets')
" コメントを一括でつけてくれる
call dein#add('tomtom/tcomment_vim')
" ディレクトリツリーを表示するやつ
call dein#add('scrooloose/nerdtree')
" 左下にいい感じの色をつけてくれる
call dein#add('itchyny/lightline.vim')
" go用の拡張
call dein#add('fatih/vim-go')
" jade用の拡張
call dein#add('digitaltoad/vim-pug')
" ES6 syntax
call dein#add('othree/yajs.vim', {'autoload':{'filetypes':['javascript']}})
" 補完
call dein#add('Shougo/deoplete.nvim')
" npm install -g tern"
call dein#add('carlitux/deoplete-ternjs')
" Vimshell
call dein#add('Shougo/vimshell.vim')
call dein#add('Shougo/vimproc', {'build' : 'make'})

" インデントの可視化
" call dein#add('nathanaelkane/vim-indent-guides')
" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()
call dein#save_state()

" Required:
filetype plugin indent on
" 色を付ける
syntax enable
" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------

