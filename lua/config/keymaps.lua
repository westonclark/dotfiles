-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- set leader w to save file
--
vim.keymap.set({ "i", "x", "n", "s" }, "<Esc>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>w", "<Cmd>bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "K", ":move -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "J", ":move +1<CR>", { noremap = true, silent = true })
