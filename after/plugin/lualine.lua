require('lualine').setup({
	options = {
		icons_enabled = false,
		-- theme = 'tokyonight',
		-- theme = 'marklar',
		theme = 'kanagawa',
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	-- tabline = {
	-- 	lualine_a = {{
	-- 		'buffers',
	-- 		max_length = vim.o.columns,
	-- 		show_filename_only = false,
	-- 		show_modified_status = true,
	-- 	}},
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {}
	-- },
	extensions = { 'nerdtree' }
})
