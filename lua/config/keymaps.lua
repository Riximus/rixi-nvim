-- File handling
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- Tab navigation
--vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
--vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })
--vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
--vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close Others" })

vim.keymap.set("n", "<Tab>n", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<Tab>p", ":tabprevious<CR>", { desc = "Previous Tab" })
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
