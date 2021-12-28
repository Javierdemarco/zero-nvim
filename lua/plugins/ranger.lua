-- Rnvimr (Ranger) Plugin config
-- Author: Javier de Marco

local g = vim.g

-- Make ranger replace Netrw file explorer
g.rnvimr_enable_x = 1

-- Hide ranger after picking a file
g.rnvimr_enable_picker = 1

--Hide files included in gitignore
g.rnvimr_hide_gitignore = 0

-- Delete buffer if ranger deletes file
g.rnvimr_enable_bw = 1
