local M = {
  "wittyjudge/gruvbox-material.nvim",
  lazy = false,
}

function M.config()
  -- vim.o.background = "dark"
  require('gruvbox-material').setup()
end

return M

