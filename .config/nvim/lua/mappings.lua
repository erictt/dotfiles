---@diagnostic disable: missing-parameter

local wk = require("which-key")
local util = require("util")

vim.o.timeoutlen = 300

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "," },
})

-- -- Move to window using the <ctrl> movement keys
-- vim.keymap.set("n", "<left>", "<C-w>h")
-- vim.keymap.set("n", "<down>", "<C-w>j")
-- vim.keymap.set("n", "<up>", "<C-w>k")
-- vim.keymap.set("n", "<right>", "<C-w>l")
--
-- -- Resize window using <ctrl> arrow keys
-- vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
-- vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
-- vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
-- vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")
--
-- -- Move Lines
-- vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
-- vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
-- vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
--
-- -- Switch buffers with tab
-- vim.keymap.set("n", "<C-Left>", "<cmd>bprevious<cr>")
-- vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>")
--
-- -- Easier pasting
-- -- vim.keymap.set("n", "[p", ":pu!<cr>")
-- -- vim.keymap.set("n", "]p", ":pu<cr>")
--
-- -- Clear search with <esc>
-- vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
-- vim.keymap.set("n", "gw", "*N")
-- vim.keymap.set("x", "gw", "*N")
--
-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })
--
-- -- Add undo break-points
-- vim.keymap.set("i", ",", ",<c-g>u")
-- vim.keymap.set("i", ".", ".<c-g>u")
-- vim.keymap.set("i", ";", ";<c-g>u")
--
-- -- save in insert mode
-- vim.keymap.set("i", "<C-s>", "<cmd>:w<cr><esc>")
-- vim.keymap.set("n", "<C-s>", "<cmd>:w<cr><esc>")
-- vim.keymap.set("n", "<C-c>", "<cmd>normal ciw<cr>a")
--
-- -- telescope <ctrl-r> in command line
-- -- vim.cmd([[cmap <C-R> <Plug>(TelescopeFuzzyCommandSearch)]])

vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- makes * and # work on visual mode too.
vim.cmd([[
  function! g:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction

  xnoremap * :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call g:VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]])
vim.keymap.set("n", "<TAB>", "<cmd> BufferLineCycleNext <CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")

local leader = {
  b = {
    name = "+buffer",
    a = { "<cmd>BufferLinePick <CR>", "Pick buffer" },
    b = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
    D = { "<cmd>:bd<CR>", "Delete Buffer & Window" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    t = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
    w = { "<cmd>Bwipeout <CR>", "Wipe out buffers" },
    x = { "<cmd>Bdelete <CR>", "Close buffer" },
  },

  e = {
    name = "+errors",
    x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
    t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
    tt = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo Trouble" },
    T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
    l = { "<cmd>lopen<cr>", "Open Location List" },
    q = { "<cmd>copen<cr>", "Open Quickfix List" },
  },

  f = {
    name = "+file",
    b = { "<cmd>Telescope file_browser<CR>", "Browse Files" },
    d = { "<cmd>Telescope find_files hidden=true<cr>", "Find Dot File" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope command_history<cr>", "Command History" },
    m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
    n = { "<cmd>enew<cr>", "New File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = {
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        })
      end,
      "Goto Symbol",
    },
    w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  },

  g = {
    name = "+git",
    l = {
      function()
        require("util").float_terminal("lazygit", { border = "none" })
      end,
      "LazyGit",
    },
  },

  -- ["h"] = {
  --   name = "+help",
  --   t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
  --   c = { "<cmd>:Telescope commands<cr>", "Commands" },
  --   h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
  --   m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
  --   k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
  --   s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
  --   l = { vim.show_pos, "Highlight Groups at cursor" },
  --   f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
  --   o = { "<cmd>:Telescope vim_options<cr>", "Options" },
  --   a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
  -- },

  -- configured in lsp/keys
  l = {
    name = "+code",
  },

  m = {
    name = "+noice",
  },

  ["n"] = { "<cmd> NvimTreeToggle <CR>", "Nvimtree" },
  -- ["n"] = { "<cmd>Neotree toggle<cr>", "NeoTree" },

  t = {
    name = "toggle",
    f = {
      require("plugins.lsp.formatting").toggle,
      "Format on Save",
    },
    s = {
      function()
        util.toggle("spell")
      end,
      "Spelling",
    },
    w = {
      function()
        util.toggle("wrap")
      end,
      "Word Wrap",
    },
    n = {
      function()
        util.toggle("relativenumber", true)
        util.toggle("number")
      end,
      "Line Numbers",
    },
  },
  ["w"] = {
    name = "+windows",
    ["w"] = { "<C-W>p", "other-window" },
    ["d"] = { "<C-W>c", "delete-window" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["|"] = { "<C-W>v", "split-window-right" },
    ["2"] = { "<C-W>v", "layout-double-columns" },
    ["H"] = { "<C-W>5<", "expand-window-left" },
    ["J"] = { ":resize +5", "expand-window-below" },
    ["L"] = { "<C-W>5>", "expand-window-right" },
    ["K"] = { ":resize -5", "expand-window-up" },
    ["="] = { "<C-W>=", "balance-window" },
    ["s"] = { "<C-W>s", "split-window-below" },
    ["v"] = { "<C-W>v", "split-window-right" },
  },
  z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
}

for i = 0, 10 do
  leader[tostring(i)] = "which_key_ignore"
end

wk.register(leader, { prefix = "<leader>" })

wk.register({ g = { name = "+goto" } })
