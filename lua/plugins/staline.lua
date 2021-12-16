-- Config file for Staline and Stabline plugin
-- Author: Javier de Marco

local present, staline = pcall(require, "staline")
if not present then
  return
end
local present2, stabline = pcall(require, "stabline")
if not present2 then
  return
end

staline.setup {
	sections = {
		left = {
			'- ', '-mode', 'left_sep_double',
			'file_name', ' ',
			'branch', ' ',
		},
		mid  = {'lsp'},
		right= {
			'cool_symbol',
			' ', 'lsp_name', ' ',
			'line_column',
		}
	},

	defaults={
		fg = "#ebdbb2",
		cool_symbol = "  ",
		left_separator = "",
		--right_separator = "",
		-- line_column = "%l:%c [%L]",
		true_colors = true,
		line_column = "[%l:%c] 並%p%% "
		-- font_active = "bold"
	},
	mode_colors = {
        n = "#a89984",
		i = "#84a698",
		c = "#8fbf7f",
        R = "#98971a",
		v = "#fc802d"       -- etc
	}
}

stabline.setup {
	style = "arrow", -- others: arrow, slant, bubble
    bg = "#282828",
	fg = "#ebdbb2",
    --stab_right = "",
}
