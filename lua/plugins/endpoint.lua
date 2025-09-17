return {
	"zerochae/endpoint.nvim",
	-- Optional pickers: choose any (or none — it can use vim.ui.select)
	dependencies = {
		"nvim-telescope/telescope.nvim", -- for Telescope picker
		-- "folke/snacks.nvim",          -- for Snacks picker
	},
	cmd = { "Endpoint" }, -- lazy-load on command
	keys = {           -- or lazy-load on these keys
		{ "<leader>E",  "<cmd>Endpoint<cr>",        desc = "Find API endpoints" },
		{ "<leader>Eg", "<cmd>Endpoint Get<cr>",    desc = "Find GET endpoints" },
		{ "<leader>Ep", "<cmd>Endpoint Post<cr>",   desc = "Find POST endpoints" },
		{ "<leader>Ed", "<cmd>Endpoint Delete<cr>", desc = "Find DELETE endpoints" },
	},
	config = function()
		require("endpoint").setup({
			-- defaults shown; tweak as you like
			cache = { mode = "none" }, -- "none" | "session" | "persistent"
			picker = { type = "telescope" }, -- "telescope" | "vim_ui_select" | "snacks"
			ui = { show_icons = true, show_method = true },
		})
	end,
}
