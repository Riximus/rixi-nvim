return {
	"WilliamHsieh/overlook.nvim",
	opts = {},

	-- Optional: set up common keybindings
	keys = {
		{ "<leader>pd", function() require("overlook.api").peek_definition() end, desc = "Overlook: Peek definition" },
		{ "<leader>pc", function() require("overlook.api").close_all() end,       desc = "Overlook: Close all popups" },
		{ "<leader>pu", function() require("overlook.api").restore_popup() end,   desc = "Overlook: Restore last popup" },
		{ "<leader>pf", function() require("overlook.api").switch_focus() end,    desc = "Overlook: Switch focus" },
		{ "<leader>ps", function() require("overlook.api").open_in_split() end,   desc = "Overlook: Open popup in split" },
		{ "<leader>pv", function() require("overlook.api").open_in_vsplit() end,  desc = "Overlook: Open popup in vsplit" },
	},
}
