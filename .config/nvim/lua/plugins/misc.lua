return {
  "jose-elias-alvarez/typescript.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", config = { default = true } },
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

  -- Theme: icons

  -- {
  --   "norcalli/nvim-terminal.lua",
  --   ft = "terminal",
  --   config = true,
  -- },

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

  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("colorful-winsep").setup({
  --       highlight = {
  --         bg = "#282828",
  --         fg = "#d8a657",
  --       },
  --       interval = 30,
  --       no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree", "neo-tree" },
  --       symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  --       close_event = function() end,
  --       create_event = function() end,
  --     })
  --   end,
  -- },

  -- editorconfig is integrated into neovim 0.9, remove this when 0.9(stable) is released
  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPre",
  },
}
