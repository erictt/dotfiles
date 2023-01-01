return {
  "b0o/SchemaStore.nvim", -- used by json lsp for format
  "jose-elias-alvarez/typescript.nvim",
  "MunifTanjim/nui.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-lua/plenary.nvim",
  { "famiu/bufdelete.nvim", event = "BufReadPre" },
  "folke/which-key.nvim",

  -- {
  --   "folke/drop.nvim",
  --   enabled = false,
  --   event = "VimEnter",
  --   config = function()
  --     require("drop").setup({
  --       theme = "snow",
  --     })
  --   end,
  -- },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- LSP

  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    config = {},
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>ls", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "danymat/neogen",
    keys = {
      {
        "<leader>lc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    config = { snippet_engine = "luasnip" },
  },

  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    enabled = false,
    config = {
      excluded_argnames = {
        usages = {
          lua = { "self", "use" },
        },
      },
    },
  },

  -- Theme: icons
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },

  {
    "norcalli/nvim-terminal.lua",
    ft = "terminal",
    config = true,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = {
      auto_open = false,
      use_diagnostic_signs = true, -- en
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        plugins = {
          gitsigns = true,
          tmux = true,
          kitty = { enabled = false, font = "+2" },
        },
      })
    end,
  },
}
