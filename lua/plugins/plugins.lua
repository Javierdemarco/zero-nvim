-- File Containing the Plugins and their configuration
-- Author: Javier de Marco
return require('packer').startup(function(use)
------------
-- Colors --
-- ---------
    -- Colors in HEX
    -- TODO: Auto enable colorizer
    use{
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }
    -- Highlight range of operations
    use{
        'winston0410/range-highlight.nvim',
        config = function()
            require('range-highlight').setup()
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
    -- TODO
    --use{
    --    'CosmicNvim/cosmic-ui',
    --    config = function()
    --        require('cosmic-ui').setup({
    --           autocomplete = true
    --        })
    --    end,
    --    requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'ray-x/lsp_signature.nvim' },
    --    after = {'nvim-lspconfig', 'nvim-cmp'}
    --}
    -- Tab Bar
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    -- Status line
    use{
        'tamton-aquib/staline.nvim',
        config = function()
            require('staline').setup()
        end,
    }
    -- Cursor ui improvements
    use 'yamatsum/nvim-cursorline'
    -- Welcome screen in Neovim
    -- TODO: Change title
    use {
        'glepnir/dashboard-nvim',
        config = {
            'vim.g.dashboard_default_executive = "telescope"',
        }
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
            require('lspconfig').pylsp.setup()
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
---------------
-- MARKDOWN  --
---------------
    -- Live Preview
    use 'ellisonleao/glow.nvim'
    -- Markdown Workflow
    use({'jakewvincent/mkdnflow.nvim',
         config = function()
            require('mkdnflow').setup({
                -- Config goes here; leave blank for defaults
            })
         end
    })
    -- Preview in Browser
    -- TODO: Doesnt work
    use 'iamcco/markdown-preview.nvim'
--------------
-- SINTAX   --
--------------
    -- Better sintax highlight
    use{
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter').setup{
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                }
            }
        end,
    }
    -- Surrond operations
    -- TODO: Doesnt work
    use {
        'blackCauldron7/surround.nvim',
        config = function()
            require('surround').setup{
                mappings_style = "sandwich"
            }
        end,
    }
--------------
-- Terminal --
--------------
    -- Terminal
    use {"akinsho/toggleterm.nvim"}

end)

