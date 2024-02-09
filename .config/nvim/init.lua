-- Editor
vim.g.mapleader = ","

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.clipboard = 'unnamed'

vim.opt.ignorecase = true
vim.opt.spell = true
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.linebreak = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "tn", ":tabnew<Space>")
vim.keymap.set("n", "tm", ":tabmove<Space>")
vim.keymap.set("n", "tk", ":tabnext<cr>")
vim.keymap.set("n", "tj", ":tabprev<cr>")
vim.keymap.set("n", "th", ":tabfirst<cr>")
vim.keymap.set("n", "tl", ":tablast<cr>")

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "tpope/vim-fugitive",
    "terrortylor/nvim-comment",
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2"
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "VonHeikemen/lsp-zero.nvim", branch = 'v3.x' },
    { "neovim/nvim-lspconfig" },
    "vim-pandoc/vim-pandoc",
    "vim-pandoc/vim-pandoc-syntax",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    }
})

-- Color Theme
vim.o.background = "dark"
vim.cmd.colorscheme "catppuccin-mocha"

-- lualine
require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_z = { "location" }
    }
})

-- nvim_comment
require("nvim_comment").setup()

-- treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "lua",
    "luadoc",
    "go",
    "rust",
    "javascript",
    "typescript",
    "tsx"
  },
  sync_install = false,
  auto_install = true,
}

-- telescope
require("telescope").setup({})
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>tgs", builtin.git_status, {})

local harpoon = require("harpoon")
harpoon:setup({})
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toogle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
-- basic telescope configuration
local telescope_config_values = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = telescope_config_values.file_previewer({}),
        sorter = telescope_config_values.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- neotree
require("neo-tree").setup{
  close_if_last_window = true,
  enable_git_status = false,
  enable_diagnostics = false,
  window = {
    position = 'left',
    width = 35,
    mappings = {
      ["<cr>"] = "open",
      ["<esc>"] = "cancel",
      ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
      ["l"] = "focus_preview",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      ["a"] = {
        "add",
        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
      ["i"] = "show_file_details",
    }
  }
}
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])



-- LSP Config Manager
local lsp_zero = require("lsp-zero")
local cmp_action = require("lsp-zero").cmp_action()

lsp_zero.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["gopls"] = { "go" },
    }
})

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

require("lspconfig").gopls.setup({})

require("lspconfig").marksman.setup({})

require("lspconfig").tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})

-- Completions
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    }),
})

-- LSP Manager
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = {
        "gopls",
        "lua-language-server",
        "rust-analyzer",
        "typescript-language-server",
        "mason"
    },
    handlers = {
        lsp_zero.default_setup,
    }
})

