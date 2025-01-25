return {
  -- {
  --   "folke/drop.nvim",
  --   -- enabled = false,
  --   event = "VimEnter",
  --   config = function()
  --     require("drop").setup({
  --       theme = "snow",
  --       screensaver = 1000 * 60 * 5,
  --     })
  --   end,
  -- },
  {
    "eandrju/cellular-automaton.nvim",
    keys = { { "<leader>fk", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" } },
  },
}
