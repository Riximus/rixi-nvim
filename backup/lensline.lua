return {
	"oribarilan/lensline.nvim",
	branch = "release/1.x", -- or: tag = '1.1.2'
	event = "LspAttach",
	config = function()
		require("lensline").setup()
	end,
}
