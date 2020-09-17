set nocompatible
filetype on
filetype plugin on

" < max rows per register
" ' max markings for jumplists
" / max search entries
" : max commandline entries
" @ max input line entries
" f1 save file markings
" n viminfo filename
set viminfo=<200,'200,/100,:100,@100,f1,n~/z/documents/vim/viminfo
syntax on
set ruler		" position of curser
set showcmd		" show the key press in normal mode
set novisualbell
set wildmenu		" show a menu for possible completions
set noerrorbells	" Turn off the bell
set nostartofline	" Prevent the cursor from changing the current column when jumping to other lines
set autoindent		" This automatically inserts the indentation from the current line when you start a new line
set laststatus=2	" show always status line
set textwidth=72	" This explicitly sets the width of text to 72 characters
set list
set listchars=tab:▸\ ,trail:·,extends:←,precedes:→,nbsp:~
set showbreak=\\ " [bonus]
set tabstop=2
set softtabstop=4
set shiftwidth=8
set backspace=indent,eol,start
set number relativenumber


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'

call plug#end()

" rainbow
let g:rainbow_active = 1

" gruvbox
set background=dark

" my contacts with help of notmuch-address-cache and fzf
inoremap <expr> <c-x><c-k> fzf#vim#complete('/home/mb/z/src/dotfiles/master/submodules/notmuch-address-cache/bin/notmuch-address-cache query')

