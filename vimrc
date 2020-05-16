set nocompatible 
filetype plugin indent on
" set runtimepath^=~/.vim/bundle/ctrlp.vim " start ctrlp on boot

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" --- General Vim 
let mapleader = ","
imap jk <esc>
imap <C-t> <esc>:tabnew<CR>

syntax on
colorscheme gruvbox
set background=dark
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
set number

" FZF
nnoremap <silent> <Leader>og :Ag<CR>
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" --- Vim Fugitive
nmap <Leader>gs :G<CR>
nmap <Leader>gj :diffget //3<CR>
nmap <Leader>gf :diffget //2<CR>

" --- Coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <Leader>cr :CocRestart<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" --- Vim Sessions
let g:session_directory = '~/vim-sessions'
exec 'nnoremap <leader>ss :mks! ' . g:session_directory . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <leader>sr :so ' . g:session_directory . '/*.vim<C-D><BS><BS><BS><BS><BS>'
" Load/save file view open enter/exit
autocmd BufWinLeave "." mkview
autocmd BufWinEnter "." silent loadview

" --- Tabs
nnoremap tn :tabnew<Space>
nnoremap tm :tabmove<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" -- NERDTree
map <silent> <Leader>n :NERDTreeToggle<CR>

" --- CtrlP
" map <Leader>o :CtrlP<CR>
" map <Leader>b :CtrlPBuffer<CR>
" let g:ctrlp_map='<c-p>'
" let g:ctrlp_cmd='CtrlP'
" let g:ctrlp_working_path_mode='ra'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore = {
"     \ 'dir': '\.git$\|node_modules\|dist'
" \ }
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("t")': ['<c-a>'],
"     \ }
