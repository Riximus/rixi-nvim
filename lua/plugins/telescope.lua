return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	 keys = {
		 { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
		 { "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "Git files" },
		 { "<leader>fg", function() require("telescope.builtin").live_grep()  end, desc = "Live grep" },
		 { "<leader>fb", function() require("telescope.builtin").buffers()    end, desc = "Buffers" },
		 -- Recent files (from shada) and open buffers
		 { "<leader>fr", function() require("telescope.builtin").oldfiles({ cwd_only = true }) end, desc = "Recent files (cwd)" },
		 { "<leader><space>", function() require("telescope.builtin").buffers() end, desc = "Switch buffer" },
    }
}
