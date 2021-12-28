-- Indent-Blankline Plugin config
-- Author: Javier de Marco

local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
    return
end

-- Colors
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#8FBCBB gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#EBCB8B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#B48EAD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#A3BE8C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#5E81AC gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#BF616A gui=nocombine]]

vim.g.indentLine_fileTypeExclude = {'dashboard', 'help', 'terminal', 'packer', 'nvimtree'}

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent_blankline.setup {
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
