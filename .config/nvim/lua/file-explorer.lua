require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  default_file_explorer = true,
  columns = { "icon" },
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end
  }
})
