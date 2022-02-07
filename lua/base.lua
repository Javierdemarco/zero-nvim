-- Base configuration of ZeroVim
-- Author: Javier de Marco
-- Description:
-- 	It opts the basic configuration of Neovim.
--

-- Alias
local opt = vim.opt
local g = vim.g

-- Keyboard and Mouse
g.mapleader = ' ' -- Leader Key Space
opt.timeoutlen = 500 -- Faster Mapped sequence timeout
opt.mouse = "a" -- Enable mouse support
opt.fileencoding = "utf-8"                      -- File content encoding for the buffer
opt.signcolumn = "yes"                          -- Always show the sign column
opt.showtabline = 2 -- TabLine
opt.cmdheight = 2 -- CMD height
opt.guifont = "Monoisome"
opt.showmode = false -- Turn of Showmode
opt.nu = true -- Line Numbers
opt.rnu = true -- Line relative numbers mode
opt.laststatus = 2 -- Always status line
opt.ruler = true
opt.splitright = true -- Split right
opt.splitbelow = true -- Split below
opt.textwidth = 100 -- Line length
opt.linebreak = true -- Line wrap
opt.termguicolors = true -- Terminal colors
opt.cursorline = true -- Highlight line
opt.wrap = true                                -- Disable wrapping of lines longer than the width of window
opt.cmdheight = 1                               -- Number of screen lines to use for the command line
opt.scrolloff = 8                               -- Number of lines to keep above and below the cursor
opt.sidescrolloff = 8                           -- Number of columns to keep at the sides of the cursor
opt.history = 100                               -- Number of commands to remember in a history table
opt.timeoutlen = 300                            -- Length of time to wait for a mapped sequence
opt.updatetime = 300                            -- Length of time to wait before triggering the plugin
opt.pumheight = 10                              -- Height of the pop up menu
--opt.cursorcolumn = true -- Highlight Column
opt.hidden = true -- Hide buffers when abandoned
opt.hlsearch = true -- Highlight search result
opt.incsearch = true -- Incremental search
opt.smartcase = true -- Smart case when searching
opt.ignorecase = true -- Ignore case
opt.colorcolumn = "99999"                       -- Fix for the indentline problem
-- Backup
opt.backup = false -- No backup while saving
opt.writebackup = true -- Temporary backup before saving
opt.swapfile = false                            -- Disable use of swapfile for the buffer
opt.conceallevel = 0                            -- Show text normally
opt.undofile = true                             -- Enable persistent undo
-- Indentation and Tabs
    -- Numbers of spaces
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
    -- Spaces instead of tabs
opt.smarttab = true
opt.expandtab = true
    -- Autoindent lines
opt.autoindent = true
opt.smartindent = true
-- Commands
opt.showcmd = true -- Show parcial command
opt.wildmenu = true -- Better tab completion
opt.completeopt = "menuone,noselect"
-- Spelling checking and languages
opt.spell = false
opt.spelllang = "en_us,es_es"
-- Use clipboard instead of '+' and '*'
opt.clipboard = "unnamedplus"
-- Python interpreter
g.python3_host_prog = "/bin/python"
-- Auto cd into file
opt.autochdir = true
-- and auto open Dashboard when nothing given as argument.
vim.cmd
[[
"autocmd BufEnter * silent! lcd %:p:h
if index(argv(), ".") >= 0
  autocmd VimEnter * NVimTreeOpen
  bd1
elseif len(argv()) == 0
  autocmd VimEnter * Dashboard
endif
]]
