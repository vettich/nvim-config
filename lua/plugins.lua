vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- цветовые схемы
	use 'mhartington/oceanic-next'
	use 'cocopon/iceberg.vim'
	use { 'folke/tokyonight.nvim', branch = 'main' }

	-- анализатор кода в токены, подсветка синтаксиса
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use "nvim-treesitter/nvim-treesitter-context"
	use 'nvim-treesitter/nvim-treesitter-refactor'
	use {
		'm-demare/hlargs.nvim', -- подсветка аргументов в теле функции
		config = function() require('hlargs').setup() end
	}
	use 'martinda/Jenkinsfile-vim-syntax'

	-- работа с git
	use 'tpope/vim-fugitive'
	use 'TimUntersberger/neogit' -- сделать комит, пул, пуш
	use 'lewis6991/gitsigns.nvim' -- git diff в редакторе

	-- UI
	use 'nvim-lualine/lualine.nvim' -- строка статуса
	use {
		'akinsho/bufferline.nvim', -- верхняя строка буфферов
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}
	use 'norcalli/nvim-colorizer.lua' -- цвета в css
	use {
		'rcarriga/nvim-notify',    -- красивые уведомления
		config = function()
			require('notify').setup({
				-- on_open = function(win)
				-- vim.api.nvim_win_set_option(win, "winblend", 30)
				-- vim.api.nvim_win_set_config(win, { zindex = 2000 })
				-- end
			})
		end
	}

	-- навигация по файлам
	use 'scrooloose/nerdtree'        -- файловый браузер
	use 'xuyuanp/nerdtree-git-plugin'
	use 'nvim-lua/plenary.nvim'      -- требуется для telescope
	use 'nvim-telescope/telescope.nvim' -- быстрый поиск по файлам проекта
	-- use('fannheyward/telescope-coc.nvim')
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-tree/nvim-tree.lua'   -- файловый браузер
	use 'kyazdani42/nvim-web-devicons' -- иконки файлов
	use {                           -- показ тегов в текущем файле
		'preservim/tagbar',
		config = function()
			-- require('tagbar')
			vim.keymap.set("n", "<Leader>t", "<cmd>TagbarToggle<CR>")
		end
	}

	-- удобство
	use 'jiangmiao/auto-pairs' -- автозакрывание кавычек
	use {
		'terrortylor/nvim-comment', -- комментирование
		config = function() require('nvim_comment').setup() end,
	}
	use 'karb94/neoscroll.nvim' -- плавная прокрутка

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	-- use 'simrat39/rust-tools.nvim' -- rust
end)
