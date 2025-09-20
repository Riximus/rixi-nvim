return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff",      function() require("telescope.builtin").find_files() end,                  desc = "Find files" },
		{ "<leader>gf",      function() require("telescope.builtin").git_files() end,                   desc = "Git files" },
		{ "<leader>gB",      function() require("telescope.builtin").git_bcommits() end,                desc = "Buffer's git commits" },
		{ "<leader>gs",      function() require("telescope.builtin").git_stash() end,                   desc = "Git stash list" },
		{ "<leader>fG",      function() require("telescope.builtin").live_grep() end,                   desc = "Live grep" },
		{ "<leader>fg",      function() require("telescope.builtin").grep_string() end,                 desc = "Search string under cursor" },
		{ "<leader>fb",      function() require("telescope.builtin").buffers() end,                     desc = "Buffers" },
		{ "<leader>fm",      function() require("telescope.builtin").marks() end,                       desc = "Marks" },
		{ "<leader>fc",      function() require("telescope.builtin").current_buffer_fuzzy_find() end,   desc = "Fuzzy search current open buffer" },
		-- Recent files (from shada) and open buffers
		{ "<leader>fr",      function() require("telescope.builtin").oldfiles({ cwd_only = true }) end, desc = "Recent files (cwd)" },
		{ "<leader><space>", function() require("telescope.builtin").buffers() end,                     desc = "Switch buffer" },
	}
}
