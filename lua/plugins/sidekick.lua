return {
	"folke/sidekick.nvim",
	event = "VeryLazy",
	opts = {}, -- tweak as you like
	keys = {
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick: Toggle CLI",
		},
		{
			"<leader>as",
			function()
				require("sidekick.cli").select({ filter = { installed = true } })
			end,
			desc = "Sidekick: Select CLI",
		},
		-- NOTE: CTRL + < (or I guess \) + n to be able to switch focus back to the terminal
		{
			"<c-.>",
			function()
				require("sidekick.cli").focus()
			end,
			mode = { "n", "x", "i", "t" },
			desc = "Sidekick Switch Focus",
		},
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "copilot", focus = true })
			end,
			desc = "Sidekick Toggle Copilot",
		},
		{
			"<leader>aC",
			function()
				require("sidekick.cli").toggle({ name = "codex", focus = true })
			end,
			desc = "Sidekick Toggle Codex",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
	},
}
