-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.general = {
  -- i = {
  --   -- go to  beginning and end
  --   ["<C-b>"] = { "<ESC>^i", "beginning of line" },
  --   ["<C-e>"] = { "<End>", "end of line" },
  -- },

  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

    -- switch between windows
    -- ["<C-h>"] = { "<C-w>h", "window left" },
    -- ["<C-l>"] = { "<C-w>l", "window right" },
    -- ["<C-j>"] = { "<C-w>j", "window down" },
    -- ["<C-k>"] = { "<C-w>k", "window up" },
    -- ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    -- ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    -- ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    -- ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    -- ["<C-p>"] = "<cmd>bp<CR>",
    -- ["<C-n>"] = "<cmd>bn<CR>",

    -- save
    -- ["<C-s>"] = { "<cmd> w <CR>", "save file" },

    -- Copy all
    -- ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

    -- line numbers
    -- ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
    -- ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    -- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    -- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

    ["<leader>pl"] = { "<cmd>NvimTreeResize +10<CR>", "expand nvimtree" },
    ["<leader>ph"] = { "<cmd>NvimTreeResize -10<CR>", "narrow nvimtree" },
  },

  -- t = { ["<C-x>"] = { termcodes("<C-\\><C-N>"), "escape terminal mode" } },

  -- v = {
  --   ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
  --   ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
  -- },

  -- x = {
  --   ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
  --   ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
  --   -- Don't copy the replaced text after pasting in visual mode
  --   -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
  --   ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
  -- },
}

M.bufferline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "goto next buffer" },
    ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR>", "goto prev buffer" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      "<cmd> Bdelete <CR>",
      -- function()
      --   require("core.utils").close_buffer()
      -- end,
      "close buffer",
    },

    -- pick buffers via numbers
    -- ["<Bslash>"] = { "<cmd> BufferLinePick <CR>", "Pick buffer" },
    ["<leader>ba"] = { "<cmd> BufferLinePick <CR>", "Pick buffer" },
    ["<leader>bx"] = { "<cmd> Bwipeout <CR>", "Wipe out buffers" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>lD"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>lc"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["<leader>lh"] = {
      function()
        vim.diagnostic.hide()
      end,
      "lsp hide diagnostic",
    },

    ["<leader>lH"] = {
      function()
        vim.diagnostic.show()
      end,
      "lsp show diagnostic",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>lo"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["d]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>lq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format()
      end,
      "lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    -- [""] = {"<cmd>set nospell<CR>", "set nospell"},
    -- [""] = { "<cmd>NvimTreeResize +10<CR>", "widen tree" },
    -- [""] = { "<cmd>NvimTreeResize -10<CR>", "narrow tree" },

    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>bf"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "show bookmars" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "toggle vertical term",
    },

    -- new

    -- ["<leader>th"] = {
    --   function()
    --     require("nvterm.terminal").new "horizontal"
    --   end,
    --   "new horizontal term",
    -- },
    --
    -- ["<leader>tv"] = {
    --   function()
    --     require("nvterm.terminal").new "vertical"
    --   end,
    --   "new vertical term",
    -- },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>kK"] = {
      function()
        vim.cmd("WhichKey")
      end,
      "which-key all keymaps",
    },
    ["<leader>kk"] = {
      function()
        local input = vim.fn.input("WhichKey: ")
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd([[normal! _]])
        end
      end,

      "Jump to current_context",
    },
  },
}

return M
