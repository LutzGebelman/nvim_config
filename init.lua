local op = vim.o
local gop = vim.g

require('plugins')
require('nvim-lspconfig')
require('dap-config')
require('treesitter_config')

require('monokai').setup{
    palette = require('monokai').soda
}

require('keybindings')

gop.loaded_netrw = 1
gop.loaded_netrwPlugin = 1
gop.nohlsearch = false

op.termguicolors = true

op.number = true
op.rnu = true
op.updatetime = 300
op.signcolumn = "yes"
op.tabstop = 4
op.shiftwidth = 4
op.expandtab = true

require('lualine').setup{
    options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
