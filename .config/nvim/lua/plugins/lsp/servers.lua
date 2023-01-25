---@type lspconfig.options
return {
  bashls = {},
  clangd = {
    -- cmd = require("lspcontainers").command("clangd"),
  },
  dockerls = {},
  tsserver = {},
  eslint = {},
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
  sumneko_lua = {
    -- cmd = { "/Users/eric/.local/share/nvim/mason/bin/lua-language-server" },
    single_file_support = true,
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          workspaceWord = true,
          callSnippet = "Both",
        },
        misc = {
          parameters = {
            "--log-level=trace",
          },
        },
        diagnostics = {
          -- enable = false,
          groupSeverity = {
            strong = "Warning",
            strict = "Warning",
          },
          groupFileStatus = {
            ["ambiguity"] = "Opened",
            ["await"] = "Opened",
            ["codestyle"] = "None",
            ["duplicate"] = "Opened",
            ["global"] = "Opened",
            ["luadoc"] = "Opened",
            ["redefined"] = "Opened",
            ["strict"] = "Opened",
            ["strong"] = "Opened",
            ["type-check"] = "Opened",
            ["unbalanced"] = "Opened",
            ["unused"] = "Opened",
          },
          unusedLocalExclude = { "_*" },
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
            continuation_indent_size = "2",
          },
        },
      },
    },
  },
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
