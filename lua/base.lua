-- Base configuration of ZeroVim
-- Author: Javier de Marco
-- Description:
-- 	It sets the basic configuration of Neovim.
--

-- Alias
local opt = vim.opt
local g = vim.g

-- Keyboard and Mouse
g.mapleader = ';' -- Leader Key Space
opt.timeoutlen = 1000 -- Faster Mapped sequence timeout
opt.mouse = "a" -- Enable mouse support

-- GUI
opt.cmdheight = 2 -- CMD height
opt.guifont = "FiraCode Nerd Font:13" -- Font
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
--opt.cursorcolumn = true -- Highlight Column

-- Hide buffers when abandoned
opt.hidden = true

-- Search
opt.hlsearch = true -- Highlight search result
opt.incsearch = true -- Incremental search
opt.smartcase = true -- Smart case when searching
opt.ignorecase = true -- Ignore case

-- Backup
opt.backup = false -- No backup while saving
opt.writebackup = true -- Temporary backup before saving

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
opt.spell = true
opt.spelllang = "en_us,es_es"

-- Use clipboard instead of '+' and '*'
opt.clipboard = 'unnamedplus'
