" =============================================================================
" File name          : vimrc
" Author             : Hayato Doi
" Outline            : vimの設定ファイル
" Copyright (c) 2015, Hayato Doi
" =============================================================================

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

" マウスを使えるようにする
set mouse=a

" 不可視文字の表示
set list
set listchars=tab:»-

" タブの色
" hi SpecialKey ctermfg=241 ctermbg=NONE

" ヤンクする最大行のを1000にする.
set viminfo='20,\"1000

" 80文字で自動的に折り返す
" テキストを選択してgq
" set formatoptions+=mM
set textwidth=80

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
au BufNewFile,BufRead *.c set noexpandtab
au BufNewFile,BufRead *.c set tabstop=8
au BufNewFile,BufRead *.c set shiftwidth=8
au BufNewFile,BufRead *.h set cindent
au BufNewFile,BufRead *.h set noexpandtab
au BufNewFile,BufRead *.h set tabstop=8
au BufNewFile,BufRead *.h set shiftwidth=8
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
"let g:deoplete#enable_at_startup = 1

let g:gen_tags#gtags_default_map = 1

let $LANG='ja_JP.UTF-8'
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

" タグジャンプの設定
"let TAG_JUMP = 'rtags'
let TAG_JUMP='gtags'

" ==キーの変更==
" 誤字用
:command Wq wq
:command WQ wq
:command W w
:command Q q

" escをCtrl+jに変更
imap <C-j> <esc>

"キーのショートカット
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
"表示行で移動する
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk<Paste>

" neovim使用中に中ボタンでペーストするのを禁止
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>
" rキーを無効化(rtagsのキーバインドを被るため)
nnoremap r <Nop>

" gtags キーバインド
" if $TAG_JUMP == "gtags"
  map <C-h> :Gtags -f %<CR>
  map <C-j> :GtagsCursor<CR>
  map <C-n> :cn<CR>
  map <C-p> :cp<CR>
" endif

" rtags キーバインド
if $TAG_JUMP == "rtags"
  " <ctrl + j> = 定義へジャンプ
  map <C-j> :call rtags#JumpTo()<CR> 
endif

" for build
map <C-s> :!make<CR>

let g:lsp_highlight_references_enabled = 1
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

" " vim 起動時にtmuxのステータスバーを非表示
" if !has('gui_running') && $TMUX !=# ''
"   augroup Tmux
"     autocmd!
"     autocmd VimEnter,VimLeave * silent !tmux set status
"   augroup END
" endif

" ノーマルモードになる時にfcitxを無効化
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

" 前回終了時のカーソル位置でファイルを開く
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif


" == dein Scripts  ============================================================
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " == Plugins  ===============================================================
  " コメントを一括でつけてくれる
  call dein#add('tomtom/tcomment_vim')
  " ディレクトリツリーを表示するやつ
  call dein#add('scrooloose/nerdtree')
  " 左下にいい感じの色をつけてくれる
  call dein#add('itchyny/lightline.vim')
  "" tag jump系
  "" gtags
  call dein#add('vim-scripts/gtags.vim')
  "" rtags
  call dein#add('lyuts/vim-rtags')
  "" clang
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  " ペーストする時にインデントを入れない
  " call dein#add('ConradIrwin/vim-bracketed-paste')
  " Rgコマンドでripgrepを実行する
  call dein#add('jremmen/vim-ripgrep')
  " Findコマンドでfindを実行する
  call dein#add('HayatoDoi/vim-find')
  " ===========================================================================

  " Required:
  call dein#end()
  call dein#save_state()
endif
" =============================================================================

" Required:
call map(dein#check_clean(), "delete(v:val, 'rf')")

" == Plugin Settings ===========================================================
" NERDTree
let g:NERDTreeIgnore = []
call add(g:NERDTreeIgnore, "^.*\.o$")
call add(g:NERDTreeIgnore, "^.*\.a$")

filetype plugin indent on
syntax enable
