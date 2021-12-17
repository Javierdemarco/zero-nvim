-- Indent-Blankline Plugin config
-- Author: Javier de Marco

local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
    return
end

vim.g.indentLine_fileTypeExclude = {'dashboard', 'help', 'terminal', 'packer'}

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

indent_blankline.setup {
    show_current_context = true,
    show_current_context_start = true,
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    --     "IndentBlanklineIndent3",
    --     "IndentBlanklineIndent4",
    --     "IndentBlanklineIndent5",
    --     "IndentBlanklineIndent6",
    -- },
}
