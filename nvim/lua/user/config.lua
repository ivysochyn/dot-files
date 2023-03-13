-- Disable mouse mode
vim.opt.mouse = ''

-- Remap leader to comma
vim.g.mapleader = ','

-- Set tabstop to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Save history
vim.opt.history = 1000
vim.opt.undofile = true

-- Enable line numbers
vim.opt.number = true

-- Macro to remove trailing whitespace mapped to <leader><F4>
vim.keymap.set('n', '<leader><F4>', ':%s/\\s\\+$//e<CR>', {noremap = true})

-- Colorscheme
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

vim.cmd('colorscheme peaksea')
