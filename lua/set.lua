vim.opt.number = true         -- показывать номера строк
vim.opt.relativenumber = true -- относительная нумерация строк

-- предпочтительные кодировки для открытия файлов
vim.opt.fileencodings = 'ucs-bom,utf8,windows-1251,default,latin1'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- отключить бэкап файлов
vim.opt.swapfile = false
vim.opt.backup = false

-- поиск слов
vim.opt.hlsearch = true   -- подсвечивать все совпадения на странице
vim.opt.incsearch = true  -- искать по мере наборе текста в поиске
vim.opt.ignorecase = true -- регистроНЕзависимый поиск по умолчанию
vim.opt.smartcase = true  -- если в поисковом запросе есть одна буква в верхнем регистре,
-- то поиск будет регистрозависимый

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- использовать локальные файлы конфигурации (.nvimrc) в папках с проектами
vim.opt.exrc = true

vim.opt.clipboard = 'unnamedplus'
-- vim.opt.colorcolumn = "80"
