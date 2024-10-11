require('nvim-treesitter.configs').setup{
  ensure_installed = {
    -- Git
    'git_config',
    'gitcommit',
    'git_rebase',
    'gitignore',
    'gitattributes',
    -- Markdown
    'markdown',
    -- BEAM langs
    'erlang',
    'elixir',
    'heex',
    'eex',
    -- Python
    'ninja',
    'rst',
    -- Lua
    'lua',
  }
}
