local P = { 'neovim/nvim-lspconfig', commit = '41a826947eefbc7b59cc80cef405cce9ea6d82b8' }
P.requires = {
  { 'williamboman/nvim-lsp-installer', commit = '087863896458195a7337475c66409e1ab5f5e802' },
  { 'jose-elias-alvarez/null-ls.nvim', commit = 'dd169992b598d5615aea5dc1903b4556a7b32423' },
}

P.config = function ()
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  require('plugins.lsp.configure')
  require("plugins.lsp.null-ls")
end

return P
