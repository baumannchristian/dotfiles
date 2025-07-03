return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    enable = true,
    max_lines = 3,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = nil,       -- visual separator
  },
}
