-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Dap
map("n", "<F5>", ":lua require(\"dap\").continue()<CR>")
map("n", "<F10>", ":lua require(\"dap\").step_over()<CR>")
map("n", "<F11>", ":lua require(\"dap\").step_into()<CR>")
map("n", "<F12>", ":lua require(\"dap\").step_out()<CR>")

-- Which Key
--
local wk = require('which-key')

local keymap = {
    f = {
        name = 'File',
        d = { "<cmd>Telescope find_directories<cr>", "Find Directory" },
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        b = { "<cmd> Telescope file_browser<cr>", "File Browser" },
        p = { "<cmd>Glow<cr>", "Markdown Preview" },
        n = { "<cmd>DashboardNewFile<cr>", "New File" },
        P = { "<cmd>Telescope projects<cr>", "Projects" },
    },
    s = {
        name = 'Search',
        p = { "<cmd>Telescope grep_string<cr>", "Project Search String" },
        s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer Search String" },

    },
    c = {
        name = "Commands",
        c = { "<cmd>Telescope commands<cr>", "List Commands" },
        h = { "<cmd>Telescope command_history<cr>", "Command History" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
        b = { "<cmd>Telescope bookmarks<cr>", "Bookmarks" },
        s = { "<cmd>SessionSave<cr>", "Session Save"},
        l = { "<cmd>SessionLoad<cr>", "Session Load"},
        r = { "<cmd>SnipRun<cr>", "Snip Run"},
        R = { "<cmd>%SnipRun<cr>", "Snip File Run"},
        H = { "<cmd>nohlsearch<cr>", "Disable Highlight Current Search"},
    },
    b = {
        name = 'Buffers',
        b = { "<cmd>Telescope buffers<cr>", "Buffer List" },
        n = { "<cmd>BufferNext<cr>", "Buffer Next"},
        p = { "<cmd>BufferPrevious<cr>", "Buffer Previous"},
        N = { "<cmd>BufferMoveNext<cr>", "Move Buffer Previous"},
        P = { "<cmd>BufferMovePrevious<cr>", "Move Buffer Previous"},
        c = { "<cmd>BufferClose<cr>", "Buffer Close"},
        C = { "<cmd>BufferCloseAllButCurrent<cr>", "Buffer Close All But Current"},
        o = {
            name = "Order",
            n = { "<cmd>BufferOrderByBufferNumber<cr>", "Order By Nuber"},
            l = { "<cmd>BufferOrderByBufferLanguage<cr>", "Order By Language"},
            d = { "<cmd>BufferOrderByBufferDirectory<cr>", "Order By Directory"},
        }
    },
    g = {
        name = 'Git',
        b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
    },
    l = {
        name = "LSP",
        i = { "<cmd>LspInstall<cr>", "Install Langauge Server" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump To Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump To Declaraion" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Info" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },

    },
    t = {
        name = "Toggle",
        s = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
        t = {
            name = "Terminal",
            v = { "<cmd>ToggleTerm dir=. direction=vertical<cr>", "Vertical"},
            h = { "<cmd>ToggleTerm dir=. direction=horizontal<cr>", "Horizontal"},
            f = { "<cmd>ToggleTerm dir=. direction=float<cr>", "Float"},

        },
        r = {
            name = "Ranger",
            r = { "<cmd>RnvimrToggle<cr>", "Ranger" },
            s = { "<cmd>RnvimrResize<cr>", "Ranger" },
        },
        c = { "<cmd>ChADopen"}
    },
    T = {
        name = "Trouble",
        t = { "<cmd>TroubleToggle<cr>", "Base Trouble" },
        D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Worspace Diagnostics" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
        f = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
        l = { "<cmd>TroubleToggle loclist<cr>", "LocList" },
        r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    },
    d = {
        name = "Debugger",
        c = { ":lua require(\"dap\").continue()<CR>", "Continue"},
        t = { ":lua require(\"dap\").terminate()<CR>", "Terminate"},
        b = { ":lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle Breakpoint"},
        s = { ":lua require(\"dap\").set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", "Set Condition Breakpoint"},
        l = { ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input('Log Point Message '))<CR>", "Set Condition Breakpoint"},
        o = { ":lua require(\"dap\").step_over()<CR>", "Step Over"},
        i = { ":lua require(\"dap\").stip_into()<CR>", "Step Into"},
        u = { ":lua require(\"dap\").step_out()<CR>", "Step Out"},
        k = { ":lua require(\"dap\").step_back()<CR>", "Step Back"},
        r = { ":lua require(\"dap\").run_to_cursor()<CR>", "Run To Cursor"},
        T = { ":lua require(\"dapui\").toggle()<CR>", "Toggle DAP UI"},
        R = { ":lua require(\"dap\").run_last()<CR>", "Run Last"},
    },
    w = {
        name = "Windows",
        H = { "<cmd>WinShift left<cr>", "Move Window To Left" },
        J = { "<cmd>WinShift down<cr>", "Move Window Down" },
        K = { "<cmd>WinShift up<cr>", "Move Window Up" },
        L = { "<cmd>WinShift right<cr>", "Move Window To Right" },
        X = { "<cmd>WinShift swap<cr>", "Swap Two Windows" },
        s = {
            name = "Split",
            v = { "<cmd>vs<cr>", "Vertical" },
            h = { "<cmd>sp<cr>", "Horizontal" },
        },
        n = { "<cmd>new<cr>", "New Window" },
        q = { "<cmd>q<cr>", "Quit Window" },
        Q = { "<cmd>q!<cr>", "Quit Window Without Saving" },
        h = { "<C-W>h<cr>", "Move To Window Left" },
        j = { "<C-W>j<cr>", "Move To Window Down" },
        k = { "<C-W>k<cr>", "Move To Window Up" },
        l = { "<C-W>l<cr>", "Move To Window Left" },
        w = { "<C-W>w<cr>", "Move To Other Window" },
        e = { "<C-W>=<cr>", "Make Windows Equal" },
        t = { "<C-W>+<cr>", "Increase Width" },
        T = { "<C-W>-<cr>", "Decrease Width" },
        a = { "<C-W><<cr>", "Icrease Height" },
        A = { "<C-W>><cr>", "Decrease Height" },
    }
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>", -- Leader Key
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

wk.register(keymap, opts)

-- Visual mode keymapings
local vkeymap = {
    d = { "<cmdlua require(\"dapui\").eval()<cr>", "Eval Expresion"},
    r = { "<cmd>'<,'>SnipRun<cr>", "Snip Visual Run"},
}

local vopts = {
    mode = "v", -- NORMAL mode
    prefix = "<leader>", -- Leader Key
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

wk.register(vkeymap, vopts)
