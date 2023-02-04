return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    "mason.nvim",
    "jayp0521/mason-null-ls.nvim",
    -- "nvim-lua/plenary.nvim",
    -- "nvim-treesitter/nvim-treesitter",
    -- "ThePrimeagen/refactoring.nvim",
  },
  config = function()
    local nls = require("null-ls")

    local sources = {
      -- html and markdown
      nls.builtins.formatting.prettier.with({ filetypes = { "html", "yaml", "json" } }),
      -- markdown
      nls.builtins.formatting.markdownlint,
      nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.code_actions.proselint,

      -- Lua
      nls.builtins.formatting.stylua,
      nls.builtins.diagnostics.selene.with({
        condition = function(utils)
          return utils.root_has_file({ "selene.toml" })
        end,
      }),

      -- php
      nls.builtins.formatting.phpcsfixer,
      nls.builtins.diagnostics.phpstan,

      -- c, cpp
      nls.builtins.formatting.clang_format.with({ filetypes = { "cpp", "c", "cs", "cuda" } }),
      nls.builtins.diagnostics.cppcheck,

      -- javascript, typescript
      nls.builtins.formatting.eslint_d,
      nls.builtins.diagnostics.eslint_d,
      nls.builtins.code_actions.eslint_d,
      -- nls.builtins.diagnostics.tsc,

      -- shell
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.code_actions.shellcheck,

      -- python
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.formatting.yapf,
      nls.builtins.diagnostics.pylint,

      -- refactoring
      -- nls.builtins.code_actions.refactoring,
    }

    -- require("refactoring").setup({})

    nls.setup({
      debounce = 150,
      save_after_format = false,
      sources = sources,
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
    })
    require("mason-null-ls").setup({ automatic_installation = true })
  end,
}
