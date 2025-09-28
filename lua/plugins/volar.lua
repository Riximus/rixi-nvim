return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		local lspconfig = require("lspconfig")

		-- VOLAR: template intelligence + TS inlay hints; hybrid mode OFF
		vim.lsp.config("vue_ls", {
			init_options = { vue = { hybridMode = false } },
			settings = {
				typescript = {
					inlayHints = {
						enumMemberValues = { enabled = false },
						functionLikeReturnTypes = { enabled = false },
						propertyDeclarationTypes = { enabled = false },
						parameterTypes = { enabled = true, suppressWhenArgumentMatchesName = false },
						variableTypes = { enabled = false },
					},
				},
			},
		})

		-- TS_LS: TypeScript server with Vue TS plugin, and full inlay hints
		--[[lspconfig.ts_ls.setup({
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						-- Prefer per-project install; this fallback lets Mason path work too
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
			settings = {
				typescript = {
					tsserver = { useSyntaxServer = false },
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		})]]
		--
	end,
}
