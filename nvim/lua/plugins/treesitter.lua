return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- auto-install parsers
    event = { "BufReadPost", "BufNewFile" }, -- lazy-load on file open
    opts = {
      ensure_installed = {
        "lua",
        "bash",
        "python",
        "json",
        "html",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

