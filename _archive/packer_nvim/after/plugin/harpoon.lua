local Remap = require("christian.keymap")
local nnoremap = Remap.nnoremap

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})

nnoremap("<leader>ha", function() 
  require('harpoon.mark').add_file()
end)

nnoremap("<leader>hu", function() 
  require('harpoon.ui').toggle_quick_menu()
end)

nnoremap("<leader>1", function() 
  require('harpoon.ui').nav_file(1)
end)

nnoremap("<leader>2", function() 
  require('harpoon.ui').nav_file(2)
end)

nnoremap("<leader>3", function() 
  require('harpoon.ui').nav_file(3)
end)

nnoremap("<leader>j", function() 
  require('harpoon.ui').nav_next()
end)

nnoremap("<leader>k", function() 
  require('harpoon.ui').nav_prev()
end)
