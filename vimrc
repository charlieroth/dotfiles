set nocompatible 
filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim " ctrlp

call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes' " Colorschemes
Plug 'itchyny/lightline.vim' " Command bar colors
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion
Plug 'scrooloose/nerdtree' " File Explorer
Plug 'scrooloose/nerdcommenter' " Orgasmic Commenting
Plug 'elixir-editors/vim-elixir' " Elixir
Plug 'leafgarland/typescript-vim' " Typescript syntax
Plug 'maxmellon/vim-jsx-pretty' " Jsx Syntax
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

" Coc 
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
