local M = {
  "nvim-neo-tree/neo-tree.nvim",
  -- enabled = false,
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  keys = {
    {
      "<leader>n",
      "<cmd>Neotree toggle<cr>",
      desc = "NeoTree",
    },
  },
}
function M.config()
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  require("window-picker").setup({
    -- when there is only one window available to pick from, use that window
    -- without prompting the user to select
    autoselect_one = true,

    -- whether you want to include the window you are currently on to window
    -- selection or not
    include_current_win = false,

    -- when you go to window selection mode, status bar will show one of
    -- following letters on them so you can use that letter to select the window
    -- selection_chars = "FJDKSLA;CMRUEIWOQP",
    selection_chars = "ABCDEFGHIJKLMNOPQR",

    -- whether you want to use winbar instead of the statusline
    -- "always" means to always use winbar,
    -- "never" means to never use winbar
    -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
    use_winbar = "smart", -- "always" | "never" | "smart"

    -- whether to show 'Pick window:' prompt
    show_prompt = true,

    -- if you want to manually filter out the windows, pass in a function that
    -- takes two parameters. you should return window ids that should be
    -- included in the selection
    -- EX:-
    -- function(window_ids, filters)
    --    -- filter the window_ids
    --    -- return only the ones you want to include
    --    return {1000, 1001}
    -- end
    filter_func = nil,

    -- following filters are only applied when you are using the default filter
    -- defined by this plugin. if you pass in a function to "filter_func"
    -- property, you are on your own
    filter_rules = {
      -- filter using buffer options
      bo = {
        -- if the file type is one of following, the window will be ignored
        filetype = { "NvimTree", "neo-tree", "notify" },

        -- if the buffer type is one of following, the window will be ignored
        buftype = { "terminal" },
      },

      -- filter using window options
      wo = {},

      -- if the file path contains one of following names, the window
      -- will be ignored
      file_path_contains = {},

      -- if the file name contains one of following names, the window will be
      -- ignored
      file_name_contains = {},
    },

    -- the foreground (text) color of the picker
    fg_color = "#ededed",

    -- if you have include_current_win == true, then current_win_hl_color will
    -- be highlighted using this background color
    current_win_hl_color = "#e35e4f",

    -- all the windows except the curren window will be highlighted using this
    -- color
    other_win_hl_color = "#a9b665",

    -- You can change the display string in status bar.
    -- It supports '%' printf style. Such as `return char .. ': %f'` to display
    -- buffer filepath. See :h 'stl' for details.
    selection_display = function(char)
      return char
    end,
  })

  require("neo-tree").setup({
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    -- sort_function = function (a,b)
    --       if a.type == b.type then
    --           return a.path > b.path
    --       else
    --           return a.type > b.type
    --       end
    --   end , -- this sorts files and directories descendantly
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 2, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
    window = {
      position = "left",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = {
          "toggle_node",
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["<esc>"] = "clear_filter", -- default is <C+x>
        -- ["<esc>"] = "revert_preview",
        -- ["P"] = { "toggle_preview", config = { use_float = true } },
        -- ["s"] = "open_split",
        -- ["v"] = "open_vsplit",
        ["s"] = "split_with_window_picker",
        ["v"] = "vsplit_with_window_picker",
        ["t"] = "open_tabnew",
        -- ["<cr>"] = "open_drop",
        -- ["t"] = "open_tab_drop",
        ["o"] = "open_with_window_picker",
        --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
        ["."] = "set_root", -- changes the root directory to the currently selected folder.
        ["U"] = "navigate_up", -- moves the root directory up one level.
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        --["Z"] = "expand_all_nodes",
        ["a"] = {
          "add",
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        -- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        ["c"] = {
          "copy",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
      },
    },
    nesting_rules = {},
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".git",
          ".github",
          "node_modules",
          "vendor",
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
          "thumbs.db",
        },
        never_show_by_pattern = { -- uses glob style patterns
          ".null-ls_*",
        },
      },
      follow_current_file = true, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = false, -- when true, empty folders will be grouped together
      hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
      -- in whatever position is specified in window.position
      -- "open_current",  -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
      use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
      -- instead of relying on nvim autocmd events.
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
      },
    },
    buffers = {
      follow_current_file = true, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
        },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
  })
end

return M
