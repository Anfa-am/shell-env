set runtimepath+=/usr/share/vim/vimfiles

syntax on

set clipboard+=unnamedplus
set nowrap
set tabstop=4
set number
set shiftwidth=4
set expandtab
set listchars=eol:¬,trail:·
set foldmethod=syntax
set background=dark
set tabline='showtabline'
set hlsearch
set fileformat=unix

let g:indentLine_char = '¦'
let startify_change_to_dir = 0
let g:ale_sign_error = '×'
let g:ale_sign_warning = '*'
let g:airline#extensions#tabline#enabled = 1
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1
let g:loaded_matchparen=2
let g:bookmark_sign = '#'

highlight LineNr ctermfg=32
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight DiffAdd ctermfg=230 ctermbg=10
highlight DiffChange ctermfg=230 ctermbg=96
highlight DiffDelete ctermfg=230 ctermbg=196

call plug#begin('~/.vim/plugged')

"syntax
Plug 'posva/vim-vue'
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
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'dbeniamine/cheat.sh-vim'

"tools
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ludovicchabant/vim-gutentags'

"search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"git
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin'

"autocomplete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

"navigation
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
nmap <leader>? :HowIn 

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

map Y y

map X "+c
map P "+p

map <leader>f *
vmap <leader>f y/<C-R>"<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


"search
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

let g:CheatSheetFrameworks = {
\ 'python' : ['python', 'tensorflow', 'keras', 'pandas', 'numpy', 'py'],
\ 'javascript' : ['javascript', 'node', 'vue', 'typescript'],
\ 'js' : ['javascript', 'node', 'vue', 'typescript'],
\}

"tags
set tags=~/.cache/tags/.tags;,.tags
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = ['ctags']

let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:tagbar_ctags_bin = '/usr/bin/ctags'

let g:tagbar_type_typescript = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
  \ 'c:class',
  \ 'n:namespace',
  \ 'f:function',
  \ 'G:generator',
  \ 'v:variable',
  \ 'l:local',
  \ 'm:method',
  \ 'p:property',
  \ 'i:interface',
  \ 'g:enum',
  \ 't:type',
  \ 'a:alias',
\ ],
\'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'n' : 'namespace',
  \ 'i' : 'interface',
  \ 'f' : 'function',
  \ 'G' : 'generator',
  \ 'm' : 'method',
  \ 'p' : 'property',
  \},
\ }

"autocomplete
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><s-tab>
 \ pumvisible() ? "\<C-p>" : "\<TAB>"
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
