-- lazy.nvim
return {
	"folke/snacks.nvim",
	priority = 1000, -- load before most plugins
	lazy = false,   -- load during startup
	---@type snacks.Config
	--	enabled = false,

	keys = {
		{ "<leader>GB", function() Snacks.gitbrowse() end,        desc = "Git Browse" },
		{ "<leader>gb", function() Snacks.git.blame_line() end,   desc = "Git Blame" },
		{ "<leader>.",  function() Snacks.scratch() end,          desc = "Toggle Scratch Buffer" },
		{ "<leader>.s", function() Snacks.scratch.select() end,   desc = "Select Scratch Buffer" },
		{ "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Git Log" },
		{ "<leader>gL", function() Snacks.lazygit.log_file() end, desc = "Git Log Current File" },

	},
	opts = {
		--indent = {
		--	enabled = true,
		--	animate = { enabled = false },
		--},
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		rename = { enabled = true }, -- Enhanced LSP rename
		git = { enabled = true },
		gitbrowse = { enabled = true },
		input = { enabled = true }, -- Better input dialogs
		scratch = { enabled = true }, -- Create scratch buffers
		lazygit = { enabled = true }, -- LazyGit integration (you have neogit)

		-- Disabled plugins
		words = { enabled = false },
		animate = { enabled = false }, -- Smooth animations for various UI elements
		dim = { enabled = false },     -- Dim inactive code/windows
		zen = { enabled = false },     -- Distraction-free coding mode
		profiler = { enabled = false }, -- Performance profiling
		debug = { enabled = false },   -- Debug utilities
		picker = { enabled = false },  -- File picker (you have telescope)
		win = { enabled = false },     -- Window utilities
		scope = { enabled = false },   -- Scope-based buffer management
		bufremove = { enabled = false }, -- Buffer removal utilities
		util = { enabled = false },    -- General utilities
		health = { enabled = false },  -- Health check utilities
		styles = { enabled = false },  -- Window styling
		bufdelete = { enabled = false }, -- Smart buffer deletion
		toggle = { enabled = false },  -- Toggle various options
		terminal = { enabled = false },
		dashboard = { enabled = false },
		scroll = { enabled = false }, -- Smooth scrolling
		notifier = { enabled = false },
	}
}
