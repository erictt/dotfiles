local M = {
  "akinsho/nvim-bufferline.lua",
  event = "BufReadPre",
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
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      separator_style = "thick",
      show_buffer_close_icons = false,
      diagnostics_indicator = function(_, _, diag)
        local s = {}
        for _, severity in ipairs(severities) do
          if diag[severity] then
            table.insert(s, signs[severity] .. diag[severity])
          end
        end
        return table.concat(s, " ")
      end,
    },
    highlights = {
      error_diagnostic_selected = { fg = "#ea6962" },
      warning_diagnostic_selected = { fg = "#d8a657" },
      info_diagnostic_selected = { fg = "#53d0f0" },
      hint_diagnostic_selected = { fg = "#a9b665" },
    },
  })
end

-- function M.init()
--   vim.keymap.set("n", "<TAB>", "<cmd>:BufferLineCycleNext<CR>", { desc = "Next Buffer" })
--   vim.keymap.set("n", "<S-Tab>", "<cmd>:BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
-- end

return M
