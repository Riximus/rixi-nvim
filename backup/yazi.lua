-- yazi.lua  :contentReference[oaicite:7]{index=7}
return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim", lazy = true },
	keys = {
		{ "<leader>yf", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Yazi: Open yazi at current file" },
		{ "<leader>yd", "<cmd>Yazi cwd<cr>", desc = "Yazi: CWD" },
		{ "<leader>yy", "<cmd>Yazi toggle<cr>", desc = "Yazi: toggle" },
	},
	opts = {
		open_for_directories = true,
		keymaps = { show_help = "<f1>" },
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
