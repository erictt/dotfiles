local M = {
  "numToStr/Comment.nvim",
  -- enabled = false
  keys = { "gc", "gcc", "gb" },
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}

function M.config()
  require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })
end

return M
