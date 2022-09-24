local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- format html and markdown
  b.formatting.prettierd.with({ filetypes = { "html", "yaml", "markdown", "javascript", "json", "typescript" } }),
  -- markdown diagnostic
  -- b.diagnostics.markdownlint,
  -- Lua formatting
  b.formatting.stylua.with({ filetypes = { "lua" } }),
  -- php formatting
  b.formatting.phpcsfixer.with({ filetypes = { "php" } }),

  -- javascript, typescript
  b.code_actions.eslint,
  b.diagnostics.eslint,

  -- c, cpp formatting
  b.diagnostics.cpplint.with({ filetypes = { "c", "cpp" } }),

  -- python
  b.formatting.yapf,
  b.diagnostics.pylint,

  -- work spell
  b.diagnostics.codespell,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
      --   -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      --   vim.lsp.buf.formatting_seq_sync()
      end,
    })
  end
end

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = on_attach,
})
