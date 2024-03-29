return {
  { "nvim-tree/nvim-web-devicons", config = { default = true } },
  -- {
  --   "rcarriga/nvim-notify",
  --   enabled = false,
  --   keys = {
  --     {
  --       "<leader>md",
  --       function()
  --         require("notify").dismiss({ silent = true, pending = true })
  --       end,
  --       desc = "Delete all Notifications",
  --     },
  --   },
  --   config = {
  --     timeout = 3000,
  --     max_height = function()
  --       return math.floor(vim.o.lines * 0.75)
  --     end,
  --     max_width = function()
  --       return math.floor(vim.o.columns * 0.75)
  --     end,
  --   },
  -- },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    -- enabled = false,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = {
      exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
      },
      scope = {
        highlight = require("settings").highlight,
      },
      whitespace = {
        remove_blankline_trail = true,
      },
    },
  },

  -- noicer ui
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     -- "rcarriga/nvim-notify",
  --   },
  --   config = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --       progress = {
  --         enabled = true,
  --         -- format = "conceal",
  --         -- format = "lsp_progress",
  --         -- format_done = "conceal",
  --         -- format_done = "lsp_progress_done",
  --         throttle = 1000, -- frequency to update lsp progress message (1000ms)
  --         view = "mini",
  --       },
  --       -- message = {
  --       --   enabled = false,
  --       -- },
  --     },
  --     presets = {
  --       bottom_search = true,
  --       command_palette = true,
  --       long_message_to_split = true,
  --     },
  --   },
  --   throttle = 100,
  --   -- stylua: ignore
  --   keys = {
  --     -- { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
  --     { "<leader>ml", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
  --     { "<leader>mh", function() require("noice").cmd("history") end, desc = "Noice History" },
  --     { "<leader>ma", function() require("noice").cmd("all") end, desc = "Noice All" },
  --     { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true },
  --     { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true },
  --   },
  -- },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },
}
