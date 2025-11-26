-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Save on esc and clear search highlights
vim.keymap.set({ "i", "x", "n", "s" }, "<Esc>", "<Esc>:noh | silent! w<CR>", { noremap = true, silent = true })

-- Close buffer with <Leader>w
vim.keymap.set("n", "<Leader>w", "<Cmd>bdelete<CR>", { noremap = true, silent = true })

-- Normal mode: move lines
vim.keymap.set("n", "K", ":move -2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "J", ":move +1<cr>", { noremap = true, silent = true })

-- Visual mode: move lines and maintain visual selection
vim.keymap.set("v", "K", ":move '<-2<cr>gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":move '>+1<cr>gv", { noremap = true, silent = true })
