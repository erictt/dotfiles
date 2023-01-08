vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.autowrite = true -- enable auto write
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.backup = true
vim.opt.spelllang = { "en" }

-- indent
local indent = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.softtabstop = indent

vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true -- Ignore case
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.mouse = "a" -- enable mouse mode

-- number
vim.opt.number = true -- Print line number
vim.opt.numberwidth = 2
vim.opt.ruler = false

vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 400
vim.opt.undofile = true

vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.guifont = "FiraCode Nerd Font:h11"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = false -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.laststatus = 0
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context

vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wrap = false -- Disable line wrap
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.g.markdown_recommended_style = 0 -- fix markdown indentation settings

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
end

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.o.shortmess = "filnxtToOFWIcC"
end
