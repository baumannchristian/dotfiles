-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>Trouble symbols toggle focus=false<cr>",
  {silent = true, noremap = true}
)

require("trouble").setup {
  -- settings without a patched font or icons
  {
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
          -- icons / text used for a diagnostic
          error = "error",
          warning = "warn",
          hint = "hint",
          information = "info"
      },
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
}
