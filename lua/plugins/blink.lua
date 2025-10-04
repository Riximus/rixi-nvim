return {
	"saghen/blink.cmp",
	version = "1.*", -- use a tagged release
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"rafamadriz/friendly-snippets",
		"giuxtaposition/blink-cmp-copilot",
		"onsails/lspkind.nvim",
	},
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = {
				"snippet_forward",
				function()
					return require("sidekick").nes_jump_or_apply()
				end, -- jump/apply NES if present
				"accept", -- otherwise accept completion
				--	function()
				--		return vim.lsp.inline_completion.get()
				--	end, -- native inline completion (optional)
				"fallback",
			},
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
		},

		snippets = { preset = "luasnip" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			ghost_text = { enabled = true },
			list = { selection = { preselect = true, auto_insert = true } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
			},
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								-- Copilot: force a recognizable icon
								if ctx.source_name == "copilot" then
									return "" .. ctx.icon_gap -- pick your preferred glyph "", " ", ""
								end

								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
				direction_priority = function()
					local ctx = require("blink.cmp").get_context()
					local item = require("blink.cmp").get_selected_item()
					if ctx == nil or item == nil then
						return { "s", "n" }
					end

					local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
					local is_multi_line = item_text:find("\n") ~= nil

					-- after showing the menu upwards, we want to maintain that direction
					-- until we re-open the menu, so store the context id in a global variable
					if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
						vim.g.blink_cmp_upwards_ctx_id = ctx.id
						return { "n", "s" }
					end
					return { "s", "n" }
				end,
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"copilot", --[["i18n"]]
			},
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
				lsp = { fallbacks = {} },
				--[[i18n = {
					name = "i18n",
					module = "i18n.integration.blink_source",
					opts = {
						-- future options can be placed here
					},
				},]]
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = {
			enabled = true,
		},
	},
	opts_extend = { "sources.default" },
}
