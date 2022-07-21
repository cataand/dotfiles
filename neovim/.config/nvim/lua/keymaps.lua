local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)
-- Move selected text up and down and keep it selected
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", options)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", options)
