--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.colorscheme = "gruvbox-material"
lvim.debug = false
vim.lsp.set_log_level "warn"
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- lvim.builtin.bufferline.options.mode = "tabs"
-- lvim.builtin.bufferline.options.mode = "tabs" -- set to "tabs" to only show tabpages instead
lvim.builtin.bufferline.options.numbers = "ordinal"
lvim.builtin.bufferline.options.theme = "gruvbox-material"
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.bufferline.options.show_buffer_close_icons = false
lvim.builtin.bufferline.options.separator_style = "thick"
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.options.custom_filter = function(buf_number, buf_numbers)

  -- filter out filetypes you don't want to see
  if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    return true
  end
  -- filter out by buffer name
  if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    return true
  end
  -- filter out based on arbitrary rules
  -- e.g. filter out vim wiki buffer from tabline in your work repo
  if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    return true
  end
  -- filter out by it's index number in list (don't show first buffer)
  if buf_numbers[1] ~= buf_number then
    return true
  end
end


lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.theme = "gruvbox-material"
-- lvim.builtin.lualine.sections.lualine_z = { "location" }
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
lvim.builtin.lualine.sections.lualine_b = { 'branch', 'diff',
  { 'diagnostics',
    sources = { 'nvim_lsp', 'nvim_diagnostic' },
    sections = { 'error', 'warn', 'info', 'hint' },
    diagnostics_color = {
      -- Same values as the general color option can be used here.
      error = { fg = '#ea6962'}, -- Changes diagnostics' error color.
      warn = { fg = '#d8a657'}, -- Changes diagnostics' error color.
      info = { fg = '#7daea3'}, -- Changes diagnostics' error color.
      hint = { fg = '#a9b665'}, -- Changes diagnostics' error color.
    },
    colored = true, -- Displays diagnostics status in color if set to true.
    update_in_insert = false, -- Update diagnostics in insert mode.
    always_visible = false, -- Show diagnostics even if there are none.
  }
}
lvim.builtin.lualine.sections.lualine_c = { 'filename' }
lvim.builtin.lualine.sections.lualine_x = { "lsp", "filetype" }

-- Customization


-- =========================================
lvim.builtin.sell_your_soul_to_devil = { active = false, prada = false } -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
lvim.builtin.persistence = { active = true } -- change to false if you don't want persistence
lvim.builtin.presence = { active = false } -- change to true if you want discord presence
lvim.builtin.orgmode = { active = false } -- change to true if you want orgmode.nvim
lvim.builtin.dap.active = true -- change this to enable/disable debugging
lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline
lvim.builtin.fancy_wild_menu = { active = false } -- enable/disable cmp-cmdline
lvim.builtin.fancy_diff = { active = false } -- enable/disable fancier git diff
lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.test_runner = { active = true, runner = "ultest" } -- change this to enable/disable ultest or neotest
lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
lvim.builtin.sql_integration = { active = false } -- use sql integration
lvim.builtin.smooth_scroll = "cinnamon" -- for smoth scrolling, can be "cinnamon", "neoscroll" or ""
lvim.builtin.neoclip = { active = true, enable_persistent_history = false }
lvim.builtin.nonumber_unfocus = false -- diffrentiate between focused and non focused windows
lvim.builtin.custom_web_devicons = false -- install https://github.com/Nguyen-Hoang-Nam/mini-file-icons
lvim.builtin.harpoon = { active = true } -- use the harpoon plugin
lvim.builtin.remote_dev = { active = false } -- enable/disable remote development
lvim.builtin.cursorline = { active = false } -- use a bit fancier cursorline
lvim.builtin.motion_provider = "hop" -- change this to use different motion providers ( hop or lightspeed )
lvim.builtin.hlslens = { active = false } -- enable/disable hlslens
lvim.builtin.csv_support = false -- enable/disable csv support
lvim.builtin.sidebar = { active = false } -- enable/disable sidebar
lvim.builtin.async_tasks = { active = false } -- enable/disable async tasks
lvim.builtin.winbar_provider = "filename" -- can be "filename" or "treesitter" or ""
lvim.builtin.collaborative_editing = { active = false } -- enable/disable collaborative editing
lvim.builtin.file_browser = { active = false } -- enable/disable telescope file browser
lvim.builtin.sniprun = { active = false } -- enable/disable sniprun
lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
lvim.builtin.editorconfig = { active = true } -- enable/disable editorconfig
lvim.builtin.global_statusline = false -- set true to use global statusline
lvim.builtin.dressing = { active = false } -- enable to override vim.ui.input and vim.ui.select with telescope
lvim.builtin.refactoring = { active = false } -- enable to use refactoring.nvim code_actions
-- lvim.builtin.tmux_lualine = false -- use vim-tpipeline to integrate lualine and tmux

-- keymappings [view all the defaults by pressing <leader>Lk]
-- lvim.leader = "space"
lvim.leader = ","
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>n"] = "<cmd>NvimTreeToggle<CR>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>bp<CR>"
lvim.keys.normal_mode["<C-n>"] = "<cmd>bn<CR>"
lvim.keys.normal_mode["<leader>ba"] = "<cmd>Telescope buffers<CR>"
lvim.keys.normal_mode["zf"] = "<cmd>lua vim.lsp.buf.formatting()<CR>"
lvim.keys.normal_mode["z-"] = "<cmd>set nospell<CR>"
lvim.keys.normal_mode["zl"] = "<cmd>NvimTreeResize +10<CR>"
lvim.keys.normal_mode["zh"] = "<cmd>NvimTreeResize -10<CR>"
lvim.keys.normal_mode["<leader>g"] = ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"


-- lvim.keys.normal_mode["bx"] = "<cmd>bdelete<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
  -- any other extensions loading
end

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup = {
  -- actions = {
  --   change_dir = {
  --     global = true,
  --   },
  -- },
  open_on_tab = true,
  prefer_startup_root = true,
  open_on_setup = true,
  view = {
    side = "left",
    mappings = {
      list = {
        { key = "t", action = "tabnew" },
        { key = "u", action = "dir_up" },
        { key = "C", action = "cd" },
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "o", action = "<CR>" },
      },
    },
  },
  renderer = {
    icons = {
      show = {
        git = true,
      }
    }
  }
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
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
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- StatusLine
-- =========================================
-- if lvim.builtin.fancy_statusline.active then
--   -- require("user.lualine").config()
-- end

-- Debugging
-- -- =========================================
-- if lvim.builtin.dap.active then
--   require("user.dap").config()
-- end

-- Additional Plugins
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "sainnhe/gruvbox-material" },
  { "aserowy/tmux.nvim", config = function()
    require("tmux").setup({
      -- overwrite default configuration
      -- here, e.g. to enable default bindings
      copy_sync = {
        -- enables copy sync and overwrites all register actions to
        -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
        enable = true,
      },
      navigation = {
        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,
      },
      resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = true,
      }
    })
  end
  },
  --  { "folke/todo-comments.nvim", config = function()
  -- 		require("todo-comments").setup()
  -- 	end,
  -- },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "tiagovla/scope.nvim", config = function()
    require("scope").setup()
  end,
  }
  --     {"folke/tokyonight.nvim"},
  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
