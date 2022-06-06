local utils = require('c.utils')
local o, wo, bo = vim.o, vim.wo, vim.bo
local opt = utils.opt
local buffer = {o, bo}
local window = {o, wo}

vim.g['maplocalleader'] = ','

-- Core
opt('clipboard', 'unnamed')
opt('mouse', 'nivh')
opt('wildignore', 'node_modules/**/*')
opt('wildmode', 'longest,full')
opt('shortmess', o.shortmess .. 'c')
opt('completeopt', 'menuone,noinsert,noselect')
opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt('lazyredraw', true)
opt('showmatch', true)
opt('ignorecase', true)
opt('smartcase', true)
opt('hidden', true)
opt('splitright', true)
opt('splitbelow', true)
opt('showmode', false)
opt('joinspaces', false)
opt('wrap', false)
opt('updatetime', 1000)
opt('laststatus', 2)
opt('scrolloff', 10)
opt('previewheight', 5)

-- Buffer
opt('undofile', true, buffer)
opt('autoindent', true, buffer)
opt('cindent', true, buffer)
opt('tabstop', 4, buffer)
opt('shiftwidth', 4, buffer)
opt('softtabstop', 4, buffer)
opt('expandtab', true, buffer)

-- Window
opt('concealcursor', 'nc', window)
opt('number', true, window)
opt('relativenumber', true, window)
opt('breakindent', true, window)

-- Colors
opt('background', 'dark')
opt('termguicolors', true)
