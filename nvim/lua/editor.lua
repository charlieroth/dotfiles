vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false

vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.concealcursor = 'nc'
vim.opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]

vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd([[colorscheme gruvbox]])

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'nivh'

vim.opt.wildignore = 'node_modules/**/*'
vim.opt.wildmode = 'longest,full'

vim.opt.completeopt = 'menuone,noinsert,noselect'

vim.opt.signcolumn = 'yes'

vim.opt.lazyredraw = true

vim.opt.showmatch = true
vim.opt.hidden = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.showmode = true
vim.opt.joinspaces = false
vim.opt.updatetime = 1000
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.previewheight = 5
