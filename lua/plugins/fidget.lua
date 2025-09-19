return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			override_vim_notify = true,
		}
		--notification = {
		--	override_vim_notify = false, -- keep nvim-notify as the main backend
		--	redirect = function(msg, level, opts)
		--		return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
		--	end,
		--},
		--progress = { suppress_on_insert = true },
	},
}
