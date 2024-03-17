local vim = vim

vim.o.loaded_netrw = 1
vim.o.loaded_netrwPlugin = 1
vim.o.nohlsearch = false
vim.o.linebreak = true
vim.o.termguicolors = true
vim.o.number = true
vim.o.rnu = true
vim.o.updatetime = 300
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termbidi = true
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.wrap = false
-- vim.cmd("set nowrap")

require('plugins')
require('keybindings')
require('theme')
require('lualine-conf')
require('nvim-lspconfig')
