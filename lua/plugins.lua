-- File Containing the list of plugins
-- The configuration files are separated
-- Author: Javier de Marco

return require('packer').startup(function(use)
    -- Packer
    use { "wbthomason/packer.nvim" }

-----------------------------------------------
-------------------- FZF   --------------------
-----------------------------------------------

    -- Telescope as Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        after = "telescope_find_directories",
        config = function()
            require("plugins/telescope")
        end,
    }

    -- Fzf Directories
    use {
        "artart222/telescope_find_directories",
        after = "telescope-fzf-native.nvim",
    }

    -- Improve telescope performance
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-----------------------------------------------
-------------------- LSP   --------------------
-----------------------------------------------

    -- COC LSP
    use {'neoclide/coc.nvim', branch = 'release'}

    -- LSP config
    -- use {
    --    'neovim/nvim-lspconfig',
    --    event = "BufEnter",
    -- }

    -- Colors for icons in errors and warnigns
    -- use 'folke/lsp-colors.nvim'

    -- LSP siganutures
    -- use {
    --     "ray-x/lsp_signature.nvim",
    --     after = "nvim-lspconfig",
    --     config = function ()
    --       require("lsp_signature").setup()
    --     end
    -- }
    -- Simbols outline
    use {
        'simrat39/symbols-outline.nvim',
        cmd = {
            "SymbolsOutline",
            "SymbolsOutlineOpen",
            "SymbolsOutlineClose",
        }
    }

    -- LSP Installer
    -- use {
    --     "williamboman/nvim-lsp-installer",
    --     after = "nvim-lspconfig",
    --     config = function()
    --       require("plugins/lsp")
    --     end
    -- }

    -- Language packs
    use 'sheerun/vim-polyglot'

-----------------------------------------------
----------------- Markdown   ------------------
-----------------------------------------------

    -- Live Preview on floating window
    use 'ellisonleao/glow.nvim'

    -- Preview in Browser
    -- TODO: Doesnt work
    --use 'iamcco/markdown-preview.nvim'

-----------------------------------------------
----------------- DEBUG   --------------------
-----------------------------------------------

    -- Debugger protocol
    use {
        'mfussenegger/nvim-dap',
        event = "BufEnter"
    }

    -- Debugger UI enhancement
    use {
        "rcarriga/nvim-dap-ui",
        after = "DAPInstall.nvim",
        config = function()
            require('plugins.dap')
        end,
    }
    -- Debbugger Installer
    use {
        "Pocco81/DAPInstall.nvim",
        after = 'nvim-dap',
    }

-----------------------------------------------
----------------- UI   --------------------
-----------------------------------------------

    -- Smooth scroll
    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end,
    }

    -- Better sintax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugins/treesitter')
        end,
        run = ":TSUpdate",
        event = "BufEnter",
        cmd = {
          "TSInstall",
          "TSInstallSync",
          "TSBufEnable",
          "TSBufToggle",
          "TSEnableAll",
          "TSInstallFromGrammer",
          "TSToggleAll",
          "TSUpdate",
          "TSUpdateSync"
        },
    }

    -- Text Objects for Treesitter
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = "nvim-treesitter",
    }

    -- Context when in long function
    use {
       'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup()
            vim.cmd('TSContextEnable')
        end,
        after = "nvim-treesitter",
    }

    -- Colors in HEX
    use {
        'norcalli/nvim-colorizer.lua',
        event = "BufEnter",
        config = function()
            require('colorizer').setup{
                "*",
                css = { rgb_fn = true; }
            }
            vim.cmd("ColorizerAttachToBuffer")
        end,
    }

    -- Highlight range of operations
    use {
        'winston0410/range-highlight.nvim',
        config = function()
            require('range-highlight').setup()
        end,
        requires = { 'winston0410/cmd-parser.nvim'},
    }

    -- Colorschemes
    use 'sainnhe/gruvbox-material'
    use 'ful1e5/onedark.nvim'
    use 'shaunsingh/nord.nvim'

    -- Tab bar
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('plugins.lualine')
        end,
    }

    -- Status Line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('plugins.lualine')
        end,
    }

    -- Welcome screen in Neovim
    use {
        'glepnir/dashboard-nvim',
        cmd = {
          "Dashboard",
          "DashboardChangeColorscheme",
          "DashboardFindFile",
          "DashboardFindHistory",
          "DashboardFindWord",
          "DashboardNewFile",
          "DashboardJumpMarks",
          "SessionLoad",
          "SessionSave"
        },
        config = function()
          require('plugins.dashboard')
        end
    }

    -- Indentation guides
    use{
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('plugins.indent-blankline')
        end,
    }


