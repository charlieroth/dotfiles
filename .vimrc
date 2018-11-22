set nocompatible
filetype on
call plug#begin('~/.vim/plugged')
" Editor Plugins
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" GraphQL
Plug 'jparise/vim-graphql'

" Javascript / Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
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
set path+=**
inoremap jk <Esc>
set tabstop=2
set shiftwidth=2
set expandtab

" Tabs
nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Ale
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0
let g:ale_linters = {
\ 'javascript': ['eslint'],
\}

" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
