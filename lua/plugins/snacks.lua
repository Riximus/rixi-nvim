-- lazy.nvim
return {
	"folke/snacks.nvim",
	priority = 1000, -- load before most plugins
	lazy = false, -- load during startup
	---@type snacks.Config
	--	enabled = false,
	opts = {
		--indent = {
		--	enabled = true,
		--	animate = { enabled = false },
		--},
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		--words = { enabled = true },


		-- Disabled plugins
		--	animate = { enabled = false }, -- Smooth animations for various UI elements
		--	dim = { enabled = false }, -- Dim inactive code/windows
		--	zen = { enabled = false }, -- Distraction-free coding mode
		--	scratch = { enabled = false }, -- Create scratch buffers
		--	profiler = { enabled = false }, -- Performance profiling
		--	debug = { enabled = false }, -- Debug utilities
		--	lazygit = { enabled = false }, -- LazyGit integration (you have neogit)
		--	picker = { enabled = false }, -- File picker (you have telescope)
		--	win = { enabled = false }, -- Window utilities
		scope = { enabled = false }, -- Scope-based buffer management
		--	bufremove = { enabled = false }, -- Buffer removal utilities
		--	util = { enabled = false }, -- General utilities
		--	health = { enabled = false }, -- Health check utilities
		--	styles = { enabled = false }, -- Window styling
		--	bufdelete = { enabled = false }, -- Smart buffer deletion
		--	toggle = { enabled = false }, -- Toggle various options
		--	git = { enabled = false },
		--	gitbrowse = { enabled = false },
		--	terminal = { enabled = false },
		--	dashboard = { enabled = false },
		--	scroll = { enabled = false }, -- Smooth scrolling
		--	input = { enabled = false }, -- Better input dialogs
		--	rename = { enabled = false }, -- Enhanced LSP rename
		--	notifier = { enabled = false },
	}
}
