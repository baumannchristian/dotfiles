return {
  "folke/trouble.nvim",
  md = "Trouble",
  keys = {
    {
      "<leader>xx",
      function() require("trouble").toggle("diagnostics") end,
      desc = "Toggle Trouble",
    },
    {
      "<leader>xw",
      function() require("trouble").toggle("workspace_diagnostics") end,
      desc = "Workspace Diagnostics",
    },
    {
      "<leader>xd",
      function() require("trouble").toggle("document_diagnostics") end,
      desc = "Document Diagnostics",
    },
    {
      "<leader>xq",
      function() require("trouble").toggle("quickfix") end,
      desc = "Quickfix List",
    },
    {
      "<leader>xl",
      function() require("trouble").toggle("loclist") end,
      desc = "Location List",
    },
    {
      "gR",
      function() require("trouble").toggle("lsp_references") end,
      desc = "LSP References (Trouble)",
    },
  },
  opts = {
    on_open = function()
      vim.cmd("setlocal wrap")
    end,
  }
}
