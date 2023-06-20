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

-- Toggle expandtab with <S-Tab> (change 4 spaces to tab and vice versa)
local toggle_expandtab = function()
  if vim.opt.expandtab:get() then
    vim.opt.expandtab = false
  else
    vim.opt.expandtab = true
  end
end
vim.keymap.set('n', '<S-Tab>', toggle_expandtab, {noremap = true})

-- Display tabs as <---
vim.opt.list = true
vim.opt.listchars = "tab:<-"

-- Macro to remove trailing whitespace mapped to <leader><F4>
vim.keymap.set('n', '<leader><F4>', ':%s/\\s\\+$//e<CR>', {noremap = true})

-- Map <leader>lf to format the file
vim.keymap.set('n', '<leader>lf', ':Neoformat<CR>', {noremap = true})

-- Colorscheme
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

vim.cmd('colorscheme peaksea')

-- Disable markdown folding
vim.g.vim_markdown_folding_disabled = 1

-- Open at the same line number the file was closed at
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})

-- Lsp lines
require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = true,
})

-- Disable virtual lines on startup
vim.diagnostic.config({ virtual_lines = false })

-- Toggle lsp_lines with <leader>ll
vim.keymap.set(
  "",
  "<Leader>ll",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

local hfcc = require("hfcc")

hfcc.setup({
  -- parameters that are added to the request body
  query_params = {
    max_new_tokens = 60,
    temperature = 0.2,
    top_p = 0.95,
    stop_token = "<|endoftext|>",
  },
  -- set this if the model supports fill in the middle
  fim = {
    enabled = true,
    prefix = "<fim-prefix>",
    middle = "<fim-middle>",
    suffix = "<fim-suffix>",
  },
  debounce_ms = 80,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<S-Tab>",
})
