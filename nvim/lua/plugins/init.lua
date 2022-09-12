local plugins = {

	["nvim-lua/plenary.nvim"] = { module = "plenary" },

	["lewis6991/impatient.nvim"] = {},

	["wbthomason/packer.nvim"] = {
		cmd = require("core.lazy_load").packer_cmds,
		config = function()
			require("plugins")
		end,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("indent-blankline.nvim")
			require("core.utils").load_mappings("blankline")
		end,
		config = function()
			require("plugins.configs.others").blankline()
		end,
	},

	["NvChad/nvim-colorizer.lua"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("nvim-colorizer.lua")
		end,
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	},

	["NvChad/nvterm"] = {
		module = "nvterm",
		config = function()
			require("plugins.configs.nvterm")
		end,
		setup = function()
			require("core.utils").load_mappings("nvterm")
		end,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		module = "nvim-treesitter",
		setup = function()
			require("core.lazy_load").on_file_open("nvim-treesitter")
		end,
		cmd = require("core.lazy_load").treesitter_cmds,
		run = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- git stuff
	["lewis6991/gitsigns.nvim"] = {
		ft = "gitcommit",
		setup = function()
			require("core.lazy_load").gitsigns()
		end,
		config = function()
			require("plugins.configs.others").gitsigns()
		end,
	},

	-- lsp stuff
	["williamboman/mason.nvim"] = {
		cmd = require("core.lazy_load").mason_cmds,
		config = function()
			require("plugins.configs.mason")
		end,
	},

	["neovim/nvim-lspconfig"] = {
		-- opt = true,
		-- setup = function()
		-- 	require("core.lazy_load").on_file_open("nvim-lspconfig")
		-- end,
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.null_ls")
		end,
	},

	-- load luasnips + cmp related in insert mode only

	["rafamadriz/friendly-snippets"] = {
		module = { "cmp", "cmp_nvim_lsp" },
		event = "InsertEnter",
	},

	["hrsh7th/nvim-cmp"] = {
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp")
		end,
	},

	["L3MON4D3/LuaSnip"] = {
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").luasnip()
		end,
	},

	["saadparwaiz1/cmp_luasnip"] = { after = "LuaSnip" },
	["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
	["hrsh7th/cmp-nvim-lsp"] = { after = "cmp-nvim-lua" },
	["hrsh7th/cmp-buffer"] = { after = "cmp-nvim-lsp" },
	["hrsh7th/cmp-path"] = { after = "cmp-buffer" },

	-- misc plugins
	["windwp/nvim-autopairs"] = {
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").autopairs()
		end,
	},

	["goolord/alpha-nvim"] = {
		config = function()
			require("plugins.configs.alpha")
		end,
	},

	["numToStr/Comment.nvim"] = {
		module = "Comment",
		keys = { "gc", "gb" },
		config = function()
			require("plugins.configs.others").comment()
		end,
		setup = function()
			require("core.utils").load_mappings("comment")
		end,
	},

	-- file managing , picker etc
	["kyazdani42/nvim-tree.lua"] = {
		ft = "alpha",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("plugins.configs.nvimtree")
		end,
		setup = function()
			require("core.utils").load_mappings("nvimtree")
		end,
	},

	["nvim-telescope/telescope.nvim"] = {
		cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
		setup = function()
			require("core.utils").load_mappings("telescope")
		end,
	},

	-- Only load whichkey after all the gui
	["folke/which-key.nvim"] = {
		module = "which-key",
		keys = "<leader>",
		config = function()
			require("plugins.configs.whichkey")
		end,
		setup = function()
			require("core.utils").load_mappings("whichkey")
		end,
	},

	["sainnhe/gruvbox-material"] = {},

	["gpanders/editorconfig.nvim"] = {},

	["nvim-lualine/lualine.nvim"] = {
		config = function()
			require("plugins.configs.lualine")
		end,
	},

	["akinsho/bufferline.nvim"] = {
		config = function()
			require("plugins.configs.bufferline")
		end,
		setup = function()
			require("core.utils").load_mappings("bufferline")
		end,
	},

	["tiagovla/scope.nvim"] = {
		after = "bufferline.nvim",
		config = function()
			local ok, scope = pcall(require, "scope")
			if ok then
				scope.setup()
			end
		end,
	},

	["christoomey/vim-tmux-navigator"] = {
		config = function()
			require("plugins.configs.tmux")
		end,
		-- setup = function()
		--   require("plugins.configs.tmux").load_mappings "tmux"
		-- end,
	},
}

-- Load all plugins
local present, packer = pcall(require, "packer")

if present then
	vim.cmd("packadd packer.nvim")

	plugins = require("core.utils").merge_plugins(plugins)

	-- load packer init options
	local init_options = require("plugins.configs.others").packer_init()
	packer.init(init_options)

	for _, v in pairs(plugins) do
		packer.use(v)
	end
end
