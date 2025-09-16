return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
	keys = {
		{ "<leader>e",  "<cmd>NvimTreeToggle<cr>",   desc = "Explorer: Toggle" },
		{ "<leader>o",  "<cmd>NvimTreeFocus<cr>",    desc = "Explorer: Focus" },
		{ "<leader>fe", "<cmd>NvimTreeFindFile<cr>", desc = "Explorer: Reveal File" },
	},
	opts = {
		view = { width = 32 },
		renderer = { group_empty = true },
		filters = { dotfiles = false },
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs,
					{
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc =
						    "nvim-tree: " .. desc
					})
			end
			api.config.mappings.default_on_attach(bufnr)
			map("h", api.node.navigate.parent_close, "Close Dir")
			map("H", api.tree.toggle_hidden_filter, "Toggle Dotfiles")
			map("C", api.tree.collapse_all, "Collapse All")
			--map("r", api.tree.reload,                "Refresh")
			map("t", api.node.open.tab, "Open in New Tab")
			map("<C-h>", api.node.open.horizontal, "Horizontal	Split")
			-- In your nvim-tree on_attach function, add:
			map("<C-r>", api.tree.change_root_to_node, "CD to Node (Go to selected folder)")
			map("<C-u>", function() api.tree.change_root(vim.loop.cwd()) end,
				"CD to CWD (Go back to project root)")
		end,
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
