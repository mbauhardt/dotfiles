call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'


call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)


:set number relativenumber

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"set list listchars=tab:>\ ,trail:-,eol:

set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " Use 4 spaces
set shiftwidth=4                " Use 4 spaces for indentation
set softtabstop=4               " Just so that indenting behaves sane
set smartindent                 " Auto indenting when adding new line

set nowrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points

" ================ Invisible characters =============

set invlist                     " toggle invisible characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬


