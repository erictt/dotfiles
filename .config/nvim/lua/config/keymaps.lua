-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

vim.keymap.set("n", "<TAB>", "<cmd> BufferLineCycleNext <CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
-- map("n", "<leader>c", "<cmd>normal gcc<cr><bs>", { desc = "Comment the line" })
