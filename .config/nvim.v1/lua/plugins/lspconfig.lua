local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local M = {}
local utils = require("core.utils")

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  if vim.g.vim_version > 7 then
    -- nightly
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    -- stable
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  utils.load_mappings("lspconfig", { buffer = bufnr })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- lua
lspconfig.sumneko_lua.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

-- php
lspconfig.intelephense.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    intelephense = {
      files = {
        associations = { "*.php" },
      },
    },
  },
  root_dir = lspconfig.util.root_pattern(".git", "composer.json"),
})

-- c, c++
lspconfig.clangd.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    clangd = {
      files = {
        associations = { "*.c", "*.h", "*.cpp" },
      },
    },
  },
})

-- python
lspconfig.pyright.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    pyright = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    },
  },
  root_dir = lspconfig.util.root_pattern(".git"),
})

-- javascript, typescript
lspconfig.eslint.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    eslint = {
      javascript = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      },
      typescript = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    },
  },
  root_dir = lspconfig.util.root_pattern(".git", "package.json"),
})
return M
