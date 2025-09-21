return {
	'stevearc/overseer.nvim',
	cmd = {
		"OverseerOpen", "OverseerClose", "OverseerToggle",
		"OverseerSaveBundle", "OverseerLoadBundle", "OverseerDeleteBundle",
		"OverseerRunCmd", "OverseerRun", "OverseerInfo",
		"OverseerBuild", "OverseerQuickAction", "OverseerTaskAction",
		"OverseerClearCache",
	},
	keys = {
		{ "<leader>ot", "<cmd>OverseerToggle<cr>",      desc = "Overseer: Task list" },
		{ "<leader>or", "<cmd>OverseerRun<cr>",         desc = "Overseer: Run task" },
		{ "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Overseer: Action recent task" },
		{
			"<leader>oR",
			function()
				local overseer = require("overseer")
				local tasks = overseer.list_tasks({ recent_first = true })
				if #tasks > 0 then
					overseer.run_action(tasks[1], "restart")
				else
					vim.notify("No tasks found", vim.log.levels.WARN)
				end
			end,
			desc = "Overseer: Restart last task",
		},
	},
	opts = {
		dap = false,
		templates = { "builtin", "vscode", "user" },
	},
}
