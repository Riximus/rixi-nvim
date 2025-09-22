return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>tn", function() require("neotest").run.run() end,                     desc = "Test nearest" },
		{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Test file" },
		{ "<leader>ts", function() require("neotest").summary.toggle() end,              desc = "Test summary" },
		{ "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
	},
	main = "neotest",
	opts = function()
		return {
			-- adapters = { require("neotest-jest")({}), require("neotest-go")({}) },
		}
	end,
}
