local opts = { noremap=true, silent=true }

vim.keymap.set({ "n", "i" }, '<C-s>', '<ESC>:w<CR>', opts)
vim.keymap.set({ "n", "i" }, '<C-a>', '<ESC>:wa<CR>', opts)

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, '<leader>y', '"+y', opts)

-- copies the path to the current file to register a
-- pate via "ap
vim.keymap.set({ "n" }, '<C-p>', '<ESC>:let @a = expand(\'%:p\')<CR>', opts)

-- pane navigation
vim.keymap.set({ "n", "i" }, '<C-k>', '<cmd> TmuxNavigateUp<CR>', opts)
vim.keymap.set({ "n", "i" }, '<C-h>', '<cmd> TmuxNavigateLeft<CR>', opts)
vim.keymap.set({ "n", "i" }, '<C-j>', '<cmd> TmuxNavigateDown<CR>', opts)
vim.keymap.set({ "n", "i" }, '<C-l>', '<cmd> TmuxNavigateRight<CR>', opts)

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("v", "<space>x", "<cmd>lua<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")

--quickfix
vim.keymap.set("n", "<S-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<S-k>", "<cmd>cprev<CR>")
