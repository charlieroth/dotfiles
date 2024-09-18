-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>p", '<cmd>lua require("cmp").setup { enabled = true }<cr>', { desc = "Enable completion" })
vim.keymap.set(
  "n",
  "<leader>P",
  '<cmd>lua require("cmp").setup { enabled = false }<cr>',
  { desc = "Disable completion" }
)

-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- convert current line to title cases
vim.keymap.set(
  "n",
  "<leader>rlt",
  "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
  { desc = "Replace Line Title" }
)

-- these keep the cursor in the middle when scrolling with ctrl d and u
-- from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })

-- debugging
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set(
  "n",
  "<leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
  { desc = "Debugger toggle breakpoint" }
)
vim.keymap.set(
  "n",
  "<leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<leader>de", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Debugger reset" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Debugger run last" })
vim.keymap.set("n", "<leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<cr>", { desc = "Debugger testables" })
