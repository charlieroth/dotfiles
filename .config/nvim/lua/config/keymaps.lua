vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({
    lsp_format = "fallback"
  })
end, { desc = "Format current file" })

vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>", { desc = "Open Neogit" })

-- FZF related general keymaps
local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fp", "<cmd>FzfDirectories<CR>", { desc = "[F]ind [P]aths" })
vim.keymap.set("n", "<leader>fb", fzf.builtin, { desc = "[F]ind [B]uiltin FZF" })
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fW", fzf.grep_cWORD, { desc = "[F]ind current [W]ORD" })
vim.keymap.set("n", "<leader>fG", fzf.live_grep, { desc = "[F]ind by Live [G]rep" })
vim.keymap.set("n", "<leader>fg", fzf.grep_project, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "[F]ind [O]ld Files" })
vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[,] Find existing buffers" })
vim.keymap.set("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] Live grep the current buffer" })
vim.keymap.set("n", "<leader>fS", require("fzf-lua").lsp_workspace_symbols, { desc = "[F]ind Workspace [S]ymbols" })
vim.keymap.set("n", "<leader>fs", require("fzf-lua").lsp_document_symbols, { desc = "[F]ind Document [S]ymbols" })
-- Search in neovim config
vim.keymap.set("n", "<leader>fc", function()
  fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind Neovim [C]onfig files" })
-- Search in my dotfiles config
vim.keymap.set("n", "<leader>fd", function()
  fzf.files({ cwd = os.getenv("HOME") .. "/dotfiles" })
end, { desc = "[F]ind [D]otfiles" })
