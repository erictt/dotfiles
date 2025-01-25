local M = {
  "goolord/alpha-nvim",
  enabled = false,
  -- lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
}

function M.config()
  -- dynamic header padding
  local alpha = require("alpha")
  local fn = vim.fn
  local marginTopPercent = 0.3
  local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

  local options = {

    header = {
      type = "text",
      val = {
        "         ██                          ██         ",
        "       ██  ██                      ██  ██       ",
        "     ██      ██                  ██      ██     ",
        "     ██        ██              ██        ██     ",
        "     ██          ██████████████          ██     ",
        "     ██        ██              ██        ██     ",
        "     ██                                  ██     ",
        "     ██                                  ██     ",
        "     ██                                  ██     ",
        "     ██                                  ██     ",
        "   ██        ████              ████        ██   ",
        " ██          ██████          ██████          ██ ",
        " ██                                          ██ ",
        " ██                  ██████                  ██ ",
        " ██            ██      ██      ██            ██ ",
        "   ██            ██████████████            ██   ",
        "   ██                                      ██   ",
        "     ██                                  ██     ",
        "       ██                              ██       ",
        "         ████████              ████████         ",
        "                 ██████████████                 ",
      },
      opts = {
        position = "center",
        hl = "AlphaHeader",
      },
    },

    buttons = {
      type = "group",
      val = {},
      opts = {
        spacing = 1,
      },
    },

    headerPaddingTop = { type = "padding", val = headerPadding },
    headerPaddingBottom = { type = "padding", val = 2 },
  }

  alpha.setup({
    layout = {
      options.headerPaddingTop,
      options.header,
      options.headerPaddingBottom,
      options.buttons,
    },
    opts = {},
  })
end

return M
