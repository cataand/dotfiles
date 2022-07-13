local options = {
  number = true,
  relativenumber = true,

  swapfile = false,
  undofile = true,
  hidden = true,
  backup = false,

  incsearch = true,
  hlsearch = false,

  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  smartindent = true,

  fileencoding = 'utf-8',
  wrap = false,
  scrolloff = 8,
  signcolumn = 'yes',
  colorcolumn = '80',
  updatetime = 300,
  termguicolors = true,
  pumheight = 10,
  autoread = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
