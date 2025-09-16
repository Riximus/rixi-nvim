-- lua/plugins/neo-tree.lua
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{ "<leader>e",  "<cmd>Neotree toggle<cr>", desc = "Explorer: Toggle" },
		{ "<leader>o",  "<cmd>Neotree focus<cr>",  desc = "Explorer: Focus" },
		{ "<leader>fe", "<cmd>Neotree reveal<cr>", desc = "Explorer: Reveal File" },
	},
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		window = { width = 32 },
		filesystem = {
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "open_current",
			window = {
				mappings = {
					-- Your old keybindings
					["t"] = "open_tabnew", -- New tab
					-- Additional useful mappings
					["h"] = "open_split", -- Alternative for horizontal
					["v"] = "open_vsplit", -- Alternative for vertical
				},
			},
		},
	},
}
