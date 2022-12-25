vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

vim.env.PATH = vim.env.PATH .. ":" .. fn.stdpath "data" .. "/mason/bin"

-- setup packer + plugins
if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  -- install plugins + compile their configs
  vim.cmd [[packadd packer.nvim]]
  require "plugins"
  vim.cmd [[PackerSync]]

  -- install binaries from mason.nvim & tsparsers
  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
      vim.cmd "bw | MasonInstallAll" -- close packer window
      -- vim.cmd "bw" -- close packer window
      require("packer").loader "nvim-treesitter"
    end,
  })
end

require "core.options"
require("core.utils").load_mappings()
