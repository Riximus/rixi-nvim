return {
	"y3owk1n/time-machine.nvim",
	version = "*", -- remove this if you want to use the `main` branch
	cmd = {
		"TimeMachineToggle",
		"TimeMachinePurgeBuffer",
		"TimeMachinePurgeAll",
		"TimeMachineLogShow",
		"TimeMachineLogClear",
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>t",
			"",
			desc = "Time Machine",
		},
		{
			"<leader>tt",
			"<cmd>TimeMachineToggle<cr>",
			desc = "[Time Machine] Toggle Tree",
		},
	}
}
