vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', ';',
	"<cmd>lua require'telescope.builtin'.buffers({ sort_mru=true, ignore_current_buffer = true })<CR>")
vim.keymap.set('n', '<leader>b',
	"<cmd>lua require'telescope.builtin'.buffers({ sort_mru=true, ignore_current_buffer = true })<CR>")

require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"^.git/",
			"package-lock.json",
			"yarn.lock",
		},
		layout_strategy = "vertical",
		previewer = true,
		preview = {
			treesitter = false,
		}
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" }
		},
	},
	extensions = {
		coc = { theme = 'ivy' },
		file_browser = {
			theme = 'ivy',
			hijack_netrw = false,
			hidden = true,
			grouped = true,
			auto_depth = true,
			select_buffer = true,
			collapse_dirs = true,
		}
	},
}

require("telescope").load_extension "file_browser"
