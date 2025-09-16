-- lua/plugins/indentmini.lua
return {
	"nvimdev/indentmini.nvim",
	event = "BufEnter", -- load when you enter a buffer
	opts = {
		-- All options are optional; shown here for clarity.
		-- char = "│",               -- guide character (default)
		-- minlevel = 1,             -- show from this indent level
		-- only_current = false,     -- true = only highlight the current indent range
		-- Exclude UI / special buffers
		exclude = { "help", "lazy", "alpha", "mason", "NvimTree", "Trouble" },
	},
	config = function(_, opts)
		require("indentmini").setup(opts)

		-- OPTIONAL: define colors if your colorscheme doesn't set them
		vim.api.nvim_set_hl(0, "IndentLine", { link = "Whitespace" })
		vim.api.nvim_set_hl(0, "IndentLineCurrent", { link = "CursorLineNr" })
	end,
}
