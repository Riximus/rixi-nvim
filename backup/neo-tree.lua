-- neo-tree.lua  :contentReference[oaicite:2]{index=2}
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer: Toggle" },
		{ "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Explorer: Reveal file" },
	},
	main = "neo-tree",
	opts = function()
		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end
		local events = require("neo-tree.events")
		return {
			window = { width = 32 },
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_current",
				window = {
					mappings = { ["t"] = "open_tabnew", ["h"] = "open_split", ["v"] = "open_vsplit" },
				},
			},
			event_handlers = {
				{ event = events.FILE_MOVED, handler = on_move },
				{ event = events.FILE_RENAMED, handler = on_move },
			},
		}
	end,
}
