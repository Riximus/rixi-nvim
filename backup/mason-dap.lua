return {
	"jay-babu/mason-nvim-dap.nvim",
	--event = "VeryLazy",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	opts = function()
		local dbg = require("config.debuggers")
		return {
			ensure_installed = dbg.ensure_installed,
			automatic_installation = true,
		}
	end,
}
