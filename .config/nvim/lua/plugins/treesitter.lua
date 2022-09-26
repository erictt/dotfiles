local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local options = {
  ensure_installed = {
    "bash",
    "c",
    "go",
    "javascript",
    "json",
    "lua",
    "markdown",
    "php",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>ti",
      node_incremental = "<leader>tn",
      scope_incremental = "<leader>ts",
      node_decremental = "<leader>td",
    },
  },
}

treesitter.setup(options)
