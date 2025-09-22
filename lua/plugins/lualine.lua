return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	-- Let Lazy call: require("lualine").setup(opts)
	main = "lualine",

	-- Everything that used to be in config() is now here
	opts = function()
		-- Bubbles config for lualine
		-- Author: lokesh-krishna
		-- MIT license, see LICENSE for more details.

		-- stylua: ignore
		local colors = {
			blue   = '#80a0ff',
			cyan   = '#79dac8',
			black  = '#080808',
			white  = '#c6c6c6',
			red    = '#ff5189',
			violet = '#d183e8',
			grey   = '#303030',
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},

			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white },
			},
		}

		-- Show active local (a-z) marks in current buffer and global (A-Z) marks
		local function show_active_marks()
			local buf              = vim.api.nvim_get_current_buf()

			-- Safely fetch marks (Neovim 0.9+: :h getmarklist())
			local ok_loc, loc_list = pcall(vim.fn.getmarklist, buf)
			local ok_glo, glo_list = pcall(vim.fn.getmarklist)

			local locals, globals  = {}, {}

			local function collect(list, bucket, pat)
				if type(list) ~= "table" then return end
				for _, m in ipairs(list) do
					-- m.mark can look like "'a" or "a"; grab the letter
					local name = type(m.mark) == "string" and m.mark:match("[A-Za-z]") or nil
					if name and name:match(pat) then bucket[name] = true end
				end
			end

			if ok_loc then collect(loc_list, locals, "[a-z]") end
			if ok_glo then collect(glo_list, globals, "[A-Z]") end

			local function ordered(keys, alphabet)
				local out = {}
				for c in alphabet:gmatch(".") do
					if keys[c] then table.insert(out, c) end
				end
				return table.concat(out, " ")
			end

			local local_str  = ordered(locals, "abcdefghijklmnopqrstuvwxyz")
			local global_str = ordered(globals, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")

			if local_str == "" and global_str == "" then
				return "" -- keep it silent if no marks are set
			end

			local parts = {}
			if local_str ~= "" then table.insert(parts, " " .. local_str) end
			if global_str ~= "" then table.insert(parts, " " .. global_str) end
			return table.concat(parts, " ")
		end

		return {
			options = {
				theme = "auto",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				globalstatus = true, -- optional: single statusline for all windows (Neovim 0.7+)
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = {
					"searchcount",
					{
						"filename",
						symbols = { modified = " ", readonly = " " },
						path = 1,
					},
					"diagnostics",
				},
				lualine_c = {
					"%=", -- add your center components here
					--{ "buffers", separator = { left = " " } }
					{ show_active_marks, separator = { left = " " }, padding = 0 },
				},
				lualine_x = { { "lsp_status", separator = "" }, },
				lualine_y = { "overseer", "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {
				lualine_a = { { "branch", separator = { left = "" }, right_padding = 2 } },
				lualine_b = {
					{
						"diff",
						symbols = { added = '󰐕 ', modified = '󰏫 ', removed = '󰍴 ' },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
			--
			-- INFO: Using winbar will remove dropbar plugin :(
			--  winbar = {
			--    lualine_a = {},
			--    lualine_b = {},
			--    lualine_c = {},
			--    lualine_x = {},
			--    lualine_y = {},
			--    lualine_z = {}
			--  },
			extensions = {},
		}
	end,
}
