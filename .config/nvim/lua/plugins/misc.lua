return {
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

  -- {
  --   "smjonas/inc-rename.nvim",
  --   cmd = "IncRename",
  --   config = true,
  -- },
  --
  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   keys = {
  --     {
  --       "<leader>r",
  --       function()
  --         require("refactoring").select_refactor()
  --       end,
  --       mode = "v",
  --       noremap = true,
  --       silent = true,
  --       expr = false,
  --     },
  --   },
  --   config = {},
  -- },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>ls", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = {
      relative_width = true,
      width = 20, --%
    },
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

  -- neorg
  -- {
  --   "nvim-neorg/neorg",
  --   ft = "norg",
  --   config = {
  --     load = {
  --       ["core.defaults"] = {},
  --       ["core.norg.concealer"] = {},
  --       ["core.norg.completion"] = {
  --         config = { engine = "nvim-cmp" },
  --       },
  --       ["core.integrations.nvim-cmp"] = {},
  --     },
  --   },
  -- },
  --
  -- -- markdown preview
  -- {
  --   "toppair/peek.nvim",
  --   build = "deno task --quiet build:fast",
  --   keys = {
  --     {
  --       "<leader>op",
  --       function()
  --         local peek = require("peek")
  --         if peek.is_open() then
  --           peek.close()
  --         else
  --           peek.open()
  --         end
  --       end,
  --       desc = "Peek (Markdown Preview)",
  --     },
  --   },
  --   config = { theme = "light" },
  -- },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
  },
}
