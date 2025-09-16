return {
	"yorickpeterse/nvim-window",
	keys = {
		{ "<C-w><C-w>", function() require('nvim-window').pick() end, desc = "Pick Window" },
	},
	config = true,
}
