return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			--"~/projects/*",
			"~/.config/*",
			"D:/Rixi/Desktop/Coding/*",
		},
		picker = {
			type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
		}
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- optional picker
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		--{ "ibhagwan/fzf-lua" },
		--{ "folke/snacks.nvim" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
	keys = {
		{ "<leader>fp", function() vim.cmd("Telescope neovim-project discover") end, desc = "Find Projects" },
	},
	config = function(_, opts)
		-- Commented this out because switched from nvim-tree to neo-tree
		require("neovim-project").setup(opts)
		---- Auto-refresh nvim-tree when project changes
		--vim.api.nvim_create_autocmd("DirChanged", {
		--	callback = function()
		--		if vim.fn.exists(":NvimTreeRefresh") == 2 then
		--			vim.cmd("NvimTreeRefresh")
		--		end
		--	end,
		--})
	end,
}
