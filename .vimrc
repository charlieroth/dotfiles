set nocompatible
filetype on
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'

Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'

call plug#end()
set runtimepath^=~/.vim/bundle/ctrlp.vim

set showcmd
set showmode

set autoindent
set smartindent

set nowrap
set backspace=indent,eol,start
set mouse=a
set wildmenu
set number
set path+=**
inoremap jk <Esc>

set tabstop=2
set shiftwidth=2
set expandtab
