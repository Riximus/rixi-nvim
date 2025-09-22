-- refactoring.lua
return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	cmd = { "Refactor" }, -- load when the command is used
	keys = {
		{
			"<leader>rr",
			function()
				local ok, telescope = pcall(require, "telescope")
				if not ok then
					vim.notify("telescope.nvim not found", vim.log.levels.ERROR)
					return
				end
				pcall(telescope.load_extension, "refactoring") -- load extension on demand
				telescope.extensions.refactoring.refactors()
			end,
			mode = { "n", "x" },
			desc = "Refactoring (Telescope)",
		},
	},

	opts = {},
}
