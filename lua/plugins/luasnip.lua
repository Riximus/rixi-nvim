return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local luasnip = require("luasnip")

		-- Load snippets from friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Optional: Load your custom snippets
		-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })

		-- Configure LuaSnip
		luasnip.setup({
			history = true,
			delete_check_events = "TextChanged",
			region_check_events = "CursorMoved",
		})
	end,
}
