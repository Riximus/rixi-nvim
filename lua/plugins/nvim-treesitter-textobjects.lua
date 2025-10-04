return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" }, -- loads alongside Treesitter
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			-- These are *text objects*, so use them after an operator (d/y/c/…)
			-- or in Visual mode. Examples:
			--   daf / yif / vac / vic / etc.
			-- Plain `a` or `i` in Normal mode still enter Insert (by design).
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- jump forward to the next textobject automatically
					--keymaps = {
					--	["af"] = "@function.outer", -- a function
					--	["if"] = "@function.inner", -- inner function
					--	["ac"] = "@class.outer", -- a class
					--	["ic"] = "@class.inner", -- inner class
					--},
				},
			},
		})

		-- OPTIONAL: Normal-mode “one-shot selects”
		-- If you want a Normal-mode key that *selects* the object for you,
		-- uncomment these wrappers (they just run v{a,i}{f,c} under the hood):
		-- vim.keymap.set("n", "gaf", function() vim.cmd.normal("vaf") end, { desc = "Select a function" })
		-- vim.keymap.set("n", "gif", function() vim.cmd.normal("vif") end, { desc = "Select inner function" })
		-- vim.keymap.set("n", "gac", function() vim.cmd.normal("vac") end, { desc = "Select a class" })
		-- vim.keymap.set("n", "gic", function() vim.cmd.normal("vic") end, { desc = "Select inner class" })
	end,
}
