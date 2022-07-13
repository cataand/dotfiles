local options = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)
-- Move selected text up and down and keep it selected
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", options)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", options)
