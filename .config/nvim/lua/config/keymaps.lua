-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

----------------------------------------------------
-- 1. Map 'jk' and 'kj' to <Esc> in Insert Mode
----------------------------------------------------
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode" })

----------------------------------------------------
-- 2. Command Palette (Search all Neovim commands)
----------------------------------------------------
-- Space + : is standard, but you can also bind Space + c p (Command Palette)
map("n", "<leader>cp", "<cmd>Telescope commands<cr>", { desc = "Search All Commands" })

----------------------------------------------------
-- 3. Keybindings Cheatsheet (Search all Keymaps)
----------------------------------------------------
-- Search every active shortcut and description in real-time
map("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Search All Keymaps" })
