return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
			"jay-babu/mason-nvim-dap.nvim",
			-- optional: use VS Code launch.json with comments (json5)
			{ "Joakker/lua-json5",                 build = "./install.sh", optional = true },
			-- optional: Telescope pickers for DAP
			{ "nvim-telescope/telescope-dap.nvim", optional = true },
		},
		config = function()
			local dbg = require("config.debuggers")
			local dap = require("dap")
			local dapui = require("dapui")

			-- UI
			dapui.setup({
				controls = { enabled = true, element = "repl" },
				layouts = {
					{ elements = { "scopes", "breakpoints", "stacks", "watches" }, size = 40, position = "left" },
					{ elements = { "repl", "console" },                            size = 10, position = "bottom" },
				},
			})
			require("nvim-dap-virtual-text").setup({})
			dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
			dap.listeners.before.event_exited["dapui"]     = function() dapui.close() end

			-- Signs
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
			vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })

			-- Keymaps (move to your keymaps file if you prefer)
			local map = vim.keymap.set
			map("n", "<F5>", dap.continue, { desc = "DAP Continue" })
			map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
			map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
			map("n", "<S-F11>", dap.step_out, { desc = "DAP Step Out" })
			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
			map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
				{ desc = "DAP Conditional Breakpoint" })
			map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
			map("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
			map("n", "<leader>du", dapui.toggle, { desc = "DAP UI Toggle" })
			pcall(function() require("telescope").load_extension("dap") end)

			-- Hook up vscode-js-debug (installed by Mason as js-debug-adapter)
			local mason = vim.fn.stdpath("data") .. "/mason"
			require("dap-vscode-js").setup({
				debugger_path = mason .. "/packages/js-debug-adapter",
				adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" },
			})

			-- Language configs (Node + Browser)
			local web = dbg.web
			local langs = dbg.vscode_types["pwa-node"]
			for _, lang in ipairs(langs) do
				dap.configurations[lang] = {
					-- Node: run current file
					{
						type = "pwa-node",
						request = "launch",
						name = "Node: Current File",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node",
						sourceMaps = true,
						resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
					},
					-- Node: attach to running process (pick from list)
					{
						type = "pwa-node",
						request = "attach",
						name = "Node: Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					-- Browser: Vite dev server
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Chrome: Vite",
						url = web.vite,
						webRoot = "${workspaceFolder}",
					},
					-- Browser: Angular dev server
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Chrome: Angular",
						url = web.angular,
						webRoot = "${workspaceFolder}",
					},
				}
			end

			-- Reuse .vscode/launch.json if present (with JSON5 comments)
			local ok_json5, json5 = pcall(require, "json5")
			if ok_json5 then
				require("dap.ext.vscode").json_decode = json5.parse
			end
			local launchjs = vim.fn.getcwd() .. "/.vscode/launch.json"
			if vim.uv.fs_stat(launchjs) then
				require("dap.ext.vscode").load_launchjs(launchjs, dbg.vscode_types)
			end
		end,
	},
}
