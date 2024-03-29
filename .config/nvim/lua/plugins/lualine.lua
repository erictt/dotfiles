local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  -- dependencies = {
  --   "arkav/lualine-lsp-progress",
  -- },
}

local function clock()
  return " " .. os.date("%H:%M")
end

function M.config()
  if vim.g.started_by_firenvim then
    return
  end

  local colors = require("settings").colors

  require("lualine").setup({
    options = {
      theme = "auto",
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      icons_enabled = true,
      globalstatus = true,
      disabled_filetypes = { statusline = { "alpha", "dashboard", "lazy" } },
    },
    sections = {
      -- lualine_a = { { "mode", separator = { left = "" } } },
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          -- sources = { "nvim_lsp", "nvim_diagnostic" },
          sections = { "error", "warn", "info", "hint" },
          diagnostics_color = {
            error = { fg = colors.error },
            warning = { fg = colors.warning },
            info = { fg = colors.info },
            hint = { fg = colors.hint },
          },
          colored = true, -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false, -- Show diagnostics even if there are none.
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        {
          function()
            local navic = require("nvim-navic")
            navic.setup({
              depth_limit = 3,
              -- depth_limit_indicator = "..",
            })
            local ret = navic.get_location()
            return ret:len() > 2000 and "navic error" or ret
          end,
          cond = function()
            if package.loaded["nvim-navic"] then
              local navic = require("nvim-navic")
              return navic.is_available()
            end
          end,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_x = {
        {
          -- Custom component to display macro recording status
          function()
            local recording = vim.fn.reg_recording()
            if recording ~= "" then
              return "[" .. recording .. "]"
            else
              return ""
            end
          end,
          color = { fg = "#ebdbb2" }, -- Customize color as needed
          padding = { left = 1, right = 1 }, -- Customize padding as needed
        },
        {
          "searchcount",
          maxcount = 999,
          timeout = 500,
        },
        { "selectioncount" },
        -- {
        --   function()
        --     return require("noice").api.status.command.get()
        --   end,
        --   cond = function()
        --     if package.loaded["noice"] then
        --       return require("noice").api.status.command.has()
        --     end
        --   end,
        --   color = { fg = "#ff9e64" },
        -- },
        -- {
        --   function()
        --     return require("noice").api.status.mode.get()
        --   end,
        --   cond = function()
        --     if package.loaded["noice"] then
        --       return require("noice").api.status.mode.has()
        --     end
        --   end,
        --   color = { fg = "#ff9e64" },
        -- },
        -- {
        --   function()
        --     return require("noice").api.status.search.get()
        --   end,
        --   cond = function()
        --     if package.loaded["noice"] then
        --       return require("noice").api.status.search.has()
        --     end
        --   end,
        --   color = { fg = "#ff9e64" },
        -- },
        {
          function()
            return require("dashboard").status()
          end,
        },
      },
      lualine_z = { "location" },
      -- lualine_z = { { clock, separator = { right = "" } } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    -- winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { "filename" },
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    --
    -- inactive_winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { "filename" },
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    extensions = { "nvim-tree", "neo-tree" },
  })
end

return M
