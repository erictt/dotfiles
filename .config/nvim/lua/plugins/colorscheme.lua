local M = {
  "wittyjudge/gruvbox-material.nvim",
  lazy = false,
}

function M.config()
  require("gruvbox-material").setup()
end

return M
