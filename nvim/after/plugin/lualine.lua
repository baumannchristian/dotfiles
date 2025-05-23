local oceanic = require'lualine.themes.OceanicNext'

-- Change the background of lualine_c section for normal mode
-- oceanic.normal.c.bg = '#112233'

require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = bubbles,
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
      lualine_b = { {'branch', fmt = function(str) return str:sub(1, 10) end } }, --'diff', 'diagnostics'},
      lualine_c = { { 'filename', file_status = false, path = 1 } }, --{'filename'},
      lualine_x = {'encoding', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {'location'},
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
