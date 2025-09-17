return {
	"saghen/blink.cmp",
	version = "1.*", -- use a tagged release
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
		},

		snippets = { preset = "luasnip" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			list = { selection = { preselect = false, auto_insert = true } },
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 50,
			},
			menu = {
				draw = {
					components = {
						-- customize the drawing of kind icons
						kind_icon = {
							text = function(ctx)
								-- default kind icon
								local icon = ctx.kind_icon
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
										{ kind = ctx.kind })
									if color_item and color_item.abbr ~= "" then
										icon = color_item.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								-- default highlight group
								local highlight = "BlinkCmpKind" .. ctx.kind
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
										{ kind = ctx.kind })
									if color_item and color_item.abbr_hl_group then
										highlight = color_item.abbr_hl_group
									end
								end
								return highlight
							end,
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot", "i18n" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
				lsp = { fallbacks = {} },
				i18n = {
					name = 'i18n',
					module = 'i18n.integration.blink_source',
					opts = {
						-- future options can be placed here
					},
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = {
			enabled = true,
		},
	},
	opts_extend = { "sources.default" },
}
