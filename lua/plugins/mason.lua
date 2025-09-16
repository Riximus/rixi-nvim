return {
  { "williamboman/mason.nvim", event = "VeryLazy", opts = { ui = { border = "rounded" } } },
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local servers = require("config.servers")
      return {
        ensure_installed = servers,
        automatic_installation = false,
      }
    end,
  },
}
