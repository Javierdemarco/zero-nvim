-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Dap
map("n", "<F5>", ":lua require(\"dap\").continue()<CR>")
map("n", "<leader>te", ":lua require(\"dap\").terminate()<CR>")
map("n", "<leader>br", ":lua require(\"dap\").toggle_breakpoint()<CR>")
map("n", "<leader>Br", ":lua require(\"dap\").set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<F10>", ":lua require(\"dap\").step_over()<CR>")
map("n", "<F11>", ":lua require(\"dap\").step_into()<CR>")
map("n", "<F12>", ":lua require(\"dap\").step_out()<CR>")
map("n", "<leader>sb", ":lua require(\"dap\").step_back()<CR>")
map("n", "<leader>rc", ":lua require(\"dap\").run_to_cursor()<CR>")
map("n", "<leader>ro", ":lua require(\"dap\").repl.open()<CR>")
map("n", "<leader>dt", ":lua require(\"dapui\").toggle()<CR>")
map("n", "<leader>dl", ":lua require(\"dap\").run_last()<CR>")
