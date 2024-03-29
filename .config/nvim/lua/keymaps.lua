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
vim.keymap.set(
  "n",
  "<leader>/",
  "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
  { desc = "Comment line" }
)
vim.keymap.set(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment block" }
)

vim.keymap.set("n", "<TAB>", "<cmd> BufferLineCycleNext <CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")

-- better up/down
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Move to window using the movement keys
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")

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

-- Easier pasting
vim.keymap.set("n", "[p", ":pu!<cr>")
vim.keymap.set("n", "]p", ":pu<cr>")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("n", "gw", "*N")
vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- -- Add undo break-points
-- vim.keymap.set("i", ",", ",<c-g>u")
-- vim.keymap.set("i", ".", ".<c-g>u")
-- vim.keymap.set("i", ";", ";<c-g>u")

-- better indenting
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

local leader = {
  b = {
    name = "+buffer",
    a = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
    b = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
    D = { "<cmd>:bd<CR>", "Delete Buffer & Window" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    p = { "<cmd>BufferLinePick <CR>", "Pick buffer" },
    w = { "<cmd>bwipeout <CR>", "Wipe out buffers" },
    x = { "<cmd>Bdelete <CR>", "Close buffer" },
    k = { "<cmd>bufdo :bdelete <CR>", "Close Tab" },
  },
  x = { "<cmd>Bdelete <CR>", "Wipe out buffer" },

  d = {
    name = "+debug",
  },

  e = {
    name = "+errors",
    x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
    t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
    -- tt = { "<cmd>TodoTrouble keywords=TODO,NOTE,FIX,FIXME<cr>", "Todo Trouble" },
    T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
    l = { "<cmd>lopen<cr>", "Open Location List" },
    q = { "<cmd>copen<cr>", "Open Quickfix List" },
  },

  -- f/r/p are defined in telescope plugin configuration so they can trigger loading the plugin
  f = {

    name = "+file",
    -- d = { "<cmd>Telescope find_files hidden=true<cr>", "Find Dot File" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    -- F = { util.telescope("find_files", { cwd = false }), "Find Files (cwd)" },
    h = { "<cmd>Telescope command_history<cr>", "Command History" },
    m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
    n = { "<cmd>enew<cr>", "New File" },
    -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    -- w = { util.telescope("live_grep", { cwd = false }), "Live Grep" },
    w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    -- W = { util.telescope("live_grep"), "Live Grep (cwd)" },
  },

  g = {
    "+git",
    g = {
      function()
        require("lazy.util").float_term({ "lazygit" })
      end,
      "LazyGit (cwd)",
    },
    G = {
      function()
        require("lazy.util").float_term({ "lazygit" }, { cwd = util.get_root() })
      end,
      "LazyGit (root dir)",
    },
  },

  i = {
    "+info",
    l = { "<cmd>Lazy<cr>", "Lazy" },
    m = { "<cmd>Mason<cr>", "Mason" },
    n = { "<cmd>NullLsInfo<cr>", "Null-ls" },
    p = { "<cmd>LspInfo<cr>", "Lsp" },
    k = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
  },

  l = {
    "+code",
  },
  m = {
    "+noice",
  },

  t = {
    name = "toggle",
    f = { require("plugins.lsp.formatting").toggle, "Format on Save" },
    d = { util.toggle_diagnostics, "Toggle diagnostics" },
    s = { util.toggle("spell"), "Spelling" },
    w = { util.toggle("wrap"), "Word Wrap" },
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
