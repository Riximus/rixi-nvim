return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o",  "<cmd>Outline<CR>",      desc = "Toggle outline" },
		{ "<leader>of", "<cmd>OutlineFocus<CR>", desc = "Toggle focus" },
	},
	opts = {
		-- Your setup opts here
	},
}
