return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = { save_on_toggle = true },
    menu = { width = vim.api.nvim_win_get_width(0) - 4 },
  },
  keys = {
    { "<leader>H", function() require("harpoon"):list():add() end, desc = "Harpoon: add file" },
    { "<leader>h", function() local h=require("harpoon"); h.ui:toggle_quick_menu(h:list()) end, desc = "Harpoon: quick menu" },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1" },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2" },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3" },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file 4" },
    { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon to file 5" },
    { "<leader>h0", function() local h=require("harpoon"); h:list():clear(); vim.notify("Harpoon: cleared") end, desc = "Harpoon: clear all" },
  },
  config = function(_, opts)
    require("harpoon").setup(opts)
  end,
}
