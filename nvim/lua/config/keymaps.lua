-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- `noremap = true`：表示非递归映射。即在映射中不会再进行二次映射，防止无限递归。
-- `silent = true`：表示执行映射时不显示命令行信息，保持安静。
map("i", "jj", "<Esc>", { noremap = true, silent = true })
map("i", "jk", "<Esc>:w<CR>", { noremap = true, silent = true })
map("n", "<leader>wa", ":wa<CR>", { desc = "Write All", noremap = true, silent = true })
map("n", "q", "<Nop>") -- 禁用 q 键宏录制
