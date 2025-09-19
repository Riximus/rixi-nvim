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

Leader key: `<Space>` (this config sets `vim.g.mapleader = " "`).
Notation: All key tokens in angle brackets are literal keys (wrapped in backticks so they render). Examples: `<Tab>`, `<C-w>`, `<F1>`.

## Core / Tabs

| Mode | Keys               | Action           |
| ---- | ------------------ | ---------------- |
| n    | `<leader>w`        | Write buffer     |
| n    | `<leader>q`        | Quit             |
| n    | `<Tab>n`           | Next tab         |
| n    | `<Tab>p`           | Previous tab     |
| n    | `<Tab>c`           | Close tab        |
| n    | `<Tab>o`           | Close other tabs |
| n    | `<Tab>1`..`<Tab>9` | Go to tab 1..9   |

## Dropbar

| Mode | Keys        | Action                 |
| ---- | ----------- | ---------------------- |
| n    | `<leader>;` | Pick symbols in winbar |

## Flash

| Mode      | Keys    | Action              |
| --------- | ------- | ------------------- |
| n / x / o | `s`     | Flash jump          |
| n / x / o | `S`     | Flash Treesitter    |
| o         | `r`     | Remote Flash        |
| o / x     | `R`     | Treesitter search   |
| c         | `<C-s>` | Toggle Flash search |

## Harpoon

| Mode | Keys                     | Action             |
| ---- | ------------------------ | ------------------ |
| n    | `<leader>H`              | Harpoon add file   |
| n    | `<leader>h`              | Harpoon quick menu |
| n    | `<leader>1`..`<leader>5` | Harpoon file 1..5  |
| n    | `<leader>h0`             | Harpoon clear all  |

## Menu

| Mode  | Keys           | Action       |
| ----- | -------------- | ------------ |
| n / x | `<RightMouse>` | Context menu |

## Neo-tree

| Mode         | Keys         | Action              |
| ------------ | ------------ | ------------------- |
| n            | `<leader>e`  | Toggle Neo-tree     |
| n            | `<leader>o`  | Focus Neo-tree      |
| n            | `<leader>fe` | Reveal current file |
| neo-tree win | `t`          | Open in new tab     |
| neo-tree win | `h`          | Horizontal split    |
| neo-tree win | `v`          | Vertical split      |

## Projects

| Mode | Keys         | Action                    |
| ---- | ------------ | ------------------------- |
| n    | `<leader>fp` | Find projects (Telescope) |

## Spectre (Search/Replace)

| Mode | Keys         | Action                 |
| ---- | ------------ | ---------------------- |
| n    | `<leader>S`  | Toggle Spectre         |
| n    | `<leader>sw` | Search current word    |
| x    | `<leader>sw` | Search selection       |
| n    | `<leader>sp` | Search in current file |

## Window Picker

| Mode | Keys         | Action      |
| ---- | ------------ | ----------- |
| n    | `<C-w><C-w>` | Pick window |

## Telescope

| Mode | Keys              | Action             |
| ---- | ----------------- | ------------------ |
| n    | `<leader>ff`      | Find files         |
| n    | `<leader>gf`      | Git files          |
| n    | `<leader>fg`      | Live grep          |
| n    | `<leader>fb`      | Buffers            |
| n    | `<leader>fr`      | Recent files (cwd) |
| n    | `<leader><Space>` | Switch buffer      |

## Telescope Undo

| Mode | Keys        | Action              |
| ---- | ----------- | ------------------- |
| n    | `<leader>u` | Undo history picker |

## Trouble

| Mode | Keys         | Action                  |
| ---- | ------------ | ----------------------- |
| n    | `<leader>xx` | Toggle diagnostics list |

## Yazi (File Manager)

| Mode    | Keys         | Action                       |
| ------- | ------------ | ---------------------------- |
| n / v   | `<leader>-`  | Open at current file         |
| n       | `<leader>cw` | Open at CWD                  |
| n       | `<C-Up>`     | Toggle / resume last session |
| In Yazi | `<F1>`       | Show help                    |

## Multicursor

| Mode     | Keys                                                 | Action                           |
| -------- | ---------------------------------------------------- | -------------------------------- |
| n / x    | `<leader>n`                                          | Add cursor (next)                |
| n / x    | `<leader>N`                                          | Add cursor (prev)                |
| n / x    | `<leader>s`                                          | Skip next match                  |
| n / x    | `<leader>S`                                          | Skip prev match                  |
| n        | `<C-LeftMouse>` / `<C-LeftDrag>` / `<C-LeftRelease>` | Mouse add/drag/release cursors   |
| n / x    | `<C-q>`                                              | Toggle multicursor enable        |
| active   | `<Left>` / `<Right>`                                 | Prev / next cursor               |
| active   | `<leader>x`                                          | Delete main cursor               |
| active   | `<Up>` / `<Down>`                                    | Add cursor up/down               |
| active   | `<leader><Up>` / `<leader><Down>`                    | Skip cursor up/down              |
| active n | `<Esc>`                                              | Enable (if disabled) / clear all |

## Marks.nvim

    mx              Set mark x
    m,              Set the next available alphabetical (lowercase) mark
    m;              Toggle the next available mark at the current line
    dmx             Delete mark x
    dm-             Delete all marks on the current line
    dm<space>       Delete all marks in the current buffer
    m]              Move to next mark
    m[              Move to previous mark
    m:              Preview mark. This will prompt you for a specific mark to
                    preview; press <cr> to preview the next mark.

    m[0-9]          Add a bookmark from bookmark group[0-9].
    dm[0-9]         Delete all bookmarks from bookmark group[0-9].
    m}              Move to the next bookmark having the same type as the bookmark under
                    the cursor. Works across buffers.
    m{              Move to the previous bookmark having the same type as the bookmark under
                    the cursor. Works across buffers.
    dm=             Delete the bookmark under the cursor.
