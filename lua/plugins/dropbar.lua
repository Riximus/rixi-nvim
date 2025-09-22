return {
	'Bekaboo/dropbar.nvim',
	event = "LspAttach",
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
	},
	keys = {
		{ '<Leader>;', mode = 'n', function() require('dropbar.api').pick() end, desc = 'Pick symbols in winbar' },
		--{ '[;', desc = 'Go to start of current context' },
		--{ '];', desc = 'Select next context' },
	}
}
