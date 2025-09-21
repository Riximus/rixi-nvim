-- lspconfig server names (not Mason package names)
return {
	-- web
	"html", "cssls", "jsonls", "tailwindcss", "vtsls", --"ts_ls",
	-- go / python / c / rust / lua / kotlin / c# / zig
	"gopls", "basedpyright", "ruff", "clangd", "rust_analyzer", "lua_ls", "omnisharp", "omnisharp_mono", "zls",
	-- js frameworks
	-- React is already covered by vtsls (TSX/JSX)
	-- vue / angular / astro / svelte / laravel
	-- INFO: Angular: npm i -D @angular/language-service@^[version]
	"vue_ls", "angularls", "astro", "svelte", "laravel_ls",
	-- shells
	-- powershell
	"powershell_es",
}
