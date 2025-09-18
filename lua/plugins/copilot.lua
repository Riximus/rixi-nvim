return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	--dependencies = {
	--	"giuxtaposition/blink-cmp-copilot",
	--},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false }, -- Disable inline suggestions since using blink
			panel = { enabled = true }, -- Keep panel for browsing multiple suggestions
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
		})
	end,
}
