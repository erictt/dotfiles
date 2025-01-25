local M = {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
}

function M.config()
  local tmux = require("nvim-tmux-navigation")

  tmux.setup {
      disable_when_zoomed = true -- defaults to false
  }

  vim.keymap.set('n', "<C-h>", tmux.NvimTmuxNavigateLeft)
  vim.keymap.set('n', "<C-j>", tmux.NvimTmuxNavigateDown)
  vim.keymap.set('n', "<C-k>", tmux.NvimTmuxNavigateUp)
  vim.keymap.set('n', "<C-l>", tmux.NvimTmuxNavigateRight)
end

return M
