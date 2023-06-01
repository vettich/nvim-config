--------------
-- lsp zero --
--------------

local lsp = require("lsp-zero")

lsp.preset({
	name = "recommended",
	-- manage_nvim_cmp = false,
	-- cmp_capabilities = false,
})

lsp.ensure_installed({
	'tsserver',
	'rust_analyzer',
	'gopls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.configure('rust_analyzer', {
	settings = {
		['rust-analyzer'] = {
			check = {
				command = 'clippy'
			}
		}
	}
})

------------------------
-- configure nvim-cmp --
------------------------

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
	['<CR>'] = vim.NIL,
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = 'path' },                                 -- file paths
		{ name = 'nvim_lsp' },                             -- from language server
		{ name = 'nvim_lsp_signature_help' },              -- display function signatures with current parameter emphasized
		{ name = 'nvim_lua' },                             -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = 'buffer',                 keyword_length = 2 }, -- source current buffer
		{ name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = 'calc' },                                 -- source for math calculation
	},
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.set_preferences({
--     suggest_lsp_servers = true,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })

-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}

--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
--   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
--   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
--   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
--   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
-- end)

lsp.nvim_workspace()

lsp.setup()

---------------
-- configure coq
-- local coq = require('coq')
-- lsp.setup(coq.lsp_ensure_capabilities())

vim.diagnostic.config({
	virtual_text = true
})

----------------
-- rust tools --
----------------

-- require('rust-tools').setup({
-- 	tools = {
-- 		inlay_hints = {
-- 			only_current_line = true,
-- 		}
-- 	},
-- 	server = {
-- 		capabilities = require('cmp_nvim_lsp').default_capabilities(),
-- 		on_attach = function(client, bufnr)
-- 			-- Enable completion triggered by <c-x><c-o>
-- 			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
-- 			-- Mappings.
-- 			-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 			local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- 			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- 			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
-- 			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- 			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- 			vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
-- 			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
-- 			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- 			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- 			vim.keymap.set('n', '<space>wl', function()
-- 				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 			end, bufopts)
-- 			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
-- 			vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
-- 			vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- 			vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- 		end
-- 	}
-- })
--
-- vim.keymap.set("n", "<Space>h", function() require('rust-tools').set() end)
-- vim.keymap.set("n", "<Space>H", function() require('rust-tools').unset() end)
