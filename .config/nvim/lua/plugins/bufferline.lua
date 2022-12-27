local M = {
  "akinsho/nvim-bufferline.lua",
  event = "BufAdd",
  dependencies = { "tiagovla/scope.nvim" },
}

function M.config()
  local signs = require("plugins.lsp.diagnostics").signs

  signs = {
    error = signs.Error,
    warning = signs.Warn,
    info = signs.Info,
    hint = signs.Hint,
  }

  local severities = {
    "error",
    "warning",
    -- "info",
    -- "hint",
  }

  require("bufferline").setup({
    options = {
      show_close_icon = true,
      show_tab_indicators = true,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      separator_style = "thick",
      show_buffer_close_icons = true,
      diagnostics_indicator = function(_, _, diag)
        local s = {}
        for _, severity in ipairs(severities) do
          if diag[severity] then
            table.insert(s, signs[severity] .. diag[severity])
          end
        end
        return table.concat(s, " ")
      end,
      offsets = {
        {
          -- filetype = "NvimTree",
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
    highlights = {
      error_diagnostic_selected = { fg = "#ea6962" },
      warning_diagnostic_selected = { fg = "#d8a657" },
      info_diagnostic_selected = { fg = "#53d0f0" },
      hint_diagnostic_selected = { fg = "#a9b665" },
    },
  })
  require("scope").setup()
end

return M
