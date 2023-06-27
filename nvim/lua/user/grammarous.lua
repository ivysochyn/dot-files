-- Description: Grammarous configuration

-- Enable syntax and grammar check on <leader>g
vim.api.nvim_set_keymap('n', '<leader>g', ':set spell<CR>:GrammarousCheck<CR>', { noremap = true, silent = true })

-- Disable syntax and grammar check on <leader>gx
vim.api.nvim_set_keymap('n', '<leader>gx', ':set nospell<CR><Plug>(grammarous-reset)', { noremap = true, silent = true })

-- Map grammarous next error to <leader>gn
vim.api.nvim_set_keymap('n', '<leader>gn', '<Plug>(grammarous-move-to-next-error)', { noremap = true, silent = true })

-- Map grammarous previous error to <leader>gp
vim.api.nvim_set_keymap('n', '<leader>gp', '<Plug>(grammarous-move-to-previous-error)', { noremap = true, silent = true })

-- Map grammarous show error to <leader>gi
vim.api.nvim_set_keymap('n', '<leader>gi', '<Plug>(grammarous-open-info-window)', { noremap = true, silent = true })

-- Set grammarous to check only comments in all filetypes, but markdown and gitcommit
vim.cmd [[
    let g:grammarous#default_comments_only_filetypes = {
        \ '*': 1,
        \ 'markdown': 0,
        \ 'gitcommit': 0,
        \ }
]]

-- Overwrite the grammarous#jar_url variable
vim.cmd [[
    let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
]]

-- Disable grammarous rules
vim.cmd [[
    let g:grammarous#disabled_rules = {
        \ '*' : ['ARROWS', 'WHITESPACE_RULE']
        \ }
]]
