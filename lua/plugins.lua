-- File Containing the list of plugins
-- The configuration files are separated
-- Author: Javier de Marco

return require('packer').startup(function(use)
    -- Packer
    use { "wbthomason/packer.nvim" }

-----------------------------------------------
------------------- FZF   --------------------
-----------------------------------------------

    -- Telescope as Fuzzy Finder
    -- TODO: all keybidns
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("plugins.telescope")
        end,
    }
    use 'nvim-telescope/telescope-project.nvim'
    use 'xiyaowong/telescope-emoji.nvim'
    use "artart222/telescope_find_directories"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'jvgrootveld/telescope-zoxide'

-----------------------------------------------
-------------------- LSP   --------------------
-----------------------------------------------

    -- TODO: autostart and icon long
    -- use {'ms-jpq/coq_nvim', branch = 'coq',
    --     after = 'nvim-lspconfig',
    --     config = function()
    --         require("plugins.coq")
    --     end
    -- }
    -- use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

     -- Snippet engine
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
      requires = {
        -- Snippet collections
        "rafamadriz/friendly-snippets",
      },
    }

    -- Completion engine
    use {
      "hrsh7th/nvim-cmp",
      event = "BufRead",
      config = function()
        require("plugins.cmp").config()
      end,
    }

    -- Snippet completion source
    use {
      "saadparwaiz1/cmp_luasnip",
      after = "nvim-cmp",
    }

    -- Buffer completion source
    use {
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
    }

    -- Path completion source
    use {
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
    }

    -- LSP completion source
    use {
      "hrsh7th/cmp-nvim-lsp",
    }

    -- LSP manager
    use {
      "williamboman/nvim-lsp-installer",
      event = "BufRead",
      cmd = {
        "LspInstall",
        "LspInstallInfo",
        "LspPrintInstalled",
        "LspRestart",
        "LspStart",
        "LspStop",
        "LspUninstall",
        "LspUninstallAll",
      },
    }

    -- Built-in LSP
    use {
      "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require "plugins.lsp"
      end,
    }

    -- LSP enhancer
    use {
      "tami5/lspsaga.nvim",
      event = "BufRead",
      config = function()
        require("plugins.lspsaga").config()
      end,
    }

    -- LSP symbols
    use {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      setup = function()
        require("plugins.symbols-outline").setup()
      end,
    }


    -- TODO: config
    use 'liuchengxu/vista.vim'

-----------------------------------------------
----------------- Markdown   ------------------
-----------------------------------------------

    -- Live Preview on floating window
    -- TODO: config
    use 'ellisonleao/glow.nvim'

-----------------------------------------------
----------------- DEBUG   --------------------
-----------------------------------------------

    -- TODO: config
    use 'mfussenegger/nvim-dap'
    use "Pocco81/DAPInstall.nvim"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


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
            require('plugins.treesitter')
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
    use 'javierdemarco/dark-forest'
    -- Buffer Line
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('plugins.bufferline')
        end
    }
    -- Status Line
    use {
        'feline-nvim/feline.nvim',
        config = function()
           require('plugins.feline')
        end
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
    use {'p00f/nvim-ts-rainbow'
    , after = 'nvim-treesitter'}


-----------------------------------------------
----------------- UTILITY   --------------------
-----------------------------------------------

    -- GODOT engine integration
    --use 'habamax/vim-godot'

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
    -- TODO: config
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
          require("plugins.nvim-tree")
        end
    }
    -- Preatty list for showing things related to errors and warnings
    -- TODO: see if it needs config
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
    -- TODO: config and keybinds
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                manual_root = true,
                silent_chdir = false,
            }
        end,
    }
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
    -- TODO: see if it needs config or default is good, check keybinds
    use {
        'sindrets/winshift.nvim',
    }

-----------------------------------------------
----------------- GIT   ----------------------
-----------------------------------------------

    -- Git Blame on changes
    -- TODO: check if it needs config
    use 'f-person/git-blame.nvim'

    -- Lazygit inside vim
    -- TODO: check if it needs config
    use {
        'kdheepak/lazygit.nvim',
    }

    -- Git Signs on lines
    -- TODO: check if it needs config
    use {
        'lewis6991/gitsigns.nvim',
        event = "BufRead",
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Neogit
    --use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    -- TODO: check if it needs config
    use {'tpope/vim-fugitive'}


-----------------------------------------------
------------- EDITING TOOLS   -----------------
-----------------------------------------------
    -- Jupyter In Neovim
    use {
      "ahmedkhalf/jupyter-nvim",
      run = ":UpdateRemotePlugins",
      config = function()
        require("jupyter-nvim").setup{}
      end
    }

    -- Surrond operations
    -- TODO: Good config (default keybinds is "s")
    use {
        'blackCauldron7/surround.nvim',
        config = function()
            require('surround').setup{
                mappings_style = "sandwich"
            }
        end,
    }

    -- Multiple Cursor
    -- TODO: config and keybind
    use 'terryma/vim-multiple-cursors'

    -- Autopair
    -- TODO: see if its needs config
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end,
    }
    -- Delete Trailing Spaces and Lines
    -- TODO: see if it needs config
    use "McAuleyPenney/tidy.nvim"

    -- FORMATER
    -- TODO: doesnt work
    use 'sbdchd/neoformat'

    -- Comments made easy
    -- TODO: seemds good in default, check if needs config
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- TODO: highlighting
    -- TODO: config :Todo{Quickfix, Telescope, LocList, Trouble}
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
------------- Python   -----------------
-----------------------------------------------

    --
    use {'hkupty/iron.nvim',
        config = function()
            require("plugins.iron")
        end,
    }
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-line'
    use 'GCBallesteros/vim-textobj-hydrogen'
    use 'GCBallesteros/jupytext.vim'

end)
--EOF
