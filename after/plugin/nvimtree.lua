vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	diagnostics = {
		enable = true,
	},
	notify = {
		threshold = vim.log.levels.WARNING,
	},
	view = {
		number = true,
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = {
				width = 60,
				height = 60,
			}
		}
	},
	actions = {
		open_file = {
			quit_on_open = true,
		}
	}
})
