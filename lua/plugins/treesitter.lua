return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			-- Neovim / basics
			"lua",
			"vim",
			"vimdoc",
			-- shells / docs / config
			"bash",
			"markdown",
			"markdown_inline",
			"yaml",
			"toml",
			-- web / frameworks
			"html",
			"css",
			"scss",
			"javascript",
			"typescript",
			"tsx",
			"vue",
			"svelte",
			"astro",
			-- backend / systems
			"go",
			"gomod",
			"gowork",
			"gosum",
			"python",
			"c",
			"cpp",
			"c_sharp",
			"rust",
			-- infra / data
			"dockerfile",
			"graphql",
			"json",
			"json5",
			"jsonc",
			-- optional if you added PHP / PowerShell
			"php",
			"powershell",
		},
		auto_install = true, -- install missing parsers on first use
		sync_install = false, -- async is fine
		highlight = {
			enable = true,
			-- Disable for very large files to avoid jank
			disable = function(_, buf)
				local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
				return ok and stats and stats.size > 256 * 1024 -- >256KB
			end,
		},
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			-- Disable for very large files to avoid jank
			disable = function(_, buf)
				local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
				return ok and stats and stats.size > 256 * 1024 -- >256KB
			end,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
