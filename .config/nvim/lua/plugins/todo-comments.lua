local M = {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },

  event = "BufReadPost",
}

function M.config()
  require("todo-comments").setup({
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*\ ]], -- pattern or table of patterns, used for highlightng (vim regex)
    },
    search = {
      pattern = [[\b(KEYWORDS)\ \b]], -- match without the extra colon. You'll likely get false positives
    },
  })
end

function M.init()
  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })

  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })
end

return M
