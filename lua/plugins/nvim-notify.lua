return {
	'rcarriga/nvim-notify',
	config = function()
		-- Set nvim-notify as the default notification handler
		vim.notify = require("notify")

		-- Optional: Configure nvim-notify settings
		require("notify").setup({
			-- Animation style
			stages = "fade_in_slide_out",
		})
	end
}
