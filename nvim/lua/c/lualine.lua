local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local mode = {
	'mode',
	fmt = function(str) return str end,
}

local filetype = {
	'filetype',
	icons_enabled = false,
	icon = nil,
}

local branch = {
  'branch',
  icons_enabled = false,
  fmt = function(str)
    if str == '' then
        return nil
    end
    return '[' .. str .. ']'
  end
}

local spaces = {
  'spaces',
  fmt = function(_)
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
  end
}

lualine.setup({
	options = {
        theme = 'catppuccin',
		icons_enabled = true,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { },
		lualine_x = { },
		lualine_y = { spaces },
		lualine_z = { filetype },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
