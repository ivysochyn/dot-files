-- Enable copilot for specific filetypes
vim.g.copilot_filetypes = {
    gitcommit = true,
    markdown = true,
    yaml = true
}

-- Map <C-\> to toggle copilot
vim.g.copilot_enabled = true
vim.api.nvim_set_keymap('n', '<C-\\>', ':let g:copilot_enabled = !g:copilot_enabled<CR>', { noremap = true, silent = false })

-- Map <C-]> to <Plug>(copilot-next) and <C-[> to <Plug>(copilot-prev)
vim.api.nvim_set_keymap('i', '<C-]>', '<Plug>(copilot-next)', { noremap = true, silent = false })
