set nocompatible 
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim " start ctrlp on boot

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'scrooloose/nerdcommenter' " Orgasmic Commenting
Plug 'leafgarland/typescript-vim' " Typescript syntax
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
call plug#end()

command! -nargs=0 Prettier :CocCommand prettier.formatFile


set statusline=\ %f
set statusline+=%=
set statusline+=\%{FugitiveStatusline()}
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c

let mapleader = ","
imap jk <esc>
imap <C-t> <esc>:tabnew<CR>

syntax on
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
set tabstop=4
set shiftwidth=4
set cmdheight=2
set autoindent
set smartindent
set mouse=a
set wildmenu
set path+=**
set expandtab
set updatetime=300
set signcolumn=yes
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number

let g:session_directory = '~/vim-sessions'
exec 'nnoremap <leader>ss :mks! ' . g:session_directory . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <leader>sr :so ' . g:session_directory . '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Load/save file view open enter/exit
autocmd BufWinLeave "." mkview
autocmd BufWinEnter "." silent loadview

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Use tab for trigger completion 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap tn :tabnew<Space>
nnoremap tm :tabmove<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" --- CtrlP Configuration
map <Leader>o :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|node_modules\|dist'
\ }
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }


" --- NERDTree Configuration
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
