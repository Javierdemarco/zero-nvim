-- File Containing the Plugins use to enhance the UI
-- Author: Javier de Marco

return require('packer').startup(function(use)
    -- UI enhancements for neovim
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
    -- Tab Bar
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    -- Status line
    use 'tamton-aquib/staline.nvim'
    -- Cursor ui improvements
    use 'yamatsum/nvim-cursorline.nvim'
    -- Welcome screen in Neovim
    use {
        'glepnir/dashboard-nvim',
        config = function()
            require('dashboard-nvim').setupt({
                dashboard_default_executive = 'telescope'
            })
        end,
    }
    use "lukas-reineke/indent-blankline.nvim"
end)
