set nocompatible
filetype on

call plug#begin('~/.vim/plugged')
" Editor
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Javascript / Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
call plug#end()

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
hi comment ctermfg=yellow

set showcmd
set number
set ruler
set showmode
set autoindent
set smartindent
set nowrap
set backspace=indent,eol,start
set mouse=a
set wildmenu
set path+=**
inoremap jk <Esc>
set tabstop=2
set shiftwidth=2
set expandtab

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tm :tabmove<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>


" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }
