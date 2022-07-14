local M = { 'nvim-telescope/telescope.nvim', commit = 'b79cd6c88b3d96b0f49cb7d240807cd59b610cd8'}
M.requires = {
  { 'nvim-lua/plenary.nvim', commit = '986ad71ae930c7d96e812734540511b4ca838aa2' },
  { 'BurntSushi/ripgrep', commit = 'e70778e89d6c2d516b0bd78f67f95a416ad6ad3c' }
}

M.config = function ()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', opts)

  local actions = require('telescope.actions')

  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-l>"] = actions.select_default,
        },
        n = {
          ["l"] = actions.select_default,
        },
      },
    },
  })
end

return M
