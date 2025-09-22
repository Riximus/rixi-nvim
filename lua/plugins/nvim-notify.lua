return {
	"rcarriga/nvim-notify",
	init = function()
		local lazy = require("lazy")
		vim.notify = function(...)
			lazy.load({ plugins = { "nvim-notify" } })
			return require("notify")(...)
		end
	end,
	opts = {
		stages = "fade_in_slide_out",
		render = "compact",
	},
}
