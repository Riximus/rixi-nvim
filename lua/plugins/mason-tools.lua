-- mason-tools.lua
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	event = "VeryLazy",
	cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean", "MasonToolsInstallSync" },
	dependencies = { "mason-org/mason.nvim" }, -- mason is cmd-loaded too
	opts = {
		ensure_installed = require("config.tools"),
		run_on_start = true,
		auto_update = false,
		start_delay = 3000,
	},
}
