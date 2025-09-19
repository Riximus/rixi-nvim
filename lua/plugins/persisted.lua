return {
	"olimorris/persisted.nvim",
	event = "BufReadPre",
	opts = {
		autoload = true,
		on_autoload_no_session = function()
			vim.notify("No existing session to load.")
		end,
		use_git_branch = true,
		autosave = true,
		autostart = true,
	},
	keys = {
		-- Telescope picker
		{ "<leader>sp", "<cmd>Telescope persisted<CR>",               desc = "Pick session" },
		-- Load/save/delete
		{ "<leader>sl", function() require("persisted").load() end,   desc = "Load session" },
		{ "<leader>ss", function() require("persisted").save() end,   desc = "Save session" },
		{ "<leader>sd", function() require("persisted").delete() end, desc = "Delete session" },
	},
	config = function(_, opts)
		require("persisted").setup(opts)

		-- Notify whenever a session is saved (manual or autosave during the session)
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedSavePost",
			callback = function()
				vim.notify("Session saved ✔", vim.log.levels.INFO, { title = "Persisted" })
			end,
		})

		pcall(function() require("telescope").load_extension("persisted") end)
	end,
}
