-- tiny-inline-diagnostic.lua  :contentReference[oaicite:6]{index=6}
return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	priority = 1000,
	init = function()
		-- Do this immediately so VT is off even before the plugin loads
		vim.diagnostic.config({ virtual_text = false })
	end,
	main = "tiny-inline-diagnostic",
	opts = {
		preset = "powerline",
		transparent_bg = false,
		hi = { background = "NONE", mixing_color = "NONE" },
		blend = { factor = 0.0 },
		options = {
			use_icons_from_diagnostic = true,
			throttle = 20,
			enable_on_insert = false,
			enable_on_select = false,
		},
	},
}
