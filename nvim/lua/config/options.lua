-- treesitter folds
    -- zM — close all folds
    -- zR — open all folds
    -- zc — close one fold
    -- zo — open one fold
vim.opt.foldenable = false -- Start with all folds open
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

vim.diagnostic.config({
  virtual_text = true,  -- show inline errors
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
