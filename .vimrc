set nocompatible
filetype on
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'

Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'

Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'

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

imap ∆ <A-k>
imap ˚ <A-j>

nnoremap ˚ :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==

inoremap ˚ <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi

vnoremap ˚ :m '>+1<CR>gv==gv
vnoremap ∆ :m '<-2<CR>gv==gv

