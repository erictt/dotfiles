return {
  {
    "numToStr/Comment.nvim",
    -- enabled = false
    keys = { "gc", "gcc", "gb" },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
    },
    config = function()
      require("todo-comments").setup({
        highlight = {
          pattern = [[.*<(KEYWORDS)\s*\ ]], -- pattern or table of patterns, used for highlightng (vim regex)
        },
        search = {
          pattern = [[\b(KEYWORDS) \b]], -- match without the extra colon. You'll likely get false positives
        },
      })
    end,
  },
}
