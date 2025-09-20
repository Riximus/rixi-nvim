return {
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	priority = 10, -- lets it hook common keys before others
	opts = {
		overwrite = {
			auto_map = true,             -- let plugin wire the usual keys
			yank     = { enabled = true }, -- covers normal yanks *and* deletes that yank
			paste    = { enabled = false }, -- p / P glimmer out of the box
			undo     = {                 -- OFF by default -> turn it on
				enabled = true,
				-- Defaults are fine, but here’s a gentle fade that reads well:
				default_animation = {
					name = "fade",
					settings = { from_color = "DiffDelete", max_duration = 500, min_duration = 300 },
				},
				undo_mapping = "u",
			},
			redo     = {
				enabled = true,
				default_animation = {
					name = "fade",
					settings = { from_color = "DiffAdd", max_duration = 500, min_duration = 300 },
				},
				redo_mapping = "<C-r>",
			},
		},
		-- If you use a transparent background, set this to your bg color:
		-- transparency_color = "#1e1e2e",
	},
}
