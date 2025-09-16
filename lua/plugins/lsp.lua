return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
  -- No config function needed in 0.11; we just need lspconfig present
  -- so it registers server configs that `vim.lsp.enable()` can use.
}
