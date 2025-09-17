-- lua/plugins/i18n.lua (or wherever you keep plugin specs)
return {
	{
		"yelog/i18n.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
			"nvim-treesitter/nvim-treesitter",
			-- optional completion sources (pick one if you use it)
			"saghen/blink.cmp", -- preferred by the plugin author
			-- "hrsh7th/nvim-cmp",         -- experimental integration
		},
		config = function()
			require("i18n").setup({
				-- locales: first one is treated as the “default”
				locales = { "en", "de" },
				-- sources can be strings or tables with pattern/prefix
				sources = {
					"src/locales/{locales}.json",
					-- examples for TS modules:
					-- { pattern = "src/locales/lang/{locales}/{module}.ts",            prefix = "{module}." },
					-- { pattern = "src/views/{bu}/locales/lang/{locales}/{module}.ts", prefix = "{bu}.{module}." },
				},
			})

			-- Suggested keymaps
			vim.keymap.set("n", "<leader>if", require("i18n").show_i18n_keys_with_fzf, { desc = "i18n: fuzzy find key" })
			vim.keymap.set("n", "<leader>in", "<cmd>I18nNextLocale<CR>", { desc = "i18n: next locale" })
			vim.keymap.set("n", "<leader>io", "<cmd>I18nToggleOrigin<CR>", { desc = "i18n: show key/translation" })
		end,
	},
}

-- .i18nrc.lua file for project root to not hardcode paths here
--return {
--  locales = { "en", "zh" },
--  sources = {
--    "src/locales/{locales}.json",
--  },
--}
