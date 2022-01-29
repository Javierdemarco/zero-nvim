local present, dap = pcall(require, "dap")
if not present then
    return
end

local dap_install = require("dap-install")
dap_install.setup {
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
}
local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
  dap_install.config(debugger)
end
dap_install.config(
	"python",
    {
        adapters = {
            type = "executable",
            command = "python",
            args = {"-m", "debugpy.adapter"}
        },
        configurations = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                console = "integratedTerminal",
                program = "${file}",
                pythonPath = "/usr/bin/python",
            }
        }
    }
)
-- DEBUG config for c/c++/Rust
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    externalConsole = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Configuration for external terminals
dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/kitty';
  args = {'-e'};
}

-- DAP UI configuration
require("dapui").setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.45, -- Can be float or integer > 1
      },
      -- { id = "breakpoints", size = 0.25 },
      { id = "watches", size = 0.45 },
      { id = "stacks", size = 0.10 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 0,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = 0.5, -- These can be integers or a float between 0 and 1.
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
}

dap.defaults.fallback.terminal_win_cmd = '10split new'
vim.fn.sign_define('DapBreakpoint', {text='● ', texthl='DiagnosticSignError', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='● ', texthl='DiagnosticSignWarn', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='● ', texthl='DiagnosticSignInfo', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='→ ', texthl='DiagnosticSignWarn', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointReject', {text='●' , texthl='DiagnosticSignHint', linehl='', numhl=''})
