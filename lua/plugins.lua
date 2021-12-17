-- File Containing the Plugins and their configuration
-- Author: Javier de Marco

return require('packer').startup(function(use)
    -- Packer
    use { "wbthomason/packer.nvim" }

    ------------
    -- Colors --
    ------------

    -- Colors in HEX
    use{
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
    use{
        'winston0410/range-highlight.nvim',
        config = function()
            require('range-highlight').setup()
        end,
        requires = { 'winston0410/cmd-parser.nvim'},
    }
    -- Colorscheme
    use 'sainnhe/gruvbox-material'
    use 'ful1e5/onedark.nvim'

    -----------
    -- FZF   --
    -----------

    -- Telescope as Fuzzy Finder
    -- TODO: Keybindings
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        after = "telescope_find_directories",
        config = function()
          require("plugins/telescope")
        end
    }
    -- Fzf Directories
    use {
        "artart222/telescope_find_directories",
        after = "telescope-fzf-native.nvim"
    }
    -- Improve telescope performance
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    ------------
    -- LSP    --
    ------------

    -- LSP config
    use{
       'neovim/nvim-lspconfig',
       event = "BufEnter",
    }
    -- Colors for icons in errors and warnigns
    use 'folke/lsp-colors.nvim'
    -- LSP siganuture enable. See documentation when typing
    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function ()
          require("lsp_signature").setup()
        end
    }
    -- Simbols outline
    use 'simrat39/symbols-outline.nvim'
    -- LSP Installer
    use {
        "williamboman/nvim-lsp-installer",
        after = "nvim-lspconfig",
        config = function()
          require("plugins/lsp")
        end
    }
    use {
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-lsp-installer"
    }

    ---------------
    -- MARKDOWN  --
    ---------------

    -- Live Preview
    -- TODO Keybinding
    use 'ellisonleao/glow.nvim'
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
    use{
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = "nvim-treesitter",
    }
    -- Context when in long function
    use{
       'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup()
            vim.cmd('TSContextEnable')
        end,
        after = "nvim-treesitter",
    }
    -- Surrond operations
    -- TODO: Doesnt work
    use{
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
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require('plugins/toggleterm')
        end,
    }

    -------------
    -- DEBUG   --
    -------------

    -- Debugger
    -- TODO: Check
    use 'mfussenegger/nvim-dap'
    -- Debugger UI enhancement
    -- TODO: Check
    use{
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            require('dapui').setup()
        end,
    }
    -- Debbugger Installer
    -- TODO: Install but dap doesnt recognize it
    use "Pocco81/DAPInstall.nvim"

    -----------
    -- UI    --
    -----------

    -- Status line
    use{
        'tamton-aquib/staline.nvim',
        config = function()
            require('plugins.staline')
        end,
    }
    -- Cursor ui improvements
    use 'yamatsum/nvim-cursorline'
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
    -------------
    -- UTILITY --
    -------------

    -- Keybinding lookup with FZF
    use {
      'sudormrfbin/cheatsheet.nvim',

      requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      }
    }
    -- Dev icons in ui
    use 'kyazdani42/nvim-web-devicons'
    -- Ranger inside nvim
    use{
        'kevinhwang91/rnvimr',
        config = function()
            require('plugins.ranger')
        end,
    }
    -- File Tree
    use{
        'ms-jpq/chadtree',
        config = function()
            require('plugins.chadtree')
        end,
    }
    -- Preatty list for showing things realted to errors and warnings
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
            auto_preview = false
        }
      end
    }
    -- Better Search
    use {'kevinhwang91/nvim-hlslens'}
    -- Project Management
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
            manual_root = true,
            silent_chdir = false,
        }
      end
    }
    -- Better Command Neovim Line
    use{
        'gelguy/wilder.nvim',
        config = function()
            require('plugins.wilder')
        end,
    }
    -- Testing
    -- TODO: Check
    --use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
    -- Keybinding configuration
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- Which Key Wrapper, Easier Config
    use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key'},
    }
    -- Rearrange Windows
    -- TODO:Check
    use 'sindrets/winshift.nvim'
------------
-- GIT    --
-----------
    -- Git Blame on changes
    use 'f-person/git-blame.nvim'
    -- Git Client inside Neovim (just like Magit)
    -- TODO: Keybinding
    -- use {
    --     'TimUntersberger/neogit',
    --     config = function()
    --         require('neogit').setup{}
    --     end,
    --     requires = 'nvim-lua/plenary.nvim'
    -- }
    -- Git Signs on lines
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }
--------------
-- COMMENTS --
--------------
    -- Comments made easy
    -- TODO: Lear and Keybindings
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
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
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
--    use {
--        "danymat/neogen",
--        config = function()
--            require('neogen').setup {
--                enabled = true
--            }
--        end,
--        requires = "nvim-treesitter/nvim-treesitter"
--    }
--------------
-- CODE RUN --
--------------
    -- Partial Code Run
    -- TODO: Check and Learn, Keybind
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
-------------------
-- EDITING TOOLS --
------------------
    -- Autopair
    -- TODO: Check
    use{
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end,
    }
    -- ZEN Mode
    -- TODO: Check
    use "Pocco81/TrueZen.nvim"
    -- Delete Trailing Spaces and Lines
    -- TODO: Check
    use "McAuleyPenney/tidy.nvim"
    -- FORMATER
    -- TODO: Check
    use 'sbdchd/neoformat'
    -- FORMATER
    -- TODO: Check All languages
    -- use{
    --     'mhartington/formatter.nvim',
    --     config = function()
    --         require('formatter').setup({
    --             filetype = {
    --                 -- RUST FORMATER
    --                 rust = {
    --                     function()
    --                         return {
    --                             exe = "rustfmt",
    --                             args = {"--emit=stdout"},
    --                             stdin = true
    --                         }
    --                     end
    --                 },
    --                 -- Shell Script Formatter
    --                 sh = {
    --                     function()
    --                         return {
    --                             exe = "shfmt",
    --                             args = { "-i", 2 },
    --                             stdin = true,
    --                         }
    --                     end,
    --                 }
    --                 -- LUA Formater
    --                 lua = {
    --                     -- luafmt
    --                     function()
    --                         return {
    --                             exe = "luafmt",
    --                             args = {"--indent-count", 2, "--stdin"},
    --                             stdin = true
    --                         }
    --                     end
    --                 },
    --                 -- C/C++ Formater
    --                 cpp = {
    --                     -- clang-format
    --                     function()
    --                         return {
    --                             exe = "clang-format",
    --                             args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
    --                             stdin = true,
    --                             cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
    --                         }
    --                     end
    --                 },
    --                 -- Python Formater
    --                 python = {
    --                     -- Configuration for psf/black
    --                     function()
    --                         return {
    --                             exe = "black", -- this should be available on your $PATH
    --                             args = { '-' },
    --                             stdin = true,
    --                         }
    --                     end
    --                 }
    --             }
    --         })
    --     end,
    --
    ------------------
    --  COMPLETION  --
    ------------------

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins/nvim-cmp')
        end,
    }
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'lukas-reineke/cmp-under-comparator'
end)
