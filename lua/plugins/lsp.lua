return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	--config = function()
	--	-- after lspconfig is loaded, you can safely enable servers
	--	vim.lsp.enable(require("config.servers"))
	--end,
	-- No config function needed in 0.11; we just need lspconfig present
	-- so it registers server configs that `vim.lsp.enable()` can use.
}
