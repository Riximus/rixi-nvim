return {
	"olimorris/persisted.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>sp", "<cmd>Telescope persisted<CR>", desc = "Session picker" },
		{
			"<leader>sl",
			function()
				require("persisted").load()
			end,
			desc = "Session load",
		},
		{
			"<leader>ss",
			function()
				require("persisted").save()
			end,
			desc = "Session save",
		},
		{
			"<leader>sd",
			function()
				require("persisted").delete()
			end,
			desc = "Session delete",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedSavePost",
			callback = function()
				vim.notify("Session saved ✔", vim.log.levels.INFO, { title = "Persisted" })
			end,
		})
		-- Defer loading the Telescope extension until Telescope itself is used.
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopeLoaded",
			once = true,
			callback = function()
				pcall(function()
					require("telescope").load_extension("persisted")
				end)
			end,
		})
	end,
	main = "persisted",
	opts = {
		autoload = true,
		on_autoload_no_session = function()
			vim.notify("No existing session to load.")
		end,
		use_git_branch = true,
		autosave = true,
		autostart = true,
	},
}
