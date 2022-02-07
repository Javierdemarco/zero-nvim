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
-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("v", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)
-- Visual Block --
-- Move text up and down
map("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- Which Key
--
local wk = require('which-key')

local keymap = {
    f = {
        name = 'File',
        d = { "<cmd>Telescope find_directories<cr>", "Find Directory" },
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        p = { "<cmd>Glow<cr>", "Markdown Preview" },
        n = { "<cmd>DashboardNewFile<cr>", "New File" },
        P = { "<cmd>Telescope projects<cr>", "Projects" },
        s = { "<cmd>w<cr>", "Save File" },
        D = { "<cmd>Telescope zoxide list<cr>", "List Zoxide Directories" },
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
        t = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        s = { "<cmd>SessionSave<cr>", "Session Save"},
        l = { "<cmd>SessionLoad<cr>", "Session Load"},
        r = { "<cmd>SnipRun<cr>", "Snip Run"},
        R = { "<cmd>%SnipRun<cr>", "Snip File Run"},
        H = { "<cmd>nohlsearch<cr>", "Disable Highlight Current Search"},
    },
    b = {
        name = 'Buffers',
        b = { "<cmd>Telescope buffers<cr>", "Buffer List" },
        n = { "<cmd><cr>", "Buffer Next"},
        p = { "<cmd><cr>", "Buffer Previous"},
        N = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer Previous"},
        P = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer Previous"},
        c = { "<cmd>bd<cr>", "Buffer Close"},
    },
    g = {
        name = 'Git',
        b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
        G = { "<cmd>LazyGit<cr>", "LazyGit"},
        g = { "<cmd>Git<cr>", "Git Status"},
    },
    l = {
        name = "LSP",
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump To Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump To Declaraion" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Info" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
        R = { "<cmd>Telescope lsp_references<cr>", "Telescope References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Telescope Document Symbols" },
        S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Telescope Workspace Symbols" },
        t = { "<cmd>Telescope treesitter<cr>", "Telescope Treesitter" },

    },
    o = {
        name = "Open",
        s = { "<cmd>Vista<cr>", "Symbols Outline" },
        t = {
            name = "Terminal",
            v = { "<cmd>ToggleTerm dir=. direction=vertical<cr>", "Vertical"},
            h = { "<cmd>ToggleTerm dir=. direction=horizontal<cr>", "Horizontal"},
            f = { "<cmd>ToggleTerm dir=. direction=float<cr>", "Float"},

        },

        O = { "<cmd>NvimTreeFocus<CR>", "NvinTree Focus"},
        r = {
            name = "Ranger",
            r = { "<cmd>RnvimrToggle<cr>", "Ranger" },
            s = { "<cmd>RnvimrResize<cr>", "Ranger" },
        },
        p = {"<cmd>PlantumlToggle<cr>", "PlantUml"},
        n = { "<cmd>NvimTreeToggle<cr>", "NvimTree"},
        P = {"<cdm>PackerSync<cr>", "PackerSync"},
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
        t = { ":lua require(\"dap\").terminate()<CR>", "Terminate"},
        b = { ":lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle Breakpoint"},
        s = { ":lua require(\"dap\").set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", "Set Condition Breakpoint"},
        l = { ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input('Log Point Message '))<CR>", "Set Condition Breakpoint"},
        k = { ":lua require(\"dap\").step_back()<CR>", "Step Back"},
        r = { ":lua require(\"dap\").run_to_cursor()<CR>", "Run To Cursor"},
        T = { ":lua require(\"dapui\").toggle()<CR>", "Toggle DAP UI"},
        R = { ":lua require(\"dap\").run_last()<CR>", "Run Last"},
        B = { "<cmd>Telescope dap list_breakpoints<CR>", "List Breakpoints"},
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
        w = { "<C-W>w<cr>", "Move To Other Window" },
        e = { "<C-W>=<cr>", "Make Windows Equal" },
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
