local wk = require("which-key")

local M = {}

function M.setup(client, buffer)
  local cap = client.server_capabilities

  local keymap = {
    buffer = buffer,
    ["<leader>"] = {
      c = {
        name = "+code",
        {
          cond = client.name == "tsserver",
          o = { "<cmd>:TypescriptOrganizeImports<CR>", "Organize Imports" },
          R = { "<cmd>:TypescriptRenameFile<CR>", "Rename File" },
        },
        a = {
          { vim.lsp.buf.code_action, "Code Action" },
          { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
        },
        d = { vim.diagnostic.open_float, "Line Diagnostics" },
        f = {
          {
            require("plugins.lsp.formatting").format,
            "Format Document",
            cond = cap.documentFormatting,
          },
          {
            require("plugins.lsp.formatting").format,
            "Format Range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        r = {
          function()
            require("inc_rename")
            return ":IncRename " .. vim.fn.expand("<cword>")
          end,
          "Rename",
          cond = cap.renameProvider,
          expr = true,
        },
      },
    },
    g = {
      name = "+goto",
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Definition" },
      r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
      R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
      I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
      x = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
      -- p = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
    ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next Error" },
    ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev Error" },
    ["[w"] = {
      "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
      "Next Warning",
    },
    ["]w"] = {
      "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
      "Prev Warning",
    },
  }

  wk.register(keymap)
end

return M
