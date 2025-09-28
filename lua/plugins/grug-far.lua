return {
	"MagicDuck/grug-far.nvim",
	cmd = { "GrugFar", "GrugFarWithin" },
	-- minimal; grug-far is lazy by default
	opts = {
		-- you can leave this empty; see :h grug-far for options
	},
	keys = {
		-- Toggle panel (roughly like your <leader>S for Spectre)
		{
			"<leader>S",
			function()
				require("grug-far").toggle_instance({
					instanceName = "far",
					staticTitle = "Find and Replace",
				})
			end,
			desc = "Toggle grug-far",
		},

		-- Search current word (normal mode), like your Spectre mapping
		-- (prefills the "Search:" with <cword>)
		{
			"<leader>sw",
			function()
				require("grug-far").open({
					prefills = { search = vim.fn.expand("<cword>") },
				})
			end,
			desc = "Search current word (grug-far)",
		},

		-- Search visual selection (visual mode), like your Spectre mapping
		{
			"<leader>sw",
			function()
				require("grug-far").with_visual_selection()
			end,
			mode = "v",
			desc = "Search selection (grug-far)",
		},

		-- Search only in current file, like your <leader>sf
		{
			"<leader>sf",
			function()
				require("grug-far").open({
					prefills = { paths = vim.fn.expand("%") },
				})
			end,
			desc = "Search in current file (grug-far)",
		},
	},
}
