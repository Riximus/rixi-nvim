# Neovim Config

## Mode Explanations
- n = Normal mode (default mode, for navigation and commands)
- x = Visual mode (when you select text with v, V, or Ctrl+v)
- o = Operator-pending mode (after pressing operators like d, c, y)
- c = Command-line mode (when you press : to enter commands)

## Appearance & UI
- [Catppuccin](https://github.com/catppuccin/nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [lensline.nvim](https://github.com/oribarilan/lensline.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [indentmini.nvim](https://github.com/nvimdev/indentmini.nvim)
- [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)
- [menu](https://github.com/nvzone/menu) (uses [volt](https://github.com/nvzone/volt))
- [nvim-window](https://github.com/yorickpeterse/nvim-window)
- [minty](https://github.com/nvzone/minty)

## File Explorer & Managers
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [yazi.nvim](https://github.com/mikavilpas/yazi.nvim)

## Search, Fuzzy Find & Navigation
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim)
- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [numb.nvim](https://github.com/nacro90/numb.nvim)

## LSP, Diagnostics & Code Tools
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-vtsls](https://github.com/yioneko/nvim-vtsls)
- Tailwind CSS LSP (configured via lspconfig)
- [glance.nvim](https://github.com/dnlhc/glance.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [overseer.nvim](https://github.com/stevearc/overseer.nvim)

## Completion, Snippets & AI
- [blink.cmp](https://github.com/saghen/blink.cmp)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [blink-cmp-copilot](https://github.com/giuxtaposition/blink-cmp-copilot)

## Treesitter & Editing Aids
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [visual-surround.nvim](https://github.com/NStefan002/visual-surround.nvim)
- [multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim)
- [mini.pairs](https://github.com/nvim-mini/mini.pairs)
- [mini.move](https://github.com/nvim-mini/mini.move)
- [mini.cursorword](https://github.com/nvim-mini/mini.cursorword)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [miss.nvim](https://github.com/Enigama/miss.nvim)

## Git
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)

## Projects & Sessions
- [neovim-project](https://github.com/coffebar/neovim-project)
- [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)

## Shared Dependencies
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

---

# Keybindings

## Global
- n: <leader>w → :write
- n: <leader>q → :quit
- n: <Tab>n → :tabnext
- n: <Tab>p → :tabprevious
- n: <Tab>c → :tabclose
- n: <Tab>o → :tabonly
- n: <Tab>1..9 → 1gt..9gt

## Dropbar
- n: <leader>; → Pick symbols in winbar

## Flash
- n,x,o: s → Flash jump
- n,x,o: S → Flash Treesitter
- o: r → Remote Flash
- o,x: R → Treesitter search
- c: <C-s> → Toggle Flash search

## Harpoon
- n: <leader>H → Add current file
- n: <leader>h → Toggle quick menu
- n: <leader>1..5 → Jump to file 1..5
- n: <leader>h0 → Clear all marks

## Menu
- n,x: <RightMouse> → Context menu at cursor

## Neo-tree
- n: <leader>e → :Neotree toggle
- n: <leader>o → :Neotree focus
- n: <leader>fe → :Neotree reveal
- In Neo-tree window: t → tabnew, h → split, v → vsplit

## Neovim Project
- n: <leader>fp → Telescope neovim-project discover

## nvim-spectre
- n: <leader>S → Toggle Spectre
- n: <leader>sw → Search current word
- x: <leader>sw → Search selection
- n: <leader>sp → Search in current file

## nvim-window
- n: <C-w><C-w> → Pick window

## Telescope
- n: <leader>ff → Find files
- n: <leader>gf → Git files
- n: <leader>fg → Live grep
- n: <leader>fb → Buffers
- n: <leader>fr → Recent files (cwd)
- n: <leader><space> → Switch buffer

## Telescope Undo
- n: <leader>u → Telescope undo

## Trouble
- n: <leader>xx → Toggle diagnostics list

## Yazi
- n,x: <leader>- → Open at current file
- n: <leader>cw → Open at CWD
- n: <C-Up> → Toggle/resume last session
- In Yazi: <F1> → Show help

## Multicursor
- n,x: <leader>n → Add cursor (next match)
- n,x: <leader>s → Skip cursor (next match)
- n,x: <leader>N → Add cursor (prev match)
- n,x: <leader>S → Skip cursor (prev match)
- n: <C-LeftMouse>/<C-LeftDrag>/<C-LeftRelease> → Mouse add/drag/release cursors
- n,x: <C-q> → Toggle enable/disable cursors
- Active when multicursor is enabled:
  - n,x: <Left>/<Right> → Prev/next cursor
  - n,x: <leader>x → Delete main cursor
  - n,x: <Up>/<Down> → Line-wise add cursor up/down
  - n,x: <leader><Up>/<leader><Down> → Line-wise skip cursor up/down
  - n: <Esc> → Enable if disabled, else clear all cursors
