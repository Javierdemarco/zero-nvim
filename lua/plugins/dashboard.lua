-- Dashboard Plugin config
-- Author: Javier de Marco

local g = vim.g
local fn = vim.fn

g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
"                                                                    ",
"         __________ ____   ___   __     _____ __  __                ",
"        |__  / ____|  _ \\ / _ \\  \\ \\   / /_ _|  \\/  |               ",
" _____    / /|  _| | |_) | | | |  \\ \\ / / | || |\\/| |  _____        ",
"|_____|  / /_| |___|  _ <| |_| |   \\ V /  | || |  | | |_____|       ",
"        /____|_____|_| \\_ \\___/     \\_/  |___|_|  |_|               ",
"                                                                    ",
}

g.dashboard_custom_section = {
    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    b = { description = { "  Find directory            SPC f d" }, command = "Telescope find_directories" },
    c = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
    d = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
    e = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
    f = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
    g = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" }
}

g.dashboard_custom_footer = {
    " ",
    "ZeroVim Loaded",
    "ZeroVim v0.1"
}

-- Disable statusline and cursorline in dashboard.
vim.cmd("autocmd BufEnter * if &ft is \"dashboard\" | set laststatus=0 | else | set laststatus=2 | endif")
vim.cmd("autocmd BufEnter * if &ft is \"dashboard\" | set nocursorline | endif")
