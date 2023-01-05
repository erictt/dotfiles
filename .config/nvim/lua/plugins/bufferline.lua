local M = {
  "akinsho/nvim-bufferline.lua",
  event = "BufAdd",
  dependencies = { "tiagovla/scope.nvim" },
}

function M.config()
  local colors = require("settings").colors

  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("settings").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "NvimTree",
          -- filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
    highlights = {

      error = { fg = colors.error },
      error_visible = { fg = colors.error },
      error_selected = { fg = colors.error },
      error_diagnostic = { fg = colors.error },
      error_diagnostic_visible = { fg = colors.error },
      error_diagnostic_selected = { fg = colors.error },

      warning = { fg = colors.warning },
      warning_visible = { fg = colors.warning },
      warning_selected = { fg = colors.warning },
      warning_diagnostic = { fg = colors.warning },
      warning_diagnostic_visible = { fg = colors.warning },
      warning_diagnostic_selected = { fg = colors.warning },

      info = { fg = colors.info },
      info_visible = { fg = colors.info },
      info_selected = { fg = colors.info },
      info_diagnostic = { fg = colors.info },
      info_diagnostic_visible = { fg = colors.info },
      info_diagnostic_selected = { fg = colors.info },

      hint = { fg = colors.hint },
      hint_visible = { fg = colors.hint },
      hint_selected = { fg = colors.hint },
      hint_diagnostic = { fg = colors.hint },
      hint_diagnostic_visible = { fg = colors.hint },
      hint_diagnostic_selected = { fg = colors.hint },
    },
  })
  require("scope").setup()
end

return M
