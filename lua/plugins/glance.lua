return {
	'dnlhc/glance.nvim',
	cmd = 'Glance',
	lazy = true,
	keys = {
		{ "gD", "<cmd>Glance definitions<cr>",      desc = "Glance Definitions" },
		{ "gR", "<cmd>Glance references<cr>",       desc = "Glance References" },
		{ "gY", "<cmd>Glance type_definitions<cr>", desc = "Glance Type Definitions" },
		{ "gM", "<cmd>Glance implementations<cr>",  desc = "Glance Implementations" },
	}
}
