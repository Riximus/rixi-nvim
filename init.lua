require("config.lazy")
require("config.keymaps")

-- Plugins
require('overseer').setup()
require('mini.pairs').setup()
require('mini.move').setup()
require('mini.cursorword').setup()

vim.diagnostic.config({
	-- virtual_lines = true, -- swap with virtual text if lines are preferred
	virtual_text = { current_line = true },
	-- underline = true,
	float = { border = "rounded" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		}
	}
})

-- Enable LSP once, right before the first real file is read
do
	local enabled = false
	vim.api.nvim_create_autocmd("BufReadPre", {
		group = vim.api.nvim_create_augroup("LspEnableOnce", { clear = true }),
		callback = function()
			if enabled then return end
			enabled = true
			vim.lsp.enable(require("config.servers"))
		end,
	})
end

-- Minimal format-on-save (safe default; remove if you prefer manual formatting)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
--   callback = function(ev) vim.lsp.buf.format({ bufnr = ev.buf, async = false }) end,
-- })
