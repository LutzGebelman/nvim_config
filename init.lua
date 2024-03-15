local op = vim.o
local gop = vim.g

gop.loaded_netrw = 1
gop.loaded_netrwPlugin = 1
gop.nohlsearch = false
op.linebreak = false
op.termguicolors = true
op.number = true
op.rnu = true
op.updatetime = 300
op.signcolumn = 'yes'
op.tabstop = 4
op.shiftwidth = 4
op.expandtab = true
op.termbidi = true
op.cursorline = true
op.colorcolumn = "80"


require('plugins')

require('keybindings')
require('theme')
require('lualine-conf')
require('nvim-lspconfig')
