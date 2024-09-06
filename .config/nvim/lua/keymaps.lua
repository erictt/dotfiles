---@diagnostic disable: missing-parameter

local wk = require("which-key")
local util = require("util")

vim.o.timeoutlen = 300

wk.setup({
  show_help = false,
  -- triggers = "auto",
  plugins = { spelling = true },
  replace = { ["<leader>"] = "," },
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

-- local leader =
-- {
--   b = {
--     name = "+buffer",
--     a = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
--     b = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
--     D = { "<cmd>:bd<CR>", "Delete Buffer & Window" },
--     s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
--     p = { "<cmd>BufferLinePick <CR>", "Pick buffer" },
--     w = { "<cmd>bwipeout <CR>", "Wipe out buffers" },
--     x = { "<cmd>Bdelete <CR>", "Close buffer" },
--     k = { "<cmd>bufdo :bdelete <CR>", "Close Tab" },
--   },
--   x = { "<cmd>Bdelete <CR>", "Wipe out buffer" },
--
--   d = {
--     name = "+debug",
--   },
--
--   e = {
--     name = "+errors",
--     x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
--     t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
--     -- tt = { "<cmd>TodoTrouble keywords=TODO,NOTE,FIX,FIXME<cr>", "Todo Trouble" },
--     T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
--     l = { "<cmd>lopen<cr>", "Open Location List" },
--     q = { "<cmd>copen<cr>", "Open Quickfix List" },
--   },
--
--   -- f/r/p are defined in telescope plugin configuration so they can trigger loading the plugin
--   f = {
--
--     name = "+file",
--     -- d = { "<cmd>Telescope find_files hidden=true<cr>", "Find Dot File" },
--     f = { "<cmd>Telescope find_files<cr>", "Find File" },
--     -- F = { util.telescope("find_files", { cwd = false }), "Find Files (cwd)" },
--     h = { "<cmd>Telescope command_history<cr>", "Command History" },
--     m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
--     n = { "<cmd>enew<cr>", "New File" },
--     -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--     -- w = { util.telescope("live_grep", { cwd = false }), "Live Grep" },
--     w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
--     -- W = { util.telescope("live_grep"), "Live Grep (cwd)" },
--   },
--
--   g = {
--     "+git",
--     g = {
--       function()
--         require("lazy.util").float_term({ "lazygit" })
--       end,
--       "LazyGit (cwd)",
--     },
--     G = {
--       function()
--         require("lazy.util").float_term({ "lazygit" }, { cwd = util.get_root() })
--       end,
--       "LazyGit (root dir)",
--     },
--   },
--
--   i = {
--     "+info",
--     l = { "<cmd>Lazy<cr>", "Lazy" },
--     m = { "<cmd>Mason<cr>", "Mason" },
--     n = { "<cmd>NullLsInfo<cr>", "Null-ls" },
--     p = { "<cmd>LspInfo<cr>", "Lsp" },
--     k = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
--     M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--     o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
--   },
--
--   l = {
--     "+code",
--   },
--   m = {
--     "+noice",
--   },
--
--   t = {
--     name = "toggle",
--     f = { require("plugins.lsp.formatting").toggle, "Format on Save" },
--     d = { util.toggle_diagnostics, "Toggle diagnostics" },
--     -- s = { util.toggle("spell"), "Spelling" },
--     -- w = { util.toggle("wrap"), "Word Wrap" },
--     n = {
--       function()
--         util.toggle("relativenumber", true)
--         util.toggle("number")
--       end,
--       "Line Numbers",
--     },
--   },
--
--   ["w"] = {
--     name = "+windows",
--     ["w"] = { "<C-W>p", "other-window" },
--     ["d"] = { "<C-W>c", "delete-window" },
--     ["-"] = { "<C-W>s", "split-window-below" },
--     ["|"] = { "<C-W>v", "split-window-right" },
--     ["2"] = { "<C-W>v", "layout-double-columns" },
--     ["H"] = { "<C-W>5<", "expand-window-left" },
--     ["J"] = { ":resize +5", "expand-window-below" },
--     ["L"] = { "<C-W>5>", "expand-window-right" },
--     ["K"] = { ":resize -5", "expand-window-up" },
--     ["="] = { "<C-W>=", "balance-window" },
--     ["s"] = { "<C-W>s", "split-window-below" },
--     ["v"] = { "<C-W>v", "split-window-right" },
--   },
--   z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
-- }

-- for i = 0, 10 do
--   leader[tostring(i)] = "which_key_ignore"
-- end
--
-- wk.register(leader, { prefix = "<leader>" })

local leader = {
  { "<leader>0", hidden = true },
  { "<leader>1", hidden = true },
  { "<leader>10", hidden = true },
  { "<leader>2", hidden = true },
  { "<leader>3", hidden = true },
  { "<leader>4", hidden = true },
  { "<leader>5", hidden = true },
  { "<leader>6", hidden = true },
  { "<leader>7", hidden = true },
  { "<leader>8", hidden = true },
  { "<leader>9", hidden = true },
  { "<leader>b", group = "buffer" },
  { "<leader>bD", "<cmd>:bd<CR>", desc = "Delete Buffer & Window" },
  { "<leader>ba", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
  { "<leader>bb", "<cmd>:e #<cr>", desc = "Switch to Other Buffer" },
  { "<leader>bk", "<cmd>bufdo :bdelete <CR>", desc = "Close Tab" },
  { "<leader>bp", "<cmd>BufferLinePick <CR>", desc = "Pick buffer" },
  { "<leader>bs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
  { "<leader>bw", "<cmd>bwipeout <CR>", desc = "Wipe out buffers" },
  { "<leader>bx", "<cmd>Bdelete <CR>", desc = "Close buffer" },
  { "<leader>d", group = "debug" },
  { "<leader>e", group = "errors" },
  { "<leader>eT", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
  { "<leader>el", "<cmd>lopen<cr>", desc = "Open Location List" },
  { "<leader>eq", "<cmd>copen<cr>", desc = "Open Quickfix List" },
  { "<leader>et", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
  { "<leader>ex", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble" },
  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fh", "<cmd>Telescope command_history<cr>", desc = "Command History" },
  { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
  { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>g", desc = "+git" },
  {
    "<leader>gG",
    function()
      require("lazy.util").float_term({ "lazygit" })
    end,
    desc = "LazyGit (root dir)",
  },
  {
    "<leader>gg",
    function()
      require("lazy.util").float_term({ "lazygit" }, { cwd = util.get_root() })
    end,
    desc = "LazyGit (cwd)",
  },
  { "<leader>i", desc = "+info" },
  { "<leader>iM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>ik", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
  { "<leader>il", "<cmd>Lazy<cr>", desc = "Lazy" },
  { "<leader>im", "<cmd>Mason<cr>", desc = "Mason" },
  { "<leader>in", "<cmd>NullLsInfo<cr>", desc = "Null-ls" },
  { "<leader>io", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
  { "<leader>ip", "<cmd>LspInfo<cr>", desc = "Lsp" },
  { "<leader>l", desc = "+code" },
  { "<leader>m", desc = "+noice" },
  { "<leader>t", group = "toggle" },
  { "<leader>td", util.toggle_diagnostics, desc = "Toggle diagnostics" },
  { "<leader>tf", require("plugins.lsp.formatting").toggle, desc = "Format on Save" },
  {
    "<leader>tn",
    function()
      util.toggle("relativenumber", true)
      util.toggle("number")
    end,
    desc = "Line Numbers",
  },
  { "<leader>w", group = "windows" },
  { "<leader>w-", "<C-W>s", desc = "split-window-below" },
  { "<leader>w2", "<C-W>v", desc = "layout-double-columns" },
  { "<leader>w=", "<C-W>=", desc = "balance-window" },
  { "<leader>wH", "<C-W>5<", desc = "expand-window-left" },
  { "<leader>wJ", ":resize +5", desc = "expand-window-below" },
  { "<leader>wK", ":resize -5", desc = "expand-window-up" },
  { "<leader>wL", "<C-W>5>", desc = "expand-window-right" },
  { "<leader>wd", "<C-W>c", desc = "delete-window" },
  { "<leader>ws", "<C-W>s", desc = "split-window-below" },
  { "<leader>wv", "<C-W>v", desc = "split-window-right" },
  { "<leader>ww", "<C-W>p", desc = "other-window" },
  { "<leader>w|", "<C-W>v", desc = "split-window-right" },
  { "<leader>x", "<cmd>Bdelete <CR>", desc = "Wipe out buffer" },
  { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
}
wk.add(leader)
