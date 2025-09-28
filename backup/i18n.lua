return {
	"yelog/i18n.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"nvim-treesitter/nvim-treesitter",
		"saghen/blink.cmp",
	},
	cmd = { "I18nNextLocale", "I18nToggleOrigin", "I18nReload", "I18nEdit" },
	keys = {
		{ "<leader>if", function() require("i18n").show_i18n_keys_with_fzf() end, desc = "i18n: fuzzy find" },
		{ "<leader>in", "<cmd>I18nNextLocale<CR>",                                desc = "i18n: next locale" },
		{ "<leader>io", "<cmd>I18nToggleOrigin<CR>",                              desc = "i18n: key/translation" },
	},
	main = "i18n",
	opts = {
		locales = { "en", "de" },
		sources = { "src/locale/{locales}.json" },
	},
}


-- .i18nrc.lua file for project root to not hardcode paths here
--return {
--  locales = { "en", "zh" },
--  sources = {
--    "src/locales/{locales}.json",
--  },
--}
