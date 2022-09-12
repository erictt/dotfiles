local present, lualine = pcall(require, "lualine")

if not present then
	return
end

local options = {
	options = {
		theme = "gruvbox-material",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = { "nvim_lsp", "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = { fg = "#ea6962" }, -- Changes diagnostics' error color.
					warn = { fg = "#d8a657" }, -- Changes diagnostics' error color.
					info = { fg = "#7daea3" }, -- Changes diagnostics' error color.
					hint = { fg = "#a9b665" }, -- Changes diagnostics' error color.
				},
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
		},
		lualine_c = { "filename" },
		lualine_x = { "lsp", "filetype" },
	},
}

lualine.setup(options)
