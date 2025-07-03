return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon: Add file" },
    { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon: Toggle menu" },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon: Go to file 1" },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon: Go to file 2" },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon: Go to file 3" },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon: Go to file 4" },
    { "<leader>j", function() require("harpoon").ui:nav_next() end, desc = "Harpoon: Go to next file" },
    { "<leader>k", function() require("harpoon").ui:nav_prev() end, desc = "Harpoon: Go to prev file" },
  },
}