-----------------------------------------------
----------------- UTILITY   --------------------
-----------------------------------------------

    -- GODOT engine integration
    use 'habamax/vim-godot'

    -- Motion enhancer
    -- TODO: keybind s collides with surrond
    use 'ggandor/lightspeed.nvim'

    -- Plantuml Plugin
    use {
        'weirongxu/plantuml-previewer.vim',
        requires = { 'aklt/plantuml-syntax', 'tyru/open-browser.vim'}
    }

    -- Terminal
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require('plugins.toggleterm')
        end,
    }

    -- Partial Code Run
    use {
        'michaelb/sniprun',
        config = function()
            require('sniprun').setup{
                display = {
                    "VirtualTextOk",
                    "VirtualTextErr",
                    "LongTempFloatingWindow",
                    "Terminal",
                }
            }
        end,
        run = 'bash ./install.sh',
    }

    -- Startup time
    use {
        'dstein64/vim-startuptime',
    }

    -- Keybinding lookup with FZF
    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        },
    }

    -- Dev icons in ui
    use 'kyazdani42/nvim-web-devicons'

    -- Ranger inside nvim
    use {
        'kevinhwang91/rnvimr',
        config = function()
            require('plugins.ranger')
        end,
    }

    -- NvimTree as Filetree
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = {
          "NvimTreeOpen",
          "NvimTreeFocus",
          "NvimTreeToggle",
        },
        config = function()
          require("plugins/nvim-tree")
        end
    }

    -- Preatty list for showing things related to errors and warnings
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                auto_preview = false
            }
        end,
    }

    -- Better Search indicates number of matches
    use 'kevinhwang91/nvim-hlslens'

    -- Project Management
    -- use {
    --     "ahmedkhalf/project.nvim",
    --     config = function()
    --         require("project_nvim").setup {
    --             manual_root = true,
    --             silent_chdir = false,
    --         }
    --     end,
    -- }
    --
    -- Better Command Line
    use {
        'gelguy/wilder.nvim',
        config = function()
            require('plugins.wilder')
        end,
        requires = {"romgrk/fzy-lua-native"}
    }
    -- Testing
    -- TODO: Install and check functionallity
    --use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

    -- Keybinding configuration
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup{}
        end,
    }

    -- Rearrange Windows
    use {
        'sindrets/winshift.nvim',
    }

-----------------------------------------------
----------------- GIT   ----------------------
-----------------------------------------------

    -- Git Blame on changes
    use 'f-person/git-blame.nvim'

    -- Lazygit inside vim
    use {
        'kdheepak/lazygit.nvim',
    }

    -- Git Signs on lines
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Neogit
    -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }


-----------------------------------------------
------------- EDITING TOOLS   -----------------
-----------------------------------------------

    -- Surrond operations
    -- TODO: modifiy surrond works, add surrond doesnt
    use {
        'blackCauldron7/surround.nvim',
        config = function()
            require('surround').setup{
                mappings_style = "sandwich"
            }
        end,
    }

    -- Multiple Cursor
    use 'terryma/vim-multiple-cursors'

    -- Autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end,
    }
    -- Delete Trailing Spaces and Lines
    use "McAuleyPenney/tidy.nvim"

    -- FORMATER
    -- TODO: doesnt work
    use 'sbdchd/neoformat'

    -- Comments made easy
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- TODO highlighting
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup{}
        end
    }

    -- Generating Awesome Comments
    -- TODO: doesnt work
--    use {
--        's1n7ax/nvim-comment-frame',
--        requires = 'nvim-treesitter/nvim-treesitter',
--        config = function()
--            require('nvim-comment-frame').setup()
--        end
--    }
    -- Generation Documentation
    -- TODO: doesnt work Learn
   -- use {
   --     "danymat/neogen",
   --     config = function()
   --         require('neogen').setup {
   --             enabled = true
   --         }
   --     end,
   --     requires = "nvim-treesitter/nvim-treesitter"
   -- }

-----------------------------------------------
---------------- COMPLETION   -----------------
-----------------------------------------------

    -- Completion
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     config = function()
    --         require('plugins/nvim-cmp')
    --     end,
    -- }

    -- Completion Addons
    -- use {
    --     "hrsh7th/cmp-nvim-lsp",
    --     after = "nvim-lsp-installer"
    -- }
    -- use 'onsails/lspkind-nvim'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    -- use 'hrsh7th/cmp-nvim-lua'
    -- use 'lukas-reineke/cmp-under-comparator'
    -- use 'saadparwaiz1/cmp_luasnip'

    -- Snippets
    -- TODO: it doesn work
    -- use {
    --     'L3MON4D3/LuaSnip',
    --     config = function()
    --         require('plugins.luasnip')
    --     end,
    --     wants = "friendly-snippets",
    -- }
    -- use {
    --     "rafamadriz/friendly-snippets",
    --     event = "InsertEnter",
    -- }
end)
--EOF
