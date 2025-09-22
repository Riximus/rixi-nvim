-- fidget.lua  :contentReference[oaicite:3]{index=3}
return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	opts = {
		notification = { override_vim_notify = false },
		-- progress = { suppress_on_insert = true },
	},
}
