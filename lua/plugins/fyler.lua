return {
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	branch = "stable",
	keys = {
		{ "<leader>ee", "<cmd>Fyler kind=float<cr>", desc = "Fyler: Toggle File Explorer" },
	},
	opts = {
		icon_provider = "nvim_web_devicons",
		default_explorer = true,
		icon = {
			directory_collapsed = " ",
			directory_expanded = " ",
			directory_empty = " ",
		},
		--[[win = {
			kind = "float",
		},]]
	},
}
