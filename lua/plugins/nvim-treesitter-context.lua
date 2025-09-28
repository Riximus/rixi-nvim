return {
	{ -- make sure treesitter itself is there
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" }, -- lazy-load on files
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			-- all of these are optional; shown here with their defaults
			enable = true, -- can toggle later with :TSContext
			multiwindow = false, -- show context per window
			max_lines = 0, -- 0 = no limit for context height
			min_window_height = 0, -- 0 = no minimum
			line_numbers = true, -- show line numbers in the context window
			multiline_threshold = 20,
			trim_scope = "outer", -- 'inner' | 'outer'
			mode = "cursor", -- 'cursor' | 'topline'
			separator = nil, -- e.g. "-" to draw a rule below the context
			zindex = 20,
			on_attach = nil, -- function(bufnr) return false to disable
		},
		keys = {
			-- jump to the nearest context line above
			--[[{
				"[c",
				function() require("treesitter-context").go_to_context(vim.v.count1) end,
				desc = "TS Context: go to parent"
			},]]
			-- quick toggle
			{ "<leader>uC", "<cmd>TSContext toggle<cr>", desc = "Toggle Treesitter Context" },
		},
	},
}
