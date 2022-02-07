local iron = require('iron')

-- Jupytext
vim.g.jupytext_fmt = 'py'
vim.g.jupytext_style = 'hydrogen'

 -- Send cell to IronRepl and move to next cell.
 -- Depends on the text object defined in vim-textobj-hydrogen
 -- You first need to be connected to IronRepl
vim.cmd[[
nmap ]x ctrih/^# %%<CR><CR>
]]

iron.core.set_config {
  preferred = {
    python = "ipython"
  }
}
