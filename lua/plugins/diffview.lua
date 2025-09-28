return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
	config = true, -- default config
	keys = {
		{
			"<leader>gd",
			function()
				local lib = require("diffview.lib")
				local view = lib.get_current_view()
				if view then
					vim.cmd("DiffviewClose") -- we're in a Diffview tab: close it
				else
					vim.cmd("DiffviewOpen") -- not in Diffview: open it
				end
			end,
			desc = "Diffview (toggle open/close)",
		},
	},
}
