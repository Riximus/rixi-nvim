return {
	"nvim-focus/focus.nvim",
	version = false,
	event = "VeryLazy",

	opts = {
		enable = true,
		autoresize = { enable = true },
		ui = {
			number = false,
			relativenumber = false,
			cursorline = true,
			signcolumn = true,
		},
	},

	-- runs before the plugin loads; good spot for your autocmd
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "neo-tree", "NvimTree", "help", "Trouble", "alpha" },
			callback = function()
				vim.b.focus_disable = true
			end,
		})
	end,
}
