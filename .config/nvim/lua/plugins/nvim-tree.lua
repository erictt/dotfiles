local M = {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  local options = {
    filters = {
      dotfiles = false,
      exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
    },
    open_on_tab = true,
    prefer_startup_root = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = { "alpha" },
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
      width = 30,
      hide_root_folder = true,
      mappings = {
        list = {
          { key = "t", action = "tabnew" },
          { key = "u", action = "dir_up" },
          { key = "C", action = "cd" },
          { key = "v", action = "vsplit" },
          { key = "s", action = "split" },
          -- { key = "o", action = "<CR>" },
          -- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
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
      highlight_opened_files = "all",

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
