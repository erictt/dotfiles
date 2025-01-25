local M = {
  "f4z3r/gruvbox-material.nvim",
  lazy = false,
}

function M.config()
  require("gruvbox-material").setup()
end

return M
