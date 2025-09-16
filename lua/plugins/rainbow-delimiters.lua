return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy", -- or "BufReadPost" for faster loading on file open
	config = function()
		-- Basic setup - rainbow-delimiters works out of the box
		-- You can add custom configuration here if needed
		local rainbow_delimiters = require('rainbow-delimiters')

		-- Optional: Configure specific settings
		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
			},
			highlight = {
				'RainbowDelimiterRed',
				'RainbowDelimiterYellow',
				'RainbowDelimiterBlue',
				'RainbowDelimiterOrange',
				'RainbowDelimiterGreen',
				'RainbowDelimiterViolet',
				'RainbowDelimiterCyan',
			},
		}
	end,
}
