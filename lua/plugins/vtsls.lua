return {
	"yioneko/nvim-vtsls",
	event = "VeryLazy",
	config = function()
		-- Let vim.lsp.enable('vtsls') work
		require("lspconfig.configs").vtsls = require("vtsls").lspconfig

		-- Default config used when vim.lsp.enable({'vtsls'}) is called
		local util = require("lspconfig.util")

		-- Pass the Vue TS plugin to vtsls so it handles .vue files.
		-- NOTE: If @vue/typescript-plugin is installed in your project (recommended),
		-- Node will resolve it from node_modules. The "location" field must still be set,
		-- so we set/override it per-root in on_new_config.
		local vtsls_config = {
			filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
			single_file_support = false,
			init_options = {
				plugins = {
					{ name = "@vue/typescript-plugin", languages = { "vue" }, location = "" },
				},
			},
			settings = {
				typescript = {
					inlayHints = {
						parameterNames = { enabled = "all" },
						parameterTypes = { enabled = true },
					},
				},
			},
			on_new_config = function(new_config, root_dir)
				-- If the plugin exists locally, point to it; otherwise leave as a non-empty string.
				local local_plugin = util.path.join(root_dir, "node_modules", "@vue", "typescript-plugin")
				if vim.uv.fs_stat(local_plugin) then
					for _, p in ipairs(new_config.init_options.plugins or {}) do
						if p.name == "@vue/typescript-plugin" then
							p.location = local_plugin
						end
					end
				else
					-- Fallback: still provide a non-empty location to satisfy the protocol
					for _, p in ipairs(new_config.init_options.plugins or {}) do
						if p.name == "@vue/typescript-plugin" and (not p.location or p.location == "") then
							p.location = root_dir
						end
					end
				end
			end,
		}

		-- Neovim 0.11 style registration so your init.lua call to vim.lsp.enable() picks this up
		if vim.lsp and vim.lsp.config then
			vim.lsp.config("vtsls", vtsls_config)
		end
	end,
}
