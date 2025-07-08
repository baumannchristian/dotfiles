return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        }},
      panel = { enabled = true},
      telemetry = false,
       -- server_opts_overrides = {
       --  trace = "off",
       --  settings = {
        })
  end,
}
