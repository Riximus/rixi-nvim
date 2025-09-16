return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		return {
			-- Best-practice: let Conform run on save, and fall back to LSP when no CLI is set
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},

			-- Which formatter(s) to run per filetype
			formatters_by_ft = {
				-- Lua
				lua             = { "stylua" },

				-- Python: try Ruff (fix + format) then Black if Ruff isn't available
				python          = { "ruff_fix", "ruff_format", "black" },

				-- Go
				go              = { "gofumpt" },

				-- Web stack: prefer Biome when present, else Prettier(d)
				javascript      = { "biome", "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
				typescript      = { "biome", "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
				vue             = { "prettierd", "prettier", stop_after_first = true },
				svelte          = { "prettierd", "prettier", stop_after_first = true },
				astro           = { "prettierd", "prettier", stop_after_first = true },
				html            = { "prettierd", "prettier", stop_after_first = true },
				css             = { "prettierd", "prettier", stop_after_first = true },
				scss            = { "prettierd", "prettier", stop_after_first = true },
				json            = { "biome", "prettierd", "prettier", stop_after_first = true },
				jsonc           = { "biome", "prettierd", "prettier", stop_after_first = true },
				yaml            = { "prettierd", "prettier", stop_after_first = true },
				graphql         = { "prettierd", "prettier", stop_after_first = true },

				-- Markdown (also format fenced code blocks)
				markdown        = { "prettierd", "prettier", "injected" },

				-- Shell
				sh              = { "shfmt", "beautysh" },
				bash            = { "shfmt", "beautysh" },
				zsh             = { "shfmt", "beautysh" },

				-- C/C++
				c               = { "clang-format" },
				cpp             = { "clang-format" },

				-- Rust
				rust            = { "rustfmt" },
			},

			-- Per-formatter tweaks
			formatters = {
				injected = { options = { ignore_errors = true } }, -- gentler in md code fences
				shfmt = { prepend_args = { "-i", "2", "-ci" } }, -- 2-space indent, indent case/esac
			},
		}
	end,
}
