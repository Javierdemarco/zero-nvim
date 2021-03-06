-- Dashboard Plugin config
-- Author: Javier de Marco

local g = vim.g
local fn = vim.fn

g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))


g.dashboard_custom_header = {
"                                              ",
"    ███████╗███████╗██████╗ ██╗███╗   ███╗    ",
"    ╚══███╔╝██╔════╝██╔══██╗██║████╗ ████║    ",
"      ███╔╝ █████╗  ██████╔╝██║██╔████╔██║    ",
"     ███╔╝  ██╔══╝  ██╔══██╗██║██║╚██╔╝██║    ",
"    ███████╗███████╗██║  ██║██║██║ ╚═╝ ██║    ",
"    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝    ",
"                                              ",
}

g.dashboard_custom_section = {
    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    b = { description = { "  Find directory            SPC f d" }, command = "Telescope find_directories" },
    c = { description = { "  Recents                   SPC f r" }, command = "Telescope oldfiles" },
    d = { description = { "  Find Word In Project      SPC s p" }, command = "Telescope live_grep" },
    e = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
    f = { description = { "  Projects                  SPC f P" }, command = "Telescope projects" },
    --f = { description = { "  Bookmarks                 SPC c b" }, command = "Telescope marks" },
    g = { description = { "  Load Last Session         SPC c l" }, command = "SessionLoad" },
}

g.dashboard_custom_footer = {
    " ",
    "Zerim Loaded " .. plugins_count .. " plugins ",
}

vim.cmd [[
  augroup dashboard_settings
    autocmd!
    autocmd FileType dashboard set showtabline=0
    autocmd BufWinLeave <buffer> set showtabline=2
    autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif
    autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif
  augroup end
]]
