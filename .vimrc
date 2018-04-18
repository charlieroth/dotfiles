set nocompatible
filetype on
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'

Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

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

