return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	opts = {},
	keys = {
		{
			"<leader>rr",
			function()
				-- make sure Telescope is present and the extension is loaded, then open the picker
				local ok, telescope = pcall(require, "telescope")
				if not ok then
					vim.notify("telescope.nvim not found", vim.log.levels.ERROR)
					return
				end
				pcall(telescope.load_extension, "refactoring")
				telescope.extensions.refactoring.refactors()
			end,
			mode = { "n", "x" },
			desc = "Refactoring (Telescope)",
		},
	},

	config = function()
		require("refactoring").setup({})
		-- load the Telescope extension here too (harmless if loaded twice via pcall above)
		pcall(function() require("telescope").load_extension("refactoring") end)
	end,
}
