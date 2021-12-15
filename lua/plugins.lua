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
        config = function()
            require('colorizer').setup{
                "*",
                css = { rgb_fn = true; }
            }
            vim.cmd("ColorizerArrachToBuffer")
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
    -- TODO: Take vim.cmd to global.lua
    use{
        'sainnhe/gruvbox-material',
        config = vim.cmd('colorscheme gruvbox-material')
    }

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
--    use{
--       'neovim/nvim-lspconfig',
--        config = function()
--            -- Python
--            require('lspconfig').pylsp.setup()
--        end,
--    }
    -- Colors for icons in errors and warnigns
--    use 'folke/lsp-colors.nvim'
    -- LSP siganuture enable. See documentation when typing
--    use 'ray-x/lsp_signature.nvim'
    -- Simbols outline
--    use 'simrat39/symbols-outline.nvim'
    -- LSP Installer
--    use 'williamboman/nvim-lsp-installer'

    ---------------
    -- MARKDOWN  --
    ---------------

    -- Live Preview
    -- TODO Keybinding
    use 'ellisonleao/glow.nvim'
    -- Markdown Workflow
    --use({'jakewvincent/mkdnflow.nvim',
         --config = function()
            --require('mkdnflow').setup({
                -- Config goes here; leave blank for defaults
            --})
         --end
    --})
    -- Preview in Browser
    -- TODO: Doesnt work
    use 'iamcco/markdown-preview.nvim'

    --------------
    -- SINTAX   --
    --------------

    -- Better sintax highlight
    -- TODO: Check functionality
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
    -- TODO: Check
    use{
        'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup()
            vim.cmd('TSContextEnable')
        end,
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
    -- TODO: Doesnt work when kitty has neovim keys
    use {"akinsho/toggleterm.nvim"}

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
-------------
-- UTILITY --
-------------
    -- Keybinding lookup with FZF
    -- TODO: Check
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
    -- TODO: Check
    use 'kevinhwang91/rnvimr'
    -- File Tree
    -- TODO: Learn
    use 'ms-jpq/chadtree'
    -- Preatty list for showing things realted to errors and warnings
    -- TODO: Check
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- Better Search
    -- TODO: Check, Learn and Keybind
    use {'kevinhwang91/nvim-hlslens'}
    -- Project Management
    -- TODO: Check and Learn and Keybind
    -- Lua
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- Better Command Neovim Line
    -- TODO: Check
    use 'gelguy/wilder.nvim'
    -- Testing
    -- TODO: Check
    use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
    -- Keybinding configuration
    -- TODO:Check
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
    -- TODO:Check
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
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
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
    use {
        's1n7ax/nvim-comment-frame',
        requires = {
            { 'nvim-treesitter' }
        },
        config = function()
            require('nvim-comment-frame').setup()
        end
    }
    -- Generation Documentation
    -- TODO: doesnt work Learn
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {
                enabled = true
            }
        end,
        requires = "nvim-treesitter/nvim-treesitter"
    }
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
        -- Motion with Tab outside of pairs
    -- TODO: Check, Learn, Keybind
    use {
      'abecodes/tabout.nvim',
      config = function()
        require('tabout').setup {
            tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
            backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
            act_as_tab = true, -- shift content if tab out is not possible
            act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
            enable_backwards = true, -- well ...
            completion = true, -- if the tabkey is used in a completion pum
            tabouts = {
              {open = "'", close = "'"},
              {open = '"', close = '"'},
              {open = '`', close = '`'},
              {open = '(', close = ')'},
              {open = '[', close = ']'},
              {open = '{', close = '}'}
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {} -- tabout will ignore these filetypes
        }
      end,
        wants = {'nvim-treesitter'}, -- or require if not used so far
        after = {'completion-nvim'} -- if a completion plugin is using tabs load it before
    }
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

end)
