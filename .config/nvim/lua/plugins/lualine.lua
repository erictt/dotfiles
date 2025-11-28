return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Remove time from the status line
      opts.sections.lualine_z = { "location" }
    end,
  },
}
