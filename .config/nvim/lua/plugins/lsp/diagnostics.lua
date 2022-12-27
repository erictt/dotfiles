local M = {}

M.signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

function M.setup()
  -- Automatically update diagnostics
  vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

  -- vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
  --   local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  --   vim.diagnostic.reset(ns)
  --   return vim.NIL
  -- end

  for type, icon in pairs(M.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.api.nvim_command("hi DiagnosticError guifg=#ea6962")
  vim.api.nvim_command("hi DiagnosticWarn guifg=#d8a657")
  vim.api.nvim_command("hi DiagnosticHint guifg=#a9b665")
  vim.api.nvim_command("hi DiagnosticInfo guifg=#53d0f0")
end

return M
