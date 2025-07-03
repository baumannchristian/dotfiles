return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      vim.lsp.set_log_level("off")

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map('n', 'gD', vim.lsp.buf.declaration, "Go to Declaration")
        map('n', 'gi', vim.lsp.buf.implementation, "Go to implemenation")

        map("n", "K", vim.lsp.buf.hover, "Hover Info")
        map('n', '<space>D', vim.lsp.buf.type_definition, "Show type definition")
        map('n', '<C-x>', vim.lsp.buf.signature_help, "Show signature")
        map('n', 'gr', vim.lsp.buf.references, "Show all references")

        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

        map('n', '<space>f', vim.lsp.buf.format, "Format buffer")

        print("language server attached")
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      lspconfig.lua_ls.setup {
        -- https://github.com/LuaLS/lua-language-server/releases
        cmd = { "/usr/bin/lua-language-server" },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      }

      require('lspconfig')['zls'].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "zls"
        }
      }

      -- go
      require('lspconfig')['gopls'].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
}
