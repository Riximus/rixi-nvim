-- yazi.lua  :contentReference[oaicite:7]{index=7}
return {
	"mikavilpas/yazi.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>y", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Yazi: here" },
		{ "<leader>yw", "<cmd>Yazi cwd<cr>", desc = "Yazi: CWD" },
		{ "<leader>yr", "<cmd>Yazi toggle<cr>", desc = "Yazi: resume" },
	},
	opts = {
		open_for_directories = false,
		keymaps = { show_help = "<f1>" },
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
