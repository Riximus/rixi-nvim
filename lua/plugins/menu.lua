return {
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/menu",
		lazy = true,
		dependencies = { "nvzone/volt" },
		keys = {
			-- right-click context menu (also works in NvimTree)
			{
				"<RightMouse>",
				function()
					-- close any old menu windows
					require("menu.utils").delete_old_menus()

					-- pass the actual click to nvim so the cursor moves there
					vim.cmd.exec('"normal! \\<RightMouse>"')

					-- figure out clicked buffer & choose a menu
					local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
					local options = (vim.bo[buf].ft == "NvimTree") and "nvimtree" or "default"

					-- open with mouse support
					require("menu").open(options, { mouse = true })
				end,
				desc = "Menu: context (mouse)",
				mode = { "n", "v" },
			},
		},
	},
}
