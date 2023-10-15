require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "help", "javascript", "typescript", "lua", "rust", "go" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
		disable = function(lang, bufnr)
			return vim.api.nvim_buf_line_count(bufnr) > 10000 or
				#vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] > 1000 or
				#vim.api.nvim_buf_get_lines(bufnr, 1, 2, false)[1] > 1000 or
				#vim.api.nvim_buf_get_lines(bufnr, 2, 3, false)[1] > 1000 or
				#vim.api.nvim_buf_get_lines(bufnr, 3, 4, false)[1] > 1000 or
				#vim.api.nvim_buf_get_lines(bufnr, 4, 5, false)[1] > 1000
		end
	},

	ident = { enable = true },

	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
		},
	},
}

require 'treesitter-context'.setup({
	multiline_threshold = 1,
})

-- Treesitter folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
