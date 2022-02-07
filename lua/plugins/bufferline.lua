local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

bufferline.setup{
    options = {
        numbers = "ordinal",
        tab_size = 18,
        diagnostics = "nvim_lsp",
        offsets = {{filetype = "NvimTree", text = "File Explorer", paddig = 1}},
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        always_show_bufferline = true
    }
}
