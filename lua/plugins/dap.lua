local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
	"svelte",
}

return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		-- Nice UI for the debugger
		"rcarriga/nvim-dap-ui",
		-- Required for nvim-dap-ui
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		-- Installer for debug adapters
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Picker
		"nvim-telescope/telescope-dap.nvim",

		-- Add debuggers here
		"mxsdev/nvim-dap-vscode-js",

		-- lazy spec to build "microsoft/vscode-js-debug" from source
		--	{
		--		"microsoft/vscode-js-debug",
		--		version = "1.x",
		--		build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
		--	}
	},
	keys = {
		{
			"<F5>",
			function()
				require('dap').continue()
			end,
			desc = 'Debug: Start/Continue',
		},
		{
			"<F1>",
			function()
				require('dap').step_into()
			end,
			desc = 'Debug: Step Into',
		},
		{
			"<F2>",
			function()
				require('dap').step_over()
			end,
			desc = 'Debug: Step Over',
		},
		{
			"<F3>",
			function()
				require('dap').step_out()
			end,
			desc = 'Debug: Step Out',
		},
		{
			"<leader>Db",
			function()
				require('dap').toggle_breakpoint()
			end,
			desc = 'Debug: Toggle Breakpoint',
		},
		{
			"<leader>DB",
			function()
				require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
			end,
			desc = 'Debug: Set Breakpoint',
		},
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{
			"<leader>Du",
			function()
				require('dapui').toggle()
			end,
			desc = 'Debug: See last session result.',
		},
		vim.keymap.set('n', '<leader>DC',
			function() require('telescope').extensions.dap.configurations {} end,
			{ desc = 'DAP: choose configuration' })
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'

		-- Hook Overseer into nvim-dap so preLaunchTask/postDebugTask work
		require('overseer').patch_dap()

		require("mason-nvim-dap").setup {
			automatic_installation = true,
			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"js-debug-adapter",
			},
		}

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup {
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
			controls = {
				icons = {
					pause = '⏸',
					play = '▶',
					step_into = '⏎',
					step_over = '⏭',
					step_out = '⏮',
					step_back = 'b',
					run_last = '▶▶',
					terminate = '⏹',
					disconnect = '⏏',
				},
			},
		}

		--Change breakpoint icons
		vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
		vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
		local breakpoint_icons = vim.g.have_nerd_font
				and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
				or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
		for type, icon in pairs(breakpoint_icons) do
			local tp = 'Dap' .. type
			local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end

		-- Automatically open/close DAP UI
		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		-- Setup virtual text to show variable values inline
		require("nvim-dap-virtual-text").setup()


		-- INFO: JAVASCRIPT DEBUGGER SETUP
		--
		-- Works on Windows *and* Linux (and macOS)
		--	local is_win = vim.fn.has("win32") == 1
		--	local join = function(...) return table.concat({ ... }, is_win and "\\" or "/") end
		--	local data = vim.fn.stdpath("data")
		--	local mason_bin = join(data, "mason", "bin")
		--	local exe = is_win and "js-debug-adapter.cmd" or "js-debug-adapter"
		--	local jsdbg = join(mason_bin, exe)
		--
		local is_win = vim.fn.has("win32") == 1
		local jsdbg_cmd = is_win
				and (vim.fn.stdpath("data") .. "\\mason\\bin\\js-debug-adapter.cmd")
				or (vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter")
		--
		local dbg_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

		require("dap-vscode-js").setup({
			-- Use Mason’s adapter binary
			debugger_cmd = { jsdbg_cmd },
			--debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			--debugger_path = dbg_path,
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})
		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				-- Node: run current file
				{
					type = 'pwa-node',
					request = 'launch',
					name = 'Launch file',
					program = '${file}',
					cwd = '${workspaceFolder}',
					sourceMaps = true,
					resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
				},
				-- Node: attach to process
				{
					type = 'pwa-node',
					request = 'attach',
					name = 'Attach',
					processId = require('dap.utils').pick_process,
					sourceMaps = true,
					resolveSourceMapLocations = { "${workspaceFolder}/**",
						"!**/node_modules/**" },
					cwd = "${workspaceFolder}/src",
					-- we don't want to debug code inside node_modules, so skip it!
					skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
				},
				{
					-- For this to work you need to make sure the following:
					-- 1. You have the extension "Debugger for Chrome" installed in your VSCode
					-- 2. You have a .vscode/launch.json with a configuration similar to this:
					-- {
					--   "version": "0.2.0",
					--   "configurations": [
					--     {
					--       "type": "chrome",
					--       "request": "launch",
					--       "name": "Launch Chrome against localhost",
					--       "url": "http://localhost:3000",
					--       "webRoot": "${workspaceFolder}"
					--     }
					--   ]
					-- }

					-- Browser: Vite dev server
					type = 'pwa-chrome',
					request = 'launch',
					name = 'Chrome: Vite',
					url = 'http://localhost:5173',
					webRoot = '${workspaceFolder}',
					-- skip files from vite's hmr
					skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
					protocol = 'inspector',
					-- 🚀 Overseer will run this before starting the debugger:
					preLaunchTask = "npm: dev",
				},
				{
					-- Browser: Vite dev server
					type = 'pwa-chrome',
					request = 'launch',
					name = 'Chrome: Angular',
					url = 'http://localhost:4200',
					webRoot = '${workspaceFolder}',
					-- skip files from vite's hmr
					skipFiles = { "**/node_modules/**/*" },
					protocol = 'inspector',
					preLaunchTask = "npm: start", -- or "npm: ng serve"
				},
				{
					-- Browser: Vite dev server
					type = 'pwa-chrome',
					request = 'launch',
					name = 'Chrome: Astro',
					url = 'http://localhost:4321',
					webRoot = '${workspaceFolder}',
					-- skip files from vite's hmr
					skipFiles = { "**/node_modules/**/*", },
					protocol = 'inspector',
					preLaunchTask = "npm: dev",
				},
			}
		end
		-- END JAVASCRIPT DEBUGGER SETUP
	end,
}
