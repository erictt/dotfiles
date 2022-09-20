local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local options = {
  -- icons = false,
  options = {
    numbers = "ordinal",
    theme = "gruvbox-material",
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = "thick",
    always_show_bufferline = true,
    custom_filter = function(buf_number, buf_numbers)

      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
  }
}

bufferline.setup(options)
