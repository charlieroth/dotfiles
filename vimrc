""""""""""""""""""""""""""""""
" GENERAL VIM
""""""""""""""""""""""""""""""
syntax on
set number
set relativenumber
set guicursor=
set backspace=indent,eol,start
set nohlsearch
set hidden
set noerrorbells
set showtabline=2
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set updatetime=50
set shortmess+=c
let loaded_matchparen = 1
let mapleader = ","
""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'robertmeta/nofrils'
" Plug 'arzg/vim-plan9'
" Plug 'pangloss/vim-javascript'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elixir-editors/vim-elixir'
" Plug 'elmcast/elm-vim'
" Plug 'JuliaEditorSupport/julia-vim'
" Plug 'ziglang/zig.vim'
call plug#end()
""""""""""""""""""""""""""""""
" MORE GENERAL VIM
""""""""""""""""""""""""""""""
imap jk <esc>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap tn :tabnew<Space>
nnoremap tm :tabmove<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_suggestions = 0
let g:latex_to_unicode_eager = 0
let g:latex_to_unicode_auto = 0
let g:latex_to_unicode_keymap = 0
colorscheme gruvbox
set bg=dark
""""""""""""""""""""""""""""""
" JULIA FORMATTER
""""""""""""""""""""""""""""""
" let g:JuliaFormatter_options = {
"         \ 'indent'                    : 4,
"         \ 'margin'                    : 92,
"         \ 'always_for_in'             : v:false,
"         \ 'whitespace_typedefs'       : v:false,
"         \ 'whitespace_ops_in_indices' : v:true,
"         \ }
""""""""""""""""""""""""""""""
" VIM AIRLINE 
""""""""""""""""""""""""""""""
let g:airline_theme='bubblegum'
""""""""""""""""""""""""""""""
" FZF 
""""""""""""""""""""""""""""""
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fa :Ag<CR>
nnoremap <silent> <Leader>fg :GFiles<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>bl :BLines<CR>
let g:fzf_preview_window = ['down:40%', 'ctrl-/']
""""""""""""""""""""""""""""""
" FUGITIVE 
""""""""""""""""""""""""""""""
nmap <Leader>gs :G<CR>
nmap <Leader>gj :diffget //3<CR>
nmap <Leader>gf :diffget //2<CR>
""""""""""""""""""""""""""""""
" COC 
""""""""""""""""""""""""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <Leader>cr :CocRestart<CR>
nnoremap <silent> <Leader>ce :CocList extensions<CR>
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
