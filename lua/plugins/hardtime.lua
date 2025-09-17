return {
	"m4xshen/hardtime.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disable_mouse = false,
		disabled_keys = {
			["<Up>"] = false,
			["<Right>"] = false,
			["<Down>"] = false,
			["<Left>"] = false,
		},
		force_exit_insert_mode = false,
		max_insert_idle_ms = 5000,
	},
}
