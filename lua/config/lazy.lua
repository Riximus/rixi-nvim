-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.signcolumn = "yes"
vim.o.completeopt = "menu,menuone,fuzzy,preview"
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.splitkeep = "cursor"
vim.o.scrolloff = 10
vim.o.ignorecase = true -- Not case sensitive searching
vim.o.smartcase = true  -- Case sensitive if expression has uppercase
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.nvim/undodir")
vim.o.updatetime = 300
vim.o.autoread = true
vim.o.errorbells = false
vim.o.hidden = true                     -- Allow hidden buffers
vim.o.backspace = "indent,eol,start"
vim.o.autochdir = false                 -- Don't auto change directory
vim.opt.iskeyword:append("-")           -- Treat dash as part of word
vim.opt.path:append("**")               -- Include subdirectories in search
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.o.modifiable = true                 -- Allow buffer midifications

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.api.nvim_set_hl(0, "LspInlayHint", { italic = true })

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})
