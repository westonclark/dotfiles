-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- set leader w to save file
vim.keymap.set({ "i", "x", "n", "s" }, "<leader>w", ":w<CR>", { noremap = true, silent = true })
