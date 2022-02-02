--local coq = require("coq")

-- vim.cmd
-- [[
-- let g:coq_settings.display.icons.mode = 'long'
-- let g:coq_settings.auto_start = 'shut-up'
--
-- ]]
local lspconfig = require("lspconfig")
local coq_lsp = coq.lsp_ensure_capabilities()

lspconfig.pyright.setup{coq_lsp}
lspconfig.html.setup{coq_lsp}
lspconfig.cssls.setup{coq_lsp}
lspconfig.tsserver.setup{coq_lsp}
-- local vim.g.coq_settings = {
--     ["display#icons#mode"] = 'long',
--     ["auto_start"] = 'shut-up',
-- }
