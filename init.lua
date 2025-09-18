require("config.lazy")
require("config.keymaps")

-- Plugins
require('overseer').setup()
require('mini.pairs').setup()
require('mini.move').setup()
require('mini.cursorword').setup()

vim.diagnostic.config({
	--virtual_lines = true, -- swap with virtual text if lines are preferred
	--virtual_text = { current_line = true },
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

-- === LSP per-buffer keymaps & inlay-hint toggle ===
local function toggle_inlay(buf)
	if vim.lsp.inlay_hint then
		local enabled = vim.lsp.inlay_hint.is_enabled(buf)
		vim.lsp.inlay_hint.enable(buf, not enabled)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("MyLspKeys", { clear = true }),
	callback = function(args)
		local buf = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		-- Signature help (only if the server supports it)
		if client.server_capabilities and client.server_capabilities.signatureHelpProvider then
			vim.keymap.set({ "i", "n" }, "<C-s>", vim.lsp.buf.signature_help,
				{ buffer = buf, desc = "LSP: Signature help" })
		end

		-- enable inlay hints by default if supported
		if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = buf })
		end

		-- Inlay hints toggle
		vim.keymap.set("n", "<leader>uh", function()
			local ih = vim.lsp.inlay_hint
			ih.enable(not ih.is_enabled({ bufnr = buf }), { bufnr = buf })
		end, { buffer = buf, desc = "LSP: Toggle inlay hints" })
	end,
})



-- Minimal format-on-save (safe default; remove if you prefer manual formatting)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
--   callback = function(ev) vim.lsp.buf.format({ bufnr = ev.buf, async = false }) end,
-- })
