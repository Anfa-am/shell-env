syntax on

set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set number
set shiftwidth=2
set list
set listchars=eol:¬,trail:·
set clipboard=unnamed
set foldmethod=syntax
set background=dark
set tabline='showtabline'
set hlsearch
set fileformat=unix

let g:indentLine_char = '¦'
let startify_change_to_dir = 0
let g:ale_sign_error = '×'
let g:ale_sign_warning = '͛'
let g:airline#extensions#tabline#enabled = 1
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1
let g:loaded_matchparen=2
let g:bookmark_sign = '♥'

highlight LineNr ctermfg=32
highlight clear ALEErrorSign
highlight clear ALEWarningSign

call plug#begin()

"syntax
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5-syntax.vim'
Plug 'vim-scripts/vim-emblem'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'

"editor
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-peekaboo'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'

"tools
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'MattesGroeger/vim-bookmarks'

"search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"git

Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

"autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'


"navigatoin
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

"utilities
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'

call plug#end()

imap jj <Esc>

let mapleader=" "

nmap <leader><tab> :FZ<CR>
nmap <leader>/ :Ag 

nmap <leader><leader><tab> :Ag <C-R><C-W><CR>
vmap <leader><leader><tab>  y:Ag <C-r>"<CR>

nmap <leader><leader><leader> :NERDTreeFind<CR>:vertical resize 30<CR>

nmap <leader>n :cn<CR>
nmap <leader>m :cp<CR>

nmap <leader>s :Gstatus<CR>
nmap <leader>c :!git commit -a<CR>
nmap <leader>b :Gblame<CR>
nmap <leader>d :Gdiff<CR>
nmap <leader>h :GV<CR>


nmap ! :tab split<CR> :Startify<CR>
nmap <leader>1 :tab split<CR>
nmap \ :tabn<CR>
nmap \| :tabp<CR>

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

map <leader>f *
vmap <leader>f y/<C-R>"<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

"autocomplete
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <C-k>
      \ pumvisible() ? "\<C-p>" : "\<C-k>"

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ deoplete#mappings#manual_complete()

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
