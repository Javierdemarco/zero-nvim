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
    -- colorscheme
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

