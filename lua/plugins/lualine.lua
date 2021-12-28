-- LuaLine and BarBar Plugins Config file
-- Author: Javier de Marco

-- Check if Toggleterm is present and alias
local present, lualine = pcall(require, "lualine")
if not present then
  return
end

-- Tab Bar config
vim.g.bufferline = {
    -- Excludes buffers from the tabline
    exclude_ft = {'wiler', 'dap', 'dashboard'},
    exclude_name = {''},
}

-- LuaLine Config
lualine.setup{
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
              "toggleterm",
              "dapui_scopes",
              "dapui_breakpoints",
              "dapui_stacks",
              "dapui_watches",
              "dap-repl",
              "nvimtree",
              "dashboard",
        },
        always_divide_middle = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {'fzf', 'nvim-tree', 'quickfix', 'toggleterm', 'symbols-outline'}
}
