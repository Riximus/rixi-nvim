return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require('tiny-inline-diagnostic').setup({
			preset = "powerline",
			transparent_bg = false,
			-- kill the grey bar without killing the preset
			hi = {
				background = "NONE", -- was CursorLine
				mixing_color = "NONE", -- don't blend with Normal
			},
			blend = { factor = 0.0 }, -- no extra tint
			options = {
				use_icons_from_diagnostic = true,
				--set_arrow_to_diag_color = true,

				throttle = 20,

				-- Enable diagnostics in Insert mode
				-- If enabled, consider setting throttle to 0 to avoid visual artifacts
				enable_on_insert = false,

				-- Enable diagnostics in Select mode (e.g., when auto-completing with Blink)
				enable_on_select = false,

			}
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
	end
}
