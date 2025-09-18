-- lspconfig server names (not Mason package names)
return {
	-- web
	"ts_ls", "html", "cssls", "jsonls", "tailwindcss", --"vtsls"
	-- go / python / c / rust / lua / kotlin / c# / zig
	"gopls", "basedpyright", "ruff", "clangd", "rust_analyzer", "lua_ls", "omnisharp", "omnisharp_mono", "zls",
	-- js frameworks
	-- React is already covered by vtsls (TSX/JSX)
	-- vue / angular / astro / svelte / laravel
	"vue_ls", "angularls", "astro", "svelte", "laravel_ls",
	-- shells
	-- powershell
	"powershell_es",
}
