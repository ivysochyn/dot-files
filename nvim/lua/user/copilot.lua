-- Enable copilot for specific filetypes
vim.g.copilot_filetypes = {
    gitcommit = true,
    markdown = true,
    yaml = true
}

-- Map <C-\> to toggle copilot
vim.g.copilot_enabled = false
-- Set <C-\> to toggle g:copilot_enabled variable and send message to status line
vim.keymap.set({'i', 'n'}, '<C-\\>', '<Cmd>lua vim.g.copilot_enabled = not vim.g.copilot_enabled<CR><Cmd>echo "Toggled"<CR>', { noremap = true, silent = true })

-- Map <C-]> to <Plug>(copilot-next) and <C-[> to <Plug>(copilot-prev)
vim.api.nvim_set_keymap('i', '<C-]>', '<Plug>(copilot-next)', { noremap = true, silent = false })
