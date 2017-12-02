syntax on
set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set listchars=eol:¬,trail:·

let g:indentLine_char = '¦'

set hlsearch

set fileformat=unix

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:loaded_matchparen=2

highlight BookmarkSign ctermbg=NONE ctermfg=160
let g:bookmark_sign = '♥'

call plug#begin()
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5-syntax.vim'
Plug 'vim-scripts/vim-emblem'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'

Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
call plug#end()

imap jj <Esc>

let mapleader=" "

nmap <leader><tab> :FZ<CR>
nmap <leader><leader><tab> :Ag <CR>
nmap <leader><leader><leader> :NERDTreeFind<CR>

nmap <leader>s :Gstatus<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>b :Gblame<CR>

nmap <leader>sc :setlocal spell spelllang=en_us<CR>

nmap /  :/\c
nmap <leader>ws  :%s/\s\+$//<CR>
nmap W  :w<CR>

nmap <leader>t :TagbarToggle<CR>

nmap  // :nohlsearch<CR>
nmap  __ :split<CR>
nmap  ++ :vs<CR>

nmap  )) :res 10000<CR>
nmap  (( :vertical resize 10000<CR>
nmap  () :wincmd =<CR>

map Y "*y"
map X "+c
map P "+p

map <leader>f *
vmap <leader>f y/<C-R>"<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
noremap <Up> <NOP>

noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

