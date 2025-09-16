return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	-- optionally tweak options:
	opts = { flavour = "mocha" },
	config = function()
		-- if you set opts above and want them applied:
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}

