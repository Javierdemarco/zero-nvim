-- File Containing the Plugins use to configure LSP
-- Author: Javier de Marco

return require('packer').startup(function(use)
    use{
        'neovim/nvim-lspconfig',
        config = function()
            -- Python
            require('lspconfig').pyright.setup{}
        end,
    }
    -- Colors for icons in errors and warnigns
    use 'folke/lsp-colors.nvim'
    -- LSP siganuture enable. See documentation when typing
    use 'ray-x/lsp_signature.nvim'
    -- Simbols outline
    use 'simrat39/symbols-outline.nvim'
    -- LSP Installer
    use 'williamboman/nvim-lsp-installer'
end)
