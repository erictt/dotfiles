return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  config = function()
    local nls = require("null-ls")

    local sources = {
      -- html and markdown
      nls.builtins.formatting.prettierd.with({ filetypes = { "html", "yaml", "markdown", "json" } }),
      -- markdown diagnostic
      -- nls.builtins.diagnostics.markdownlint,

      -- Lua
      nls.builtins.formatting.stylua,
      -- nls.builtins.diagnostics.selene.with({
      --   condition = function(utils)
      --     return utils.root_has_file({ "selene.toml" })
      --   end,
      -- }),

      -- php
      nls.builtins.formatting.phpcsfixer,
      nls.builtins.diagnostics.phpstan,

      -- c, cpp
      nls.builtins.formatting.clang_format.with({ filetypes = { "cpp", "c", "cs", "cuda" } }),
      nls.builtins.diagnostics.cppcheck,

      -- javascript, typescript
      nls.builtins.formatting.eslint_d,
      -- nls.builtins.diagnostics.eslint_d,
      nls.builtins.code_actions.eslint_d,
      nls.builtins.diagnostics.tsc,

      -- python
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.formatting.yapf,
      nls.builtins.diagnostics.pylint,
    }

    nls.setup({
      debounce = 150,
      save_after_format = false,
      sources = sources,
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
    })
  end,
}
