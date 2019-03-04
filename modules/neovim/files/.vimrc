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
set ruler
set showcmd
set visualbell

set rtp+=/usr/local/opt/fzf
