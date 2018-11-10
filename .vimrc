set nocompatible
filetype on
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'

Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'

Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
call plug#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
hi comment ctermfg=yellow

set showcmd
set showmode
set autoindent
set smartindent
set nowrap
set backspace=indent,eol,start
set mouse=a
set wildmenu
set number
set relativenumber
set path+=**
inoremap jk <Esc>
set tabstop=2
set shiftwidth=2
set expandtab

" Rust Config
let g:rustfmt_autosave=1

" Tabs
nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
