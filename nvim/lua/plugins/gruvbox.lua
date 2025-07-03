return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Ensure it loads first for proper color application
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = false,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- Inverse highlight for search, diffs, statuslines, and errors
        contrast = "", -- "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

