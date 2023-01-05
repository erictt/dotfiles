return {
  "jose-elias-alvarez/typescript.nvim",
  "b0o/SchemaStore.nvim", -- used by json lsp for format
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    -- keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
    ensure_installed = {
      "prettierd",

      "lua-language-server", -- lua lsp
      "stylua", -- lua formatter
      "selene",
      "luacheck", -- lua

      "shellcheck", -- shell script analyser
      "shfmt", -- shell format

      "eslint_d", -- javascript, typescript linkt
      "deno", -- javascript, typescript defaults

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
    cmd = "LspInfo",
    name = "lsp",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- setup formatting and keymaps
      require("util").on_attach(function(client, buffer)
        require("plugins.lsp.formatting").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("settings").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })

      local colors = require("settings").colors
      vim.api.nvim_command("hi DiagnosticError guifg=" .. colors.error)
      vim.api.nvim_command("hi DiagnosticWarn guifg=" .. colors.warning)
      vim.api.nvim_command("hi DiagnosticHint guifg=" .. colors.hint)
      vim.api.nvim_command("hi DiagnosticInfo guifg=" .. colors.info)

      -- lspconfig
      local servers = require("plugins.lsp.servers")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
          local opts = servers[server] or {}
          opts.capabilities = capabilities
          require("lspconfig")[server].setup(opts)
        end,
      })
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
