return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		config = function()
			require("nvim-highlight-colors").setup({
				-- render colors as virtual text blocks
				render = "virtual",
				virtual_symbol = "■",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = " ",
				-- inline looks like VS Code’s swatches
				virtual_symbol_position = "inline", -- requires Neovim 0.10+
				-- nice defaults; turn on what you need
				enable_hex = true,
				enable_short_hex = true,
				enable_rgb = true,
				enable_hsl = true,
				enable_hsl_without_function = true,
				enable_var_usage = true,
				enable_named_colors = true,
				enable_tailwind = true, -- if you use Tailwind
			})
		end,
	},
}
