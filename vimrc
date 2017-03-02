syntax on
set nowrap
set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set listchars=eol:¬,trail:·

let g:bookmark_sign = 'ֶֶֶ·'
let g:indentLine_char = '¦'

set hlsearch

set fileformat=unix

let g:loaded_matchparen=1

call plug#begin()
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5-syntax.vim'
Plug 'vim-scripts/vim-emblem'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'

Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'airblade/vim-gitgutter'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

imap jj <Esc>
nmap mN <Plug>BookmarkPrev

let mapleader=" "

set completeopt-=preview

nmap <leader><tab> :FZ<CR>
nmap <leader><leader><tab> :Ag<CR>
nmap <leader><leader><leader> :NERDTreeFind<CR>
nmap  // :nohlsearch<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map Y "*y"
map X "+c
map P "+p

map <leader>f *
vmap <leader>f y/<C-R>"<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
