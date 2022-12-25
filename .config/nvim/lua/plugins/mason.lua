local M = {
  "williamboman/mason.nvim",
}

M.tools = {
  "prettierd",
  
	"lua-language-server", -- lua lsp
  "stylua", -- lua formatter
  "selene",
  "luacheck", -- lua

  "shellcheck", -- shell script analyser
  "shfmt", -- shell format

  "eslint_d", -- javascript, typescript 
  "deno", -- javascript, typescript defaults

  "clang-format", -- c, cpp
  "clangd", -- c, cpp

	"intelephense", -- php lsp
	"php-cs-fixer", -- php formatter

  "black", -- python formatter
  "yapf", -- python formatter
  "pylint", --python static code analyser
  "pyright", -- python static type checker
  "isort", -- python sort imports
}

function M.check()
  local mr = require("mason-registry")
  for _, tool in ipairs(M.tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

function M.config()
  require("mason").setup()
  M.check()
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })
end

return M
