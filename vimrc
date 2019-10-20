call plug#begin('~/.vim/plugged')
" Editor
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'

" Elixir 
Plug 'elixir-editors/vim-elixir'

" Javascript


" Typescript

call plug#end()

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
filetype plugin indent on

hi comment ctermfg=yellow

set laststatus=2
set tabstop=2
set shiftwidth=2
set nocompatible
set noshowmode
set showcmd
set ruler
set autoindent
set smartindent
set nowrap
set backspace=indent,eol,start
set mouse=a
set wildmenu
set path+=**
set expandtab
inoremap jk <Esc>

" Lightline
let g:lightline = {
  \'colorscheme': 'wombat',
  \}

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

" Ale
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1
let g:ale_lint_on_save=1
let g:ale_linters = {
      \ 'elixir': ['credo'],
      \ }
