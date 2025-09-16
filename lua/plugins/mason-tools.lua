return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependencies = { "williamboman/mason.nvim" },
  opts = function()
    return {
      ensure_installed = require("config.tools"),
      run_on_start = true,
      auto_update = false,
      start_delay = 0, -- you can bump this if you want it to run after UI is up
    }
  end,
}
