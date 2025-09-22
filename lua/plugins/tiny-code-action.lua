return {
	"rachartier/tiny-code-action.nvim",
	--event = "LspAttach",           -- load when an LSP attaches
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-telescope/telescope.nvim", -- optional (picker)
		-- If you prefer another picker, comment telescope and enable one of:
		-- "ibhagwan/fzf-lua",
		-- { "folke/snacks.nvim", opts = { terminal = {} } },
	},
	opts = {
		-- Backends: "vim" | "delta" | "difftastic" | "diffsofancy"
		backend = "vim",
		-- Pickers: "telescope" | "snacks" | "select" | "buffer" | "fzf-lua"
		picker = "telescope",
		resolve_timeout = 100,
		-- Customize icons / highlights if you like:
		-- signs = { ["source.organizeImports"] = { "", { link = "DiagnosticWarning" } }, ... }
	},
	keys = {
		{
			"<leader>ca",
			function()
				require("tiny-code-action").code_action()
			end,
			mode = { "n", "x" },
			desc = "Code Actions (tiny-code-action)",
			silent = true,
		},
	},
}
