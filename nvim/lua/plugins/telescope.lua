local shortcuts = {
  { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
  { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Serch in file" },
  { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Open buffers" }
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      build = "make",
    },
    keys = shortcuts,
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")

      vim.keymap.set("n", "<leader>ft", function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:p:h",
          select_buffer = true,
        })
      end, { noremap = true })

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5, -- 50% of the window for preview
            },
            width = 0.9,
            height = 0.8,
          },
          sorting_strategy = "ascending",
          preview = {
            hide_on_startup = false, -- ensures previews are visible
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-u>"] = actions.select_vertical,
            },
            n = {
              ["<C-u>"] = actions.select_vertical,
          },
          },
          file_ignore_patterns = {
            "node_modules", ".git"  -- no git internal and node_modules please
          },
          path_display = { "smart" }
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-q>"] = actions.delete_buffer,
              },
              n = {
                ["<C-q>"] = actions.delete_buffer,
              }
            }
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
          },
        },
      })
    end,
  },
}
