-- File Containing the Plugins use to enhance the UI
-- Author: Javier de Marco

return require('packer').startup(function(use)
    use{
        'CosmicNvim/cosmic-ui',
        config = function()
            require('cosmic-ui').setup({
                autocomplete = true
            })
        end,
        requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'ray-x/lsp_signature.nvim' },
        after = {'nvim-lspconfig', 'nvim-cmp'}
    }
end)
