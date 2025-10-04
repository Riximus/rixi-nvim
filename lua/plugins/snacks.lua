-- lazy.nvim
return {
	"folke/snacks.nvim",
	priority = 1000, -- load before most plugins
	lazy = false, -- load during startup
	---@type snacks.Config
	--	enabled = false,

	keys = {
		-- == Snacks Picker Keymaps == --
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart picker (files+buffers+frecency)",
		},
		-- WARN: Remove this or telescope live greap keymap
		--	{
		--		"<leader>/",
		--		function()
		--			Snacks.picker.grep({ live = true })
		--		end,
		--		desc = "Grep (live; supports rg flags)",
		--	},
		{
			"<leader>fo",
			function()
				Snacks.picker.recent({ filter = { cwd = true } })
			end,
			desc = "Recent (cwd)",
		},
		-- WARN: This keymap or the projects.nvim keymap
		--{
		--	"<leader>fP",
		--	function()
		--		Snacks.picker.projects()
		--	end,
		--	desc = "Projects (frecency)",
		--},

		-- Buffers / lines
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "Lines in current buffer",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep open buffers",
		},

		-- == Gitbrowse and Git Keymaps == --
		{
			"<leader>GB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame",
		},
		-- Everyday helpers
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command history",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo history",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics (workspace)",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Diagnostics (buffer)",
		},

		-- Git
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git log (repo)",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git log (current file)",
		},
		{
			"<leader>g.",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git log (current line)",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git status",
		},
		{
			"<leader>gT",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git stashes",
		},
		{
			"<leader>gD",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git diff (hunks)",
		},
		-- == Scratch Buffer Keymaps == --
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>.s",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},

		-- == Snacks Todo Comments Picker Keymaps == --
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>fT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},

		-- == LazyGit Keymaps == --
		--	{
		--		"<leader>gl",
		--		function()
		--			Snacks.lazygit.log()
		--		end,
		--		desc = "Git Log",
		--	},
		--{
		--	"<leader>gl",
		--	function()
		--		Snacks.picker.git_log()
		--	end,
		--	desc = "Git Log",
		--},
		--{
		--	"<leader>gL",
		--	function()
		--		Snacks.lazygit.log_file()
		--	end,
		--	desc = "Git Log Current File",
		--},
		{
			"<leader>L",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Open LazyGit",
		},
	},
	opts = {
		picker = {
			enabled = true,
			-- scoring: lean on Snacks' frecency/history/cwd/filename bonuses
			matcher = {
				frecency = true,
				filename_bonus = true,
				cwd_bonus = true,
				history_bonus = true, -- uses the history bonus from recent releases
			},
			win = {
				input = {
					keys = {
						["<c-s>"] = { "edit_split", mode = { "i", "n" } }, -- open selection in split
						["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } }, -- open selection in vsplit
						["<a-r>"] = { "toggle_root", mode = { "i", "n" } }, -- toggle cwd ↔ git root (see action below)
					},
				},
			},
			actions = {
				-- Toggle between current cwd and the repo root; re-run the search
				toggle_root = function(p)
					local root = (vim.fn.systemlist("git rev-parse --show-toplevel")[1] or "")
					if root == "" then
						return
					end
					local cwd = (vim.uv or vim.loop).cwd() or "."
					local new = (p:cwd() == vim.fs.normalize(root)) and cwd or root
					p:set_cwd(new)
					p:find()
				end,
			},
		},

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
		bufdelete = { enabled = true }, -- Smart buffer deletion

		-- Disabled plugins
		words = { enabled = false },
		animate = { enabled = false }, -- Smooth animations for various UI elements
		dim = { enabled = false }, -- Dim inactive code/windows
		zen = { enabled = false }, -- Distraction-free coding mode
		profiler = { enabled = false }, -- Performance profiling
		debug = { enabled = false }, -- Debug utilities
		win = { enabled = false }, -- Window utilities
		scope = { enabled = false }, -- Scope-based buffer management
		util = { enabled = false }, -- General utilities
		health = { enabled = false }, -- Health check utilities
		styles = { enabled = false }, -- Window styling
		toggle = { enabled = false }, -- Toggle various options
		terminal = { enabled = false },
		dashboard = { enabled = false },
		scroll = { enabled = false }, -- Smooth scrolling
		notifier = { enabled = false },
	},
}
