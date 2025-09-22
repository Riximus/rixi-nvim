return {
	"nvim-focus/focus.nvim",
	version = false,
	event = "VeryLazy",

	opts = {
		enable = false,
		autoresize = { enable = true },
		ui = {
			number = false,
			relativenumber = false,
			cursorline = true,
			signcolumn = true,
		},
	},

	-- runs before the plugin loads; 	
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "neo-tree", "NeoTree", "NvimTree", "help", "Trouble", "alpha", "Overseer", "nvim-dap-ui" },
			callback = function()
				vim.b.focus_disable = true
			end,
		})
	end,
}
