return {
  "b0o/SchemaStore.nvim", -- used by json lsp for format
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
    ensure_installed = {
      "prettierd",

      "lua-language-server", -- lua lsp
      "stylua", -- lua formatter
      "selene",
      "luacheck", -- lua

      "shellcheck", -- shell script analyser
      "shfmt", -- shell format

      "eslint_d", -- javascript, typescript
      "deno", -- javascript, typescript defaults

      "clang-format", -- c, cpp
      "clangd", -- c, cpp

      "intelephense", -- php lsp
      "php-cs-fixer", -- php formatter

      "black", -- python formatter
      "yapf", -- python formatter
      "pylint", --python static code analyser
      "pyright", -- python static type checker
      "isort", -- python sort imports
    },
    config = function(plugin)
      require("mason").setup()
      local mr = require("mason-registry")
      for _, tool in ipairs(plugin.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    name = "lsp",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "williamboman/mason-lspconfig.nvim", config = { automatic_installation = true } },
    },
    config = function()
      require("mason")
      require("plugins.lsp.diagnostics").setup()

      local function on_attach(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
        require("plugins.lsp.formatting").setup(client, bufnr)
        require("plugins.lsp.keys").setup(client, bufnr)
      end

      ---@type lspconfig.options
      local servers = {
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
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      ---@type _.lspconfig.options
      local options = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      }

      for server, opts in pairs(servers) do
        opts = vim.tbl_deep_extend("force", {}, options, opts or {})
        if server == "tsserver" then
          require("typescript").setup({ server = opts })
        else
          require("lspconfig")[server].setup(opts)
        end
      end

      require("plugins.null-ls").setup(options)
    end,
  },

  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",
    init = function()
      vim.g.navic_silence = true
      require("util").on_attach(function(client, buffer)
        require("nvim-navic").attach(client, buffer)
      end)
    end,
    config = { separator = " ", highlight = true, depth_limit = 5 },
  },
}
