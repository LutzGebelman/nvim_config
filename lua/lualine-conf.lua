local function get_host_user()
    return vim.fn.getenv("USER") .. "@" .. vim.fn.hostname()
end
function getfilestatus()
    if vim.bo.readonly then return { fg = 'black', bg = 'red' } end
    if vim.bo.modified then return { fg = 'orange', bg = '#272727' } end
    return { fg = 'White', bg = '#272727' }
end

require('lualine').setup{
    options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_a = {'mode', { 'filename', color = getfilestatus}, { 'diagnostics', color = {bg='#272727'}}},
    lualine_b = {},
    lualine_c = {get_host_user, 'branch', 'diff'},
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
