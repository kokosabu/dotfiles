set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,sjis,euc-jp

set softtabstop=4
set tabstop=4
set expandtab
set shiftwidth=4
set shiftround
set textwidth=78
set backspace=indent,eol,start
"set foldmethod=syntax

set hlsearch
set incsearch
set noswapfile
set number
set magic
set autoindent

filetype plugin on
filetype detect
filetype indent on

au FileType ruby set ts=2 sw=2 sts=2

ab #i #include

if &t_Co > 1
  syntax on
endif

let g:changelog_username = "Yasuyuki Miura  <kokosabu@gmail.com>"

autocmd QuickFixCmdPost *grep* cwindow

"colorscheme molokai

call plug#begin('~/.vim/plugged')
"Plug 'taketwo/vim-ros'
call plug#end()

" ROS
au BufRead,BufNewFile *.cpp set shiftwidth=2
au BufRead,BufNewFile *.cpp set tabstop=2
au BufRead,BufNewFile *.cpp set cindent
