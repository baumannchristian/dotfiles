return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    keys = {
      { "-", function() require("oil").open() end, desc = "Open parent directory" },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  }
}
