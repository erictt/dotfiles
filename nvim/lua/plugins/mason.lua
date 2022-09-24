local present, mason = pcall(require, "mason")

if not present then
	return
end

local options = {
	ensure_installed = {
		"lua-language-server",
		"stylua", -- lua

		"editorconfig-checker",

		"intelephense", -- php lsp
		"php-cs-fixer", -- php formater

		"prettierd", -- html, yaml, markdown
    "eslint-lsp", -- javascsript, typescript

    "clang-format", -- c, cpp
    "clangd", -- c, cpp

    "black",

    "yapf", -- python
    "pylint", --python
    "pyright", -- python
	}, -- not an option from mason.nvim

	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason.setup(options)
