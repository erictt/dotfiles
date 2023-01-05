local M = {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  cmd = "NvimTreeToggle",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>n",
      "<cmd>NvimTree toggle<cr>",
      desc = "NvimTree",
    },
  },
}

function M.config()
  local options = {
    filters = {
      dotfiles = false,
    },
    -- open_on_tab = true,
    -- prefer_startup_root = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    diagnostics = {
      enable = true,
    },
    ignore_ft_on_setup = { "startify", "dashboard", "alpha" },
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = false,
    },
    view = {
      -- adaptive_size = true,
      side = "left",
      width = 35,
      hide_root_folder = false,
      mappings = {
        list = {
          { key = "t", action = "tabnew" },
          { key = "u", action = "dir_up" },
          { key = "C", action = "cd" },
          { key = "v", action = "vsplit" },
          { key = "s", action = "split" },
        },
      },
    },
    git = {
      enable = false,
      ignore = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    renderer = {
      highlight_git = true,
      -- highlight_opened_files = "all",

      indent_markers = {
        enable = false,
      },

      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },

        glyphs = {
          default = "",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  }

  vim.g.nvimtree_side = options.view.side
  require("nvim-tree").setup(options)
end

return M
