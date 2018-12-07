syntax on
set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set number
set shiftwidth=2
set list
set listchars=eol:¬,trail:·

let g:indentLine_char = '¦'

let g:ale_sign_error = '×'
let g:ale_sign_warning = 'Ø'

let g:ale_set_highlights = 0

highlight LineNr ctermfg=black

set hlsearch

set fileformat=unix


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

Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dkprice/vim-easygrep'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'honza/vim-snippets'
call plug#end()

imap jj <Esc>

let mapleader=" "

nmap <leader><tab> :FZ<CR>
nmap <leader><leader><tab> :Grep <C-R><C-W><CR>
nmap <leader><leader><leader> :NERDTreeFind<CR>:vertical resize 30<CR>

nmap <leader>n :cn<CR>
nmap <leader>m :cp<CR>

nmap <leader>s :Gstatus<CR>
nmap <leader>c :!git commit -a<CR>
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

let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <C-k>
      \ pumvisible() ? "\<C-p>" : "\<C-k>"

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ deoplete#mappings#manual_complete()

" inoremap <silent><expr> <C-c>
"       \ pumvisible() ? "\<C-e>" : "\<C-c>"

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['neosnippet', 'buffer', 'tag']
let deoplete#tag#cache_limit_size = 10000000

let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets,~/.vim/custom/dotitup_snippets'

imap <expr><TAB>
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
 \ pumvisible() ? "\<C-n>" : "\<TAB>"

" imap <expr><TAB>
"   \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
