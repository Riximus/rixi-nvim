-- File handling
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- Split window
vim.keymap.set("n", "_", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Vertical Split" })

-- Resize window
--keymap.set("n", "<C-w><left>", "<C-w><")
--keymap.set("n", "<C-w><right>", "<C-w>>")
--keymap.set("n", "<C-w><up>", "<C-w>+")
--keymap.set("n", "<C-w><down>", "<C-w>-")

-- Increment/decrement numbers
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Tab navigation
--vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
--vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })
--vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
--vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close Others" })
vim.keymap.set("n", "<Tab><Tab>", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<Tab>c", ":tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<Tab>o", ":tabonly<CR>", { desc = "Close Others" })

-- Tab switching with Tab+number
vim.keymap.set("n", "<Tab>1", "1gt", { desc = "Go to tab 1" })
vim.keymap.set("n", "<Tab>2", "2gt", { desc = "Go to tab 2" })
vim.keymap.set("n", "<Tab>3", "3gt", { desc = "Go to tab 3" })
vim.keymap.set("n", "<Tab>4", "4gt", { desc = "Go to tab 4" })
vim.keymap.set("n", "<Tab>5", "5gt", { desc = "Go to tab 5" })
vim.keymap.set("n", "<Tab>6", "6gt", { desc = "Go to tab 6" })
vim.keymap.set("n", "<Tab>7", "7gt", { desc = "Go to tab 7" })
vim.keymap.set("n", "<Tab>8", "8gt", { desc = "Go to tab 8" })
vim.keymap.set("n", "<Tab>9", "9gt", { desc = "Go to tab 9" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Clear search highlights
vim.keymap.set("n", "<leader>ch", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Duplicate current line below (Normal and visual mode)
vim.keymap.set("n", "<leader>dd", "<Cmd>t.<CR>", { desc = "Duplicate line below" })
vim.keymap.set("x", "<leader>dd", ":'<,'>t'><CR>", { desc = "Duplicate selection below" })
-- Duplicate current line above (Normal and visual mode)
vim.keymap.set("n", "<leader>dD", "<Cmd>t-1<CR>", { desc = "Duplicate line above" })
vim.keymap.set("x", "<leader>dD", ":'<,'>t-1<CR>", { desc = "Duplicate selection above" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Delete a word backwards
vim.keymap.set("n", "<leader>dw", 'vb"_d', { desc = "Delete word backwards" })

-- Delete ALL marks: buffer-local (a–z), global/project (A–Z), and numbered (0–9)
vim.keymap.set("n", "<leader>mX", function()
	vim.cmd("delmarks! | delmarks A-Z0-9")
	pcall(vim.notify, "All marks deleted (a–z, A–Z, 0–9)", vim.log.levels.INFO, { title = "Marks" })
end, { desc = "Delete ALL marks (buffer/global/0–9)" })
