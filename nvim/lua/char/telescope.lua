local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require('telescope.sorters').get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  }
}

local M = {}
-- Open dotfiles
M.search_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = '=== dotfiles ===',
    cwd = "~/dotfiles"
  })
end
-- Add ability to delete branches to telescope.builtin.git_branches()
M.git_branches = function()
  require('telescope.builtin').git_branches({
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<C-d>', actions.git_delete_branch)
      map('n', '<C-d>', actions.git_delete_branch)
      return true
    end
  })
end

return M
