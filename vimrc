set nocompatible
filetype on
call plug#begin('~/.vim/plugged')
" Editor Plugins
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim' 
Plug 'slashmili/alchemist.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Javascript / Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'

" Elixir
Plug 'elixir-editors/vim-elixir'
call plug#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
 
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

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Ale
let g:ale_sign_error='●' " Less aggressive than the default '>>'
let g:ale_sign_warning='.'
let g:ale_lint_on_enter=0 " Less distracting when opening a new file
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
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }
