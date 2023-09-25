require('lint').linters_by_ft = {
  dockerfile = {'hadolint',},
}

vim.api.nvim_create_autocmd({ 'TextChanged', 'VimEnter', 'ModeChanged', 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
