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

function DateInsert()
	$read !date
endfunction

let g:changelog_username = "Yasuyuki Miura  <kokosabu@gmail.com>"

"for Perl Package
set iskeyword+=:
map ,pt  <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<, '>! perltidy<CR>

aug Scheme
  au!
  au Filetype scheme setl cindent& lispwords=define
aug END

map <C-g> :Gtags
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>