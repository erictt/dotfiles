---@type lspconfig.options
return {
  mason = {
    "prettierd",

    "lua-language-server", -- lua lsp
    "stylua", -- lua formatter
    "selene",
    "luacheck", -- lua

    "shellcheck", -- shell script analyser
    "shfmt", -- shell format

    "eslint_d", -- javascript, typescript linkt
    -- "deno", -- javascript, typescript defaults

    "clang-format", -- c, cpp
    "clangd", -- c, cpp

    "intelephense", -- php lsp
    "phpstan", -- php lint
    "php-cs-fixer", -- php formatter

    "black", -- python formatter
    "yapf", -- python formatter
    "pylint", --python static code analyser
    "pyright", -- python static type checker
    "isort", -- python sort imports
  },
  lsp = {
    bashls = {},
    clangd = {},
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
    marksman = {},
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
  },
}
