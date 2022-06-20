local M = {}

M.setup = function()
    return {
        defaults = {
            layout_config = {},
            winblend = 0,
            border = {},
            borderchars = {
                '─', '│', '─', '│', '╭', '╮', '╯', '╰'
            },
            use_less = true,
            initial_mode = "insert",
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            path_display = {},
            set_env = { ["COLORTERM"] = "truecolor" },
            vimgrep_arguments = {
                "rg", "--color=never", "--no-heading", "--with-filename",
                "--line-number", "--column", "--smart-case"
            },
            file_ignore_patterns = { "_build", "deps", "node_modules", "target" },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep
                .new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist
                .new,
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
        },
        pickers = {
            find_files = { theme = "dropdown", previewer = false },
            git_files = { theme = "dropdown", previewer = false },
            live_grep = { theme = "ivy" },
            code_action = { theme = "cursor" }
        }
    }
end

-- Search dotfiles
M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = '<===> Dotfiles <===>',
        cwd = "~/github.com/charlieroth/dotfiles"
    })
end

-- Add Delete Git Branches
M.git_branches = function()
    local actions = require('telescope.actions')
    require('telescope.builtin').git_branches({
        attach_mappings = function(_, map)
            map('i', '<C-d>', actions.git_delete_branch)
            map('n', '<C-d>', actions.git_delete_branch)
            return true
        end
    })
end

require('telescope').setup(M.setup())
require('telescope').load_extension("file_browser")
-- M.search_dotfiles()
-- M.git_branches()
