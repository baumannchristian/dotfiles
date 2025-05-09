vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false

vim.opt.autoindent = true

vim.opt.wrap = true
-- Needed to keep buffers from closing
-- Specifically terminal windows with toggleterm
vim.opt.hidden = true

-- specifically for cmp
vim.opt.completeopt = menu,menuone,noselect

--map leader to Space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
