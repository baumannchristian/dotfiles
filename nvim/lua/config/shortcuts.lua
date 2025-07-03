-- Enable relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "i" }, '<C-s>', '<ESC>:w<CR>', { desc = "Save current buffer" } )
vim.keymap.set({ "n", "i" }, '<C-a>', '<ESC>:wa<CR>', { desc = "Save all open buffers" } )

vim.keymap.set({ "n" }, '<C-p>', '<ESC>:let @a = expand(\'%:p\')<CR>', { desc = "current file path to register | pate via \"ap" })

-- pane navigation
vim.keymap.set({ "n", "i" }, '<C-k>', '<cmd> TmuxNavigateUp<CR>')
vim.keymap.set({ "n", "i" }, '<C-h>', '<cmd> TmuxNavigateLeft<CR>')
vim.keymap.set({ "n", "i" }, '<C-j>', '<cmd> TmuxNavigateDown<CR>')
vim.keymap.set({ "n", "i" }, '<C-l>', '<cmd> TmuxNavigateRight<CR>')

-- execute lua
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("v", "<space>x", "<cmd>lua<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")

