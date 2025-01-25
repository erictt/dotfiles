return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "f4z3r/gruvbox-material.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
