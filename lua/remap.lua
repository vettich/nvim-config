vim.g.mapleader = " "

-- сохранить файл
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- навигация по открытым буферам
vim.keymap.set("n", "<C-k>", "<cmd>bn<CR>")            -- переход на следующий файл в буфере
vim.keymap.set("n", "<C-j>", "<cmd>bp<CR>")            -- переход на предыдущий файл в буфере
vim.keymap.set("n", "<C-p>", "<cmd>bd<CR>")            -- закрыть текущий файл в буфере

vim.keymap.set("n", ",<space>", "<cmd>nohlsearch<CR>") -- снять выделения

-- изменять размеры окон
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +3<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -3<CR>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize +3<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -3<CR>")
