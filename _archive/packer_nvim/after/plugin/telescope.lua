local telescope = require("telescope")
local Remap = require("christian.keymap")
local nnoremap = Remap.nnoremap
local actions = require("telescope.actions")

print("Loading telescope.lua")

telescope.setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
          ["<c-l>"] = function() print("Hello") end,--"send_selected_to_qflist",
          ["<C-ö>"] = actions.select_vertical,
          ["<C-x>"] = actions.select_vertical
        },
        n = {
          ["<space>v"] = actions.select_horizontal,
          ["<space>h"] = actions.select_vertical
        }
      }
    }
  },
  defaults = {
   layout_config = {
      vertical = {
        width = 0.98
      },
      horizontal = {
        width = 0.98
      },
    },
    path_display = {
      "smart"
    }
  }
}

nnoremap("<leader>ff", function() 
  require('telescope.builtin').find_files({ hidden = true, file_ignore_patterns = { '^node_modules/', '.git/' } })
end)

-- nnoremap("<leader>fg", function() 
--   require('telescope.builtin').live_grep()
-- end)

nnoremap("<leader>fb", function() 
  require('telescope.builtin').buffers()
end)

nnoremap("<leader>fh", function() 
  require('telescope.builtin').help_tags()
end)

require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<space>ft",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

require "christian.telescope.multigrep".setup()
