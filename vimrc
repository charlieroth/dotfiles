set nocompatible 
filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim " ctrlp

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' " Command bar colors
Plug 'scrooloose/nerdtree' " File Explorer
Plug 'scrooloose/nerdcommenter' " Orgasmic Commenting
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:lightline = { 
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ }

let mapleader = ","

" Colors
syntax on

imap jk <esc>
imap <C-t> <esc>:tabnew<CR>
map <Leader>o :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>

set backspace=indent,eol,start
set history=500
set ruler
set showcmd
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp
set autoread
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2
set tabstop=2
set shiftwidth=2
set cmdheight=2
set autoindent
set smartindent
set mouse=a
set wildmenu
set path+=**
set expandtab
set updatetime=300
set signcolumn=yes
set number

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let g:NERDSpaceDelims=1

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tm :tabmove<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" CtrlP Config
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|dist\'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }
