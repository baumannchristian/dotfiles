return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" }, -- optional, for icons
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,    -- Enable or disable icons
          theme = "gruvbox",       -- Set your colorscheme theme (e.g., "gruvbox", "dracula", etc.)
          component_separators = { -- Customize separators between components
            left = "",
            right = "",
          },
          section_separators = { -- Customize separators between sections
            left = "",
            right = "",
          },
          disabled_filetypes = { -- Prevent lualine from loading in specific filetypes
            statusline = { "NvimTree", "dashboard" },
            winbar = {},
          },
          always_divide_middle = true, -- Ensure the middle section is always divided
          globalstatus = true,         -- Single statusline for all windows (requires Neovim 0.7+)
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { { 'branch', fmt = function(str) return str:sub(1, 10) end } }, --'diff', 'diagnostics'},
          lualine_c = { { 'filename', file_status = false, path = 1 } },          --{'filename'},
          lualine_x = { 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { 'location' },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},                            -- You can configure a tabline here if desired
        extensions = { "nvim-tree", "quickfix" } -- Enable extensions for specific plugins
      })
    end,
  },
}
