local langs = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" }

return {
	ensure_installed = {
		"js-debug-adapter",
		-- "firefox-debug-adapter", -- uncomment if you use Firefox
	},

	-- used to map VS Code-style launch.json types to languages
	vscode_types = {
		["pwa-node"]   = langs,
		["pwa-chrome"] = langs,
		["node"]       = langs, -- legacy launch.jsons
		["chrome"]     = langs, -- legacy launch.jsons
	},

	-- common dev server URLs you can tweak per project
	web = {
		vite    = "http://localhost:5173",
		angular = "http://localhost:4200",
		tauri   = "http://localhost:1420",
	},
}
