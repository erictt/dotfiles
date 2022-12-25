return {
  "b0o/SchemaStore.nvim", -- used by json lsp for format
  "jose-elias-alvarez/typescript.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = function()
      require("inc_rename").setup()
    end,
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
    init = function()
      -- prompt for a refactor to apply when the remap is triggered
      vim.keymap.set("v", "<leader>r", function()
        require("refactoring").select_refactor()
      end, { noremap = true, silent = true, expr = false })
    end,
    config = function()
      require("refactoring").setup({})
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    init = function()
      vim.keymap.set("n", "<leader>cs", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
    end,
    config = function()
      require("symbols-outline").setup()
    end,
  },

  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      require("hlargs").setup({
        excluded_argnames = {
          usages = {
            lua = { "self", "use" },
          },
        },
      })
    end,
  },

  -- Theme: icons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  
  {
    "norcalli/nvim-terminal.lua",
    ft = "terminal",
    config = function()
      require("terminal").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({
        auto_open = false,
        use_diagnostic_signs = true, -- en
      })
    end,
  },
}
