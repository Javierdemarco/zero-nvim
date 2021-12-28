-- Treesitter Plugin config
-- Author: Javier de Marco

local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

nvim_treesitter.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    matchup = {
        enable = true,
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
}

vim.cmd
[[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set foldlevel=99
]]
--TSInstall bash
--TSInstall c
--TSInstall cmake
--TSInstall comment
--TSInstall cpp
--TSInstall json
--TSInstall lua
--TSInstall python
--TSInstall rust
--TSInstall vim
