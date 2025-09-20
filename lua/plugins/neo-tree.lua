-- lua/plugins/neo-tree.lua
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{ "<leader>e",  "<cmd>Neotree toggle<cr>", desc = "Explorer: Toggle" },
		--{ "<leader>o",  "<cmd>Neotree focus<cr>",  desc = "Explorer: Focus" },
		{ "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Explorer: Reveal File" },
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
	-- Forward Neo-tree's rename/move events to Snacks.rename
	config = function(_, opts)
		local function on_move(data)
			-- LSP/workspace-aware rename after the FS op
			Snacks.rename.on_rename_file(data.source, data.destination)
		end

		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		table.insert(opts.event_handlers, { event = events.FILE_MOVED, handler = on_move })
		table.insert(opts.event_handlers, { event = events.FILE_RENAMED, handler = on_move })

		require("neo-tree").setup(opts)
	end,
}
