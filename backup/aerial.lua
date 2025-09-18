return {
	"stevearc/aerial.nvim",
	-- Optional but nice: devicons for the sidebar and treesitter for robust symbols
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- Defaults are quite good out of the box.
		-- These two are safe, "basic" recommendations to keep things intuitive:
		-- 1) Try both backends so you get symbols even if one isn't available.
		backends = { "lsp", "treesitter" },
		-- 2) Follow your current window (keeps the outline in sync when you switch buffers).
		attach_mode = "global",
	},
	keys = {
		-- Toggle the outline
		{ "<leader>ao", "<cmd>AerialToggle!<CR>",                              desc = "Aerial: Toggle outline" },
		-- Jump between symbols (handy when the sidebar is open)
		{ "<leader>an", "<cmd>AerialNext<CR>",                                 desc = "Aerial: Next symbol" },
		{ "<leader>ap", "<cmd>AerialPrev<CR>",                                 desc = "Aerial: Prev symbol" },
		-- Optional: open Aerial focused on the current symbol
		{ "<leader>as", "<cmd>AerialToggle! left<CR><cmd>AerialNavToggle<CR>", desc = "Aerial: Sidebar + Nav" },
	},
	-- Lazy-load when it makes sense
	cmd = {
		"AerialToggle", "AerialOpen", "AerialClose",
		"AerialNext", "AerialPrev", "AerialNavToggle",
	},
	event = "LspAttach", -- also loads when an LSP attaches (Tree-sitter alone works too)
}
