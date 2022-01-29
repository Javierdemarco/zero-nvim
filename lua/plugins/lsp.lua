-- LSP Plugin config
-- Author: Javier de Marco

local lspconfig = require("lspconfig")

local servers = { 'pyright', 'tsserver', 'cssls', 'html' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
