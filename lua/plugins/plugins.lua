-- File Containing the Plugins and their configuration
-- Author: Javier de Marco

return require('packer').startup(function(use)
------------
-- Colors --
-- ---------
    -- Colors in HEX
    use{
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup{}
        end,
    }
    -- Highlight range of operations
    use{
        'winston0410/range-highlight.nvim',
        config = function()
            require('range-highlight').setup{}
        end,
        requires = { 'winston0410/cmd-parser.nvim'},
    }
    -- Colorscheme
    use{
        'sainnhe/gruvbox-material',
        config = vim.cmd('colorscheme gruvbox-material')
    }
-----------
-- FZF   --
-----------
    -- Telescope as Fuzzy Finder
    use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
    }
-----------
-- UI    --
-----------
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
------------
-- LSP    --
------------
    -- LSP config
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

