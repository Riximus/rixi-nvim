return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		auto_hide = 1,
		-- Sidebar filetypes that shouldn't trigger barbar
		sidebar_filetypes = {
			NvimTree = true,
			['neo-tree'] = { event = 'BufWinLeave' },
			undotree = { text = 'undotree' },
			Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
		},
	},
	version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
