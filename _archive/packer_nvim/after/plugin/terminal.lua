vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()

  print("Executed TermOpen autocmd")
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

