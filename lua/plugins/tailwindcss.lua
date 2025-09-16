return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local has_tw = util.root_pattern(
			"tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts",
			"tailwind.config.mjs", "tailwind.config.mts"
		)
		lspconfig.tailwindcss.setup({
			single_file_support = false,
			root_dir = function(fname) return has_tw(fname) or nil end,
			filetypes = { "vue", "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "astro" },
		})
	end,
}
