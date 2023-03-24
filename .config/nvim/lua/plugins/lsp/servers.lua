---@type lspconfig.options
return {
  bashls = {},
  clangd = {
    -- cmd = require("lspcontainers").command("clangd"),
  },
  dockerls = {},
  tsserver = {},
  -- eslint = {},
  jsonls = {
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },
  gopls = {},
  -- marksman = {},
  ltex = {},
  pyright = {},
  -- rust_analyzer = {
  --   settings = {
  --     ["rust-analyzer"] = {
  --       cargo = { allFeatures = true },
  --       checkOnSave = {
  --         command = "clippy",
  --         extraArgs = { "--no-deps" },
  --       },
  --     },
  --   },
  -- },
  yamlls = {},
  -- lua_ls = {},
  vimls = {},
  -- php
  -- phpactor = {},
  intelephense = {
    settings = {
      intelephense = {
        -- format = {
        --   enable = false,
        -- },
        diagnostics = {
          enable = false,
        },
      },
    },
  },
}
