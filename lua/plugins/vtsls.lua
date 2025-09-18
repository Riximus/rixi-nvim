return {
  "yioneko/nvim-vtsls",
  event = "VeryLazy",
  config = function()
    -- Let vim.lsp.enable('vtsls') work
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig

    local util = require("lspconfig.util")

    -- Mason fallback path to @vue/language-server
    local mason_vue_ls = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    -- Helper to build the plugin spec
    local function vue_ts_plugin(path)
      return {
        name = "@vue/typescript-plugin",
        location = path or mason_vue_ls,    -- will be overridden per project in on_new_config
        languages = { "vue" },
        configNamespace = "typescript",
        enableForWorkspaceTypeScriptVersions = true,
      }
    end

    local vtsls_config = {
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
      single_file_support = false,

      -- IMPORTANT: pass the Vue TS plugin via settings.vtsls.tsserver.globalPlugins
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_ts_plugin(mason_vue_ls),
            },
          },
        },
        typescript = {
          inlayHints = {
            parameterNames           = { enabled = "all" },
            parameterTypes           = { enabled = true },
            variableTypes            = { enabled = true, suppressWhenTypeMatchesName = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes  = { enabled = true },
            enumMemberValues         = { enabled = true },
          },
        },
        javascript = {
          inlayHints = {
            parameterNames           = { enabled = "all" },
            parameterTypes           = { enabled = true },
            variableTypes            = { enabled = true, suppressWhenTypeMatchesName = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes  = { enabled = true },
            enumMemberValues         = { enabled = true },
          },
        },
      },

      -- Prefer project-local @vue/language-server, else Mason fallback
      on_new_config = function(new_config, root_dir)
        local local_vue_ls = util.path.join(root_dir, "node_modules", "@vue", "language-server")
        local plugin_path = vim.uv.fs_stat(local_vue_ls) and local_vue_ls or mason_vue_ls

        local plugins = (((new_config.settings or {}).vtsls or {}).tsserver or {}).globalPlugins
        if type(plugins) == "table" then
          for _, p in ipairs(plugins) do
            if p.name == "@vue/typescript-plugin" then
              p.location = plugin_path
            end
          end
        end
      end,
    }

    -- Neovim 0.11 style registration so your init.lua call to vim.lsp.enable() picks this up
    if vim.lsp and vim.lsp.config then
      vim.lsp.config("vtsls", vtsls_config)
    end
  end,
}
