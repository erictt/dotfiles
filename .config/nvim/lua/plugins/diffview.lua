local present, diffview = pcall(require, "diffview")

if not present then
  return
end

local options = {
  use_icons = true,
}

diffview.setup(options)
