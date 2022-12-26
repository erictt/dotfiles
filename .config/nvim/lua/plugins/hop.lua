local M = {
  "phaazon/hop.nvim",
  cmd = "HopWord",
  event = "VeryLazy",
}

function M.config()
  require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
end

function M.init()
  -- place this in one of your configuration file(s)
  vim.keymap.set("n", "gh", "<cmd>:HopWord<cr>", { desc = "Hop Word" })
end

return M
