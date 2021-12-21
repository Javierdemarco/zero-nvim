-- ChadTree Plugin config
-- Author: Javier de Marco


local chadtree_settings = {
    ["view.width"] = 25,
    ["theme.text_colour_set"] = "solarized_dark",
    ["theme.icon_colour_set"] = "none",
    ["options.follow"] = false,
    ["options.show_hidden"] = true,
    ["view.window_options.signcolumn"] = "yes",
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
