local builtin = require('telescope.builtin')
-- Regular fuzzy finder on '<leader>ff'
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Fuzzy finder for git files on '<leader>fg'
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
