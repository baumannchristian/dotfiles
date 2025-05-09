-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

vim.lsp.set_log_level("off")
-- vim.lsp.set_log_level("debug")

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
  -- if client.name == "omnisharp" then
  --   client.server_capabilities.semanticTokensProvider = {
  --     full = vim.empty_dict(),
  --     legend = {
  --       tokenModifiers = { "static_symbol" },
  --       tokenTypes = {
  --         "comment",
  --         "excluded_code",
  --         "identifier",
  --         "keyword",
  --         "keyword_control",
  --         "number",
  --         "operator",
  --         "operator_overloaded",
  --         "preprocessor_keyword",
  --         "string",
  --         "whitespace",
  --         "text",
  --         "static_symbol",
  --         "preprocessor_text",
  --         "punctuation",
  --         "string_verbatim",
  --         "string_escape_character",
  --         "class_name",
  --         "delegate_name",
  --         "enum_name",
  --         "interface_name",
  --         "module_name",
  --         "struct_name",
  --         "type_parameter_name",
  --         "field_name",
  --         "enum_member_name",
  --         "constant_name",
  --         "local_name",
  --         "parameter_name",
  --         "method_name",
  --         "extension_method_name",
  --         "property_name",
  --         "event_name",
  --         "namespace_name",
  --         "label_name",
  --         "xml_doc_comment_attribute_name",
  --         "xml_doc_comment_attribute_quotes",
  --         "xml_doc_comment_attribute_value",
  --         "xml_doc_comment_cdata_section",
  --         "xml_doc_comment_comment",
  --         "xml_doc_comment_delimiter",
  --         "xml_doc_comment_entity_reference",
  --         "xml_doc_comment_name",
  --         "xml_doc_comment_processing_instruction",
  --         "xml_doc_comment_text",
  --         "xml_literal_attribute_name",
  --         "xml_literal_attribute_quotes",
  --         "xml_literal_attribute_value",
  --         "xml_literal_cdata_section",
  --         "xml_literal_comment",
  --         "xml_literal_delimiter",
  --         "xml_literal_embedded_expression",
  --         "xml_literal_entity_reference",
  --         "xml_literal_name",
  --         "xml_literal_processing_instruction",
  --         "xml_literal_text",
  --         "regex_comment",
  --         "regex_character_class",
  --         "regex_anchor",
  --         "regex_quantifier",
  --         "regex_grouping",
  --         "regex_alternation",
  --         "regex_text",
  --         "regex_self_escaped_character",
  --         "regex_other_escape",
  --       },
  --     },
  --     range = true,
  --   }
  -- end

  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, {
        -- UI options are mostly the same as those passed to vim.lsp.util.open_floating_preview
        ui = {
          border = "single",          -- The border to use for the signature popup window. Accepts same border values as |nvim_open_win()|.
          height = nil,               -- Height of the signature popup window (nil allows dynamic sizing based on content of the help)
          width = nil,                -- Width of the signature popup window (nil allows dynamic sizing based on content of the help)
          wrap = true,                -- Wrap long lines
          wrap_at = nil,              -- Character to wrap at for computing height when wrap enabled
          max_width = nil,            -- Maximum signature popup width
          max_height = nil,           -- Maximum signature popup height
          -- Events that will close the signature popup window: use {"CursorMoved", "CursorMovedI", "InsertCharPre"} to hide the window when typing
          close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
          focusable = true,           -- Make the popup float focusable
          focus = false,              -- If focusable is also true, and this is set to true, navigating through overloads will focus into the popup window (probably not what you want)
          offset_x = 0,               -- Horizontal offset of the floating window relative to the cursor position
          offset_y = 0                -- Vertical offset of the floating window relative to the cursor position
        },
        keymaps = {
          next_signature = "<C-j>",
          previous_signature = "<C-k>",
          next_parameter = "<C-l>",
          previous_parameter = "<C-h>",
        },
      })
  end
  
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-x>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- error got nil
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

  print("LSP started.")
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- typescript lsp
-- require('lspconfig')['tsserver'].setup {
--   -- npm install -g typescript typescript-language-server
--   on_attach = on_attach,
--   flags = lsp_flags,
-- }

-- dotnet lsp
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

require('lspconfig')['omnisharp'].setup {
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
  on_attach = on_attach,
  capabilities = capabilities,
  -- organize_imports_on_format = true,
  -- enable_import_completion = true,
  -- enable_roslyn_analyzers = true,
}

-- python
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {
  --   "/usr/local/bin/node/node-v16.19.0-linux-x64/bin/pyright-langserver"
  -- }
}

-- rust lsp
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "rustup", "run", "stable", "rust-analyzer"
  }
}

-- go
require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
