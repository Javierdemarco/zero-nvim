-- Base configuration of ZeroVim
-- Author: Javier de Marco
-- Description:
-- 	It sets the basic configuration of Neovim.
--
local opt = vim.opt
local g = vim.g
-- Leader Key Space
g.mapleader = ' '
-- Autoindent lines
opt.autoindent = true
opt.smartindent = true
-- Use clipboard instead of '+' and '*'
opt.clipboard = 'unnamedplus'
-- CMD height
opt.cmdheight = 2
-- Insert spaces instead of tabs
opt.expandtab = true
-- Font
opt.guifont = "FiraCode Nerd Font:13"
-- Hide buffers when abandoned
opt.hidden = true
-- Highlight search result
opt.hlsearch = true
-- Incremental search
opt.incsearch = true
-- Always status line
opt.laststatus = 2
-- Enable mouse support
opt.mouse = "nicr"
-- Set no backup files while writting a file
opt.backup = false
-- Make a backup before writting, and deletes it after sucess
opt.writebackup = true
-- Show line number and the mode is set to relative
opt.nu = true
opt.rnu = true
-- Number of spaces for autoindent
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
-- Show partial command
opt.showcmd = true
-- Insert spaces when tabbing
opt.smarttab = true
-- Spelling checking and languages
opt.spell = true
opt.spelllang = "en_us,es_es"
-- Where to split
opt.splitright = true
opt.splitbelow = true
-- Line Width and wrap
opt.textwidth = 100
opt.linebreak = true
-- Faster Mapped sequence timeout
opt.timeoutlen = 300
-- Better tab command completion
opt.wildmenu = true
-- Terminal colors
opt.termguicolors = true
-- Smart case when searching, will be case sensitive when upper case included
opt.smartcase = true
-- Highlgight current possition
opt.cursorline = true
opt.cursorcolumn = true
